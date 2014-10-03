from util import *
import numpy as np
import os
import os.path
import skimage.io
from vlg.util.parfun import *

from configuration import *
from compute_statistics_exp import *
import exp31

if __name__ == "__main__":
    # load configurations and parameters
    conf = Configuration()
    params = exp31.Params()
    # hack to load the finetuned net
    conf.ilsvrc2012_caffe_model_spec = \
                './pascal_finetune_deploy_SingleInput.prototxt'
    conf.RCNN_models_dir = '/home/anthill/vlg/rcnn/data/caffe_nets'
    conf.ilsvrc2012_caffe_model = conf.RCNN_models_dir + \
                '/ilsvrc_2012_train_iter_310k'
    # experiment name
    params.exp_name = 'exp31_01'
    # input (GT AnnotatatedImages)
    params.exp_name_input = 'exp30_07stats_NMS_05'
    # Num elements in batch (for decaf/caffe eval)
    params.batch_sz = 1
    # default Configuration, image and label files
    params.conf = conf
    # select network: 'CAFFE' or 'DECAF'
    params.classifier = 'CAFFE'
    params.center_only = True
    # obfuscation search params
    params.use_fullimg_GT_label = False # if true params.topC is not used!
    # input/output directory
    params.output_dir = conf.experiments_output_directory \
                        + '/' + params.exp_name
    params.input_dir = conf.experiments_output_directory \
                        + '/' + params.exp_name_input
    # parallelize the script on Anthill?
    params.run_on_anthill = True
    # list of tasks to execute
    params.task = []
    logging.info('Started')
    # RUN THE EXPERIMENT
    if 1:
        exp31.run_exp(params)
    # RUN THE STATISTICS PIPELINE
    if 0:
        compute_statistics_exp(input_exp=params.exp_name)
    # RUN THE STATISTICS PIPELINE WITH NMS
    if 1:
        # NMS=0.5
        params_stats = ComputeStatParams(params.exp_name, 'stats_NMS_05')
        params_stats.nms_execution = True
        params_stats.nms_iou_threshold = 0.5
        params_stats.delete_pred_objects = False
        compute_statistics_exp(input_exp=params.exp_name, params=params_stats)
