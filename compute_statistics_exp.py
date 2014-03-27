from util import *
import cPickle as pickle
import bsddb
import glob
import logging
import numpy as np
import os
import os.path
import sys
import scipy.misc
import skimage.io
from vlg.util.parfun import *
from scipy.io import *

from annotatedimage import *
from bbox import *
from heatmap import *
from configuration import *
from util import *
from stats import *

class Params:
    def __init__(self):
        # execute the extraction of the statistics from the images.
        # If false, we assumed that we did run the extraction before, and we
        # perform just the aggregation.
        self.run_stat_pipeline = True
        # list containing the desired number of subwindows per image to use
        # for the various plots that require this information.
        self.stats_using_num_pred_bboxes_image = []
        # delete the pred_objects from the AnnotatedImages, to save storage
        # and speed-up the unpickling
        self.delete_pred_objects = False
        # max num of subwindows generated per image (if 0, take them all)
        self.max_subwin = 0
        # calculate histogram overlap?
        self.calculate_histogram = True
    
def compute_statistics_exp(input_exp, output_exp, run_on_anthill = True, \
                             run_stat_pipeline = True, stats_per_class = True):
    """
    Computes the statistics for the exp input_exp and save in output_exp folder
    To generate the db results make sure that the run_stat_pipeline is True.
    - input_exp: name of the input exp, with the bbox results
    - output_exp: name of the output exp, where the statistics will be saved
    - run_on_anthill: if you want to run on the cluster
    - run_stat_pipeline: if you want to compute the stats (first time that you
                        run the script for a new dataset this has to be = True)
    """
    # load configurations and parameters  
    conf = Configuration()
    params = Params()
    # experiment name
    params.exp_name = output_exp
    # take results from here
    params.exp_name_input = input_exp
    # default Configuration, image and label files
    params.conf = conf
    # Intersection over Union threshold
    params.IoU_threshold = 0.5
    # create also some statistics using a variable number of predictions/image
    params.stats_using_num_pred_bboxes_image = range(1,16)
    params.stats_using_num_pred_bboxes_image.extend([20, 30, 50, 100, 200, \
                                                 500, 1000, 2000, 3000, 5000]) 
    # max num of subwindows generated per image (if 0, take them all)
    params.max_subwin = max(params.stats_using_num_pred_bboxes_image) 
    # delete the pred_objects from the AnnotatedImages
    params.delete_pred_objects = True
    # input/output directory
    params.output_dir = conf.experiments_output_directory \
                        + '/' + params.exp_name
    params.input_dir = conf.experiments_output_directory \
                        + '/' + params.exp_name_input 
    # parallelize the script on Anthill?
    params.run_on_anthill = run_on_anthill
    params.run_stat_pipeline = run_stat_pipeline
    # Set jobname in case the process stop or crush
    params.task = [0,10]
    logging.info('Started')
    # RUN THE EXPERIMENT
    if stats_per_class:
        run_exp_per_class(params)
    else:
        run_exp(params)


# === Stats considering all the GT bboxes (kept for back-compatibility) === #
def pipeline(inputdb, outputdb, params):
    """
    Run the pipeline for this experiment. images is a list of
    (wnid, image_filename), or the SAME CLASS (i.e. wnid is a constant).
    """
    # Instantiate some objects, and open the database
    conf = params.conf
    logging.info('outputdb: ' + outputdb)
    db_input = bsddb.btopen(inputdb, 'r')
    db_output = bsddb.btopen(outputdb, 'c')
    db_keys = db_input.keys()
    # loop over the images
    for image_key in db_keys:
        # get database entry
        anno = pickle.loads(db_input[image_key])
        logging.info('***** Elaborating statistics ' + \
                      os.path.basename(anno.image_name))
        # Flat Gt and Pred objects to BBoxes
        anno.set_stats()
        gt_bboxes, gt_lab = Stats.flat_anno_bboxes(anno.gt_objects)
        for classifier in anno.pred_objects.keys():
            pred_bboxes, pred_lab = Stats.flat_anno_bboxes( \
                                    anno.pred_objects[classifier])
            # Extract stats 
            stat_obj = Stats()
            stat_obj.compute_stats(pred_bboxes, gt_bboxes, \
                                   params.IoU_threshold, \
                                   max_subwin = params.max_subwin)
            anno.stats[classifier] = stat_obj
            # if requested, delete the pred-objects
            if params.delete_pred_objects:
                anno.pred_objects = {}
        # adding stats to the database
        value = pickle.dumps(anno, protocol=2)
        db_output[image_key] = value
        logging.info('End record')
    # write the database
    logging.info('Writing file ' + outputdb)
    db_output.sync()
    db_output.close()
    return 0

def run_exp(params):
    # create output directory
    if os.path.exists(params.output_dir) == False:
        os.makedirs(params.output_dir)
    imgs_output_dir = params.output_dir + '/imgs'
    if os.path.exists(imgs_output_dir) == False:
        os.makedirs(imgs_output_dir)
    mat_output_dir = params.output_dir + '/mat'
    if os.path.exists(mat_output_dir) == False:
        os.makedirs(mat_output_dir)
    # list the databases chuncks
    n_chunks = len(glob.glob(params.input_dir + '/*.db'))
    # run the pipeline
    parfun = None
    if params.run_on_anthill:
        jobname = 'Job{0}'.format(params.exp_name).replace('exp','')
        parfun = ParFunAnthill(pipeline, time_requested=1, \
            memory_requested=1, job_name=jobname)
    else:
        parfun = ParFunDummy(pipeline)
    if params.task==None or len(params.task)==0:
        idx_to_process = range(n_chunks)
    else:
        idx_to_process = params.task
    for i in idx_to_process:
        inputdb = params.input_dir + '/%05d'%i + '.db'
        outputfile = params.output_dir + '/%05d'%i
        outputdb = outputfile + '.db'
        parfun.add_task(inputdb, outputdb, params)
    if params.run_stat_pipeline:
        out = parfun.run()
        for i, val in enumerate(out):
            if val != 0:
                logging.info('Task {0} didn''t exit properly'.format(i))
    # collect the results, and save them under the directory 'imgs'
    logging.info('** Collecting stats **')
    stats_list = []
    for i in idx_to_process:
        outputdb = params.output_dir + '/%05d'%i + '.db'
        logging.info('Loading statistics from {0} ({1}/{2})'.format( \
                     outputdb, i, len(idx_to_process)))
        db_output = bsddb.btopen(outputdb, 'r')
        db_keys = db_output.keys()
        # loop over the images
        for image_key in db_keys:
            # get database entry
            anno = pickle.loads(db_output[image_key])
            # append stats
            assert len(anno.stats) == 1
            classifier = anno.stats.keys()[0]
            stats_list.append(anno.stats[classifier])
    # ** Aggregate results 
    logging.info('** Aggregating stats **')
    num_bins = 32
    if params.calculate_histogram:
        stats_aggr, hist_overlap = Stats.aggregate_results(stats_list, num_bins)
        # Figure: IoU histogram   (plt.hist(stats_aggr.overlap, num_bins))    
        plt.bar((hist_overlap[1][0:-1]+hist_overlap[1][1:])/2, hist_overlap[0], \
                width = 1/float(num_bins))
        #plt.hist(stats_aggr.overlap, num_bins)
        plt.title('IoU histogram')
        plt.xlabel('IoU overlap')
        plt.savefig(imgs_output_dir + '/hist_overlap.png')
        plt.savefig(imgs_output_dir + '/hist_overlap.pdf')
        plt.close()
    # ** Aggregating stats for variable number of subwindows per image
    if len(params.stats_using_num_pred_bboxes_image) > 0:
        recall_all = []
        precision_all = []
        average_precision_all = []
        for num_pred_bboxes in params.stats_using_num_pred_bboxes_image:
            logging.info('num_pred_bboxes: {0}'.format(num_pred_bboxes))
            stat_agg, hist_overlap = Stats.aggregate_results(\
                              stats_list, num_bins, num_pred_bboxes)
            recall_all.append(np.max(stat_agg.recall))
            precision_all.append(np.max(stat_agg.precision))
            average_precision_all.append(stat_agg.average_prec)
        assert len(recall_all) == len(params.stats_using_num_pred_bboxes_image)
        assert len(precision_all) == \
                    len(params.stats_using_num_pred_bboxes_image)
        assert len(average_precision_all) == \
                    len(params.stats_using_num_pred_bboxes_image)
        # Figure: recall vs numPredBboxesImage
        line, = plt.plot(params.stats_using_num_pred_bboxes_image,\
                         recall_all, \
                         '-', linewidth=2)
        plt.xlabel('number of predicted bboxes per image')
        plt.ylabel('recall')
        plt.savefig(imgs_output_dir + '/recall_vs_numPredBboxesImage.png')
        plt.savefig(imgs_output_dir + '/recall_vs_numPredBboxesImage.pdf')
        plt.close()
        # Save .mat file for visualization in matlab (use aggregate_results.m)
        savemat(mat_output_dir + '/recall_vs_numPredBboxesImage',\
                    {'recall': recall_all, \
                    'precision': precision_all, \
                    'x_values': params.stats_using_num_pred_bboxes_image, \
                    'average_precision': average_precision_all})
    # exit
    logging.info('End of the script')



# === Code to compute statistics for each class === #
def pipeline_per_class(inputdb, outputdb, params):
    """
    Run the pipeline for this experiment. It computes the statistics per class
    and for all the objects in a class.
    """
    # Instantiate some objects, and open the database
    conf = params.conf
    logging.info('outputdb: ' + outputdb)
    db_input = bsddb.btopen(inputdb, 'r')
    db_output = bsddb.btopen(outputdb, 'c')
    db_keys = db_input.keys()
    # loop over the images
    for image_key in db_keys:
        # get database entry
        anno = pickle.loads(db_input[image_key])
        logging.info('***** Elaborating statistics ' + \
                      os.path.basename(anno.image_name))
        # Flat Gt and Pred objects to BBoxes
        anno.set_stats()
        stat_obj = {}
        gt_bboxes, gt_lab = Stats.flat_anno_bboxes(anno.gt_objects)
        for classifier in anno.pred_objects.keys():
            # Get estimated bboxes 
            pred_bboxes, pred_lab = Stats.flat_anno_bboxes( \
                                    anno.pred_objects[classifier])
            # Extract stats for all the GT bboxes -> special keywords 'ALL'
            stat_obj['ALL'] = Stats()
            stat_obj['ALL'].compute_stats(pred_bboxes, gt_bboxes, \
                                    params.IoU_threshold, \
                                    max_subwin = params.max_subwin)
            # Extract stats PER CLASS
            for label in gt_lab:
                gt_bboxes_single_class = anno.gt_objects[label].bboxes
                stat_obj[label] = Stats()
                stat_obj[label].compute_stats(pred_bboxes, \
                                    gt_bboxes_single_class, \
                                    params.IoU_threshold, \
                                    max_subwin = params.max_subwin)
            anno.stats[classifier] = stat_obj
            # if requested, delete the pred-objects
            if params.delete_pred_objects:
                anno.pred_objects = {}
        # adding stats to the database
        value = pickle.dumps(anno, protocol=2)
        db_output[image_key] = value
        logging.info('End record')
    # write the database
    logging.info('Writing file ' + outputdb)
    db_output.sync()
    db_output.close()
    return 0

def run_exp_per_class(params):
    # create output directory
    if os.path.exists(params.output_dir) == False:
        os.makedirs(params.output_dir)
    imgs_output_dir = params.output_dir + '/imgs'
    if os.path.exists(imgs_output_dir) == False:
        os.makedirs(imgs_output_dir)
    mat_output_dir = params.output_dir + '/mat'
    if os.path.exists(mat_output_dir) == False:
        os.makedirs(mat_output_dir)
    # list the databases chuncks
    n_chunks = len(glob.glob(params.input_dir + '/*.db'))
    # run the pipeline
    parfun = None
    if params.run_on_anthill:
        jobname = 'Job{0}'.format(params.exp_name).replace('exp','')
        parfun = ParFunAnthill(pipeline_per_class, time_requested=1, \
            memory_requested=1, job_name=jobname)
    else:
        parfun = ParFunDummy(pipeline_per_class)
    if params.task==None or len(params.task)==0:
        idx_to_process = range(n_chunks)
    else:
        idx_to_process = params.task
    for i in idx_to_process:
        inputdb = params.input_dir + '/%05d'%i + '.db'
        outputfile = params.output_dir + '/%05d'%i
        outputdb = outputfile + '.db'
        parfun.add_task(inputdb, outputdb, params)
    if params.run_stat_pipeline:
        out = parfun.run()
        for i, val in enumerate(out):
            if val != 0:
                logging.info('Task {0} didn''t exit properly'.format(i))
    # collect the results, and save them under the directory 'imgs'
    logging.info('** Collecting stats **')
    stats_list = {}
    for i in idx_to_process:
        outputdb = params.output_dir + '/%05d'%i + '.db'
        logging.info('Loading statistics from {0} ({1}/{2})'.format( \
                     outputdb, i, len(idx_to_process)))
        db_output = bsddb.btopen(outputdb, 'r')
        db_keys = db_output.keys()
        # loop over the images
        for image_key in db_keys:
            # get database entry
            anno = pickle.loads(db_output[image_key])
            # append stats
            assert len(anno.stats) == 1
            classifier = anno.stats.keys()[0]
            for label in anno.stats[classifier].keys():
                if not(stats_list.has_key(label)): # init first time...
                    stats_list[label] = [anno.stats[classifier][label]]
                else: #... then append
                    stats_list[label].append(anno.stats[classifier][label])
    # ** Aggregate results 
    logging.info('** Aggregating stats **')
    num_bins = 32
    if params.calculate_histogram: # considers only the case of ALL gt!
        stats_aggr, hist_overlap = Stats.aggregate_results(stats_list['ALL'],\
                                                             num_bins)
        # Figure: IoU histogram   (plt.hist(stats_aggr.overlap, num_bins))    
        plt.bar((hist_overlap[1][0:-1]+hist_overlap[1][1:])/2, \
                            hist_overlap[0], width = 1/float(num_bins))
        #plt.hist(stats_aggr.overlap, num_bins)
        plt.title('IoU histogram')
        plt.xlabel('IoU overlap')
        plt.savefig(imgs_output_dir + '/hist_overlap.png')
        plt.savefig(imgs_output_dir + '/hist_overlap.pdf')
        plt.close()
    # ** Aggregating stats for variable number of subwindows per image
    if len(params.stats_using_num_pred_bboxes_image) > 0:
        recall_mean = np.zeros(len(params.stats_using_num_pred_bboxes_image))
        precision_mean = np.zeros(len(\
                                params.stats_using_num_pred_bboxes_image))      
        average_precision_mean = np.zeros(len(\
                                params.stats_using_num_pred_bboxes_image))
        ABO_mean = np.zeros(len(params.stats_using_num_pred_bboxes_image))
        recall_all = {}
        precision_all = {}
        average_precision_all = {}
        ABO_all = {}
        for label in stats_list.keys():
            recall_all[label] = []
            precision_all[label] = []
            average_precision_all[label] = []
            ABO_all[label] = []
            for num_pred_bboxes in params.stats_using_num_pred_bboxes_image:
                logging.info('num_pred_bboxes: {0}'.format(num_pred_bboxes))
                stat_agg, hist_overlap = Stats.aggregate_results(\
                              stats_list[label], num_bins, num_pred_bboxes)
                recall_all[label].append(np.max(stat_agg.recall))
                precision_all[label].append(np.max(stat_agg.precision))
                average_precision_all[label].append(stat_agg.average_prec)
                ABO_all[label].append(stat_agg.ABO)
            # Cumulative sum over classes
            if not(label=='ALL'): # exclude 'ALL'
                recall_mean += recall_all[label]
                precision_mean += precision_all[label]
                average_precision_mean += average_precision_all[label]
                ABO_mean += ABO_all[label]
            assert len(recall_all[label]) == \
                    len(params.stats_using_num_pred_bboxes_image)
            assert len(precision_all[label]) == \
                    len(params.stats_using_num_pred_bboxes_image)
            assert len(average_precision_all[label]) == \
                    len(params.stats_using_num_pred_bboxes_image)
        # actual mean
        recall_mean /= (len(stats_list.keys())-1)
        precision_mean /= (len(stats_list.keys())-1)
        average_precision_mean /= (len(stats_list.keys())-1)
        ABO_mean /= (len(stats_list.keys())-1)
        # Figure: recall vs numPredBboxesImage
        line, = plt.plot(params.stats_using_num_pred_bboxes_image,\
                         recall_mean, \
                         '-', linewidth=2)
        plt.xlabel('number of predicted bboxes per image')
        plt.ylabel('Mean Recall Per Class')
        plt.savefig(imgs_output_dir + '/recall_vs_numPredBboxesImage.png')
        plt.savefig(imgs_output_dir + '/recall_vs_numPredBboxesImage.pdf')
        plt.close()
        # Save .mat file for visualization in matlab (use aggregate_results.m)
        savemat(mat_output_dir + '/recall_vs_numPredBboxesImage',\
                    {'recall': recall_all['ALL'], \
                    'precision': precision_all['ALL'], \
                    'average_precision': average_precision_all['ALL'], \
                    'ABO': ABO_all['ALL'], \
                    'mean_recall': recall_mean, \
                    'mean_precision': precision_mean, \
                    'mean_ABO': ABO_mean, \
                    'mean_average_precision': average_precision_mean, \
                    'x_values': params.stats_using_num_pred_bboxes_image})
    # exit
    logging.info('End of the script')

