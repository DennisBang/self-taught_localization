MATLAB.Color.yellow = [1 1 0];
MATLAB.Color.magenta = [1 0 1];
MATLAB.Color.orange = [0 1 1];
MATLAB.Color.cyan = [0 1 1]; % cyan
MATLAB.Color.cyanMed = [0 0.6 0.6]; % cyanMed
MATLAB.Color.cyanDark = [0 0.3 0.3]; % cyanDark
MATLAB.Color.red = [1 0 0];
MATLAB.Color.redMed = [0.6 0 0];
MATLAB.Color.redDark = [0.3 0 0];
MATLAB.Color.green = [0 1 0];
MATLAB.Color.blue = [0 0 1];
MATLAB.Color.white = [1 1 1];
MATLAB.Color.black = [0 0 0];
MATLAB.Color.orange = [255 150 0]./255;
MATLAB.Color.orangeLight = [255 170 0]./255;
MATLAB.Color.orangeMed = [255 140 0]./255;
MATLAB.Color.orangeDark = [255 110 0]./255;
MATLAB.Color.greenMed = [45 125 45]./255;
MATLAB.Color.greenDark = [22 62 22]./255; % green medium
MATLAB.Color.greyDark = [90 90 90]./255;
MATLAB.Color.greyMed = [160 160 160]./255;
MATLAB.Color.greyLight = [230 230 230]./255;
MATLAB.Color.orange2 = [225 122 0]./255; % orange
MATLAB.Color.brown = [128 64 0]./255; % brown
MATLAB.Color.brownLight = [255 128 0]./255; % brown light
MATLAB.Color.brownDark = [64 32 0]./255; % brown dark

% size and position of the figures
conf.figure_width = 900;
conf.figure_height = 600;
conf.figure_position = [1 1 conf.figure_width conf.figure_height];
conf.legend_position = [0.57 0.3 0.35 0.35];

% line width, marker size, font size
conf.lw = 3;
conf.ms = 12;
conf.fs = 19;
conf.figure_recall_xlabel = 'number of bboxes per image';
conf.figure_recall_ylabel = 'mean recall per class';
conf.figure_precision_xlabel = 'number of bboxes per image';
conf.figure_precision_ylabel = 'mean precision per class';

% EdgeBoxes
EDGEBOXES.color = MATLAB.Color.blue;
EDGEBOXES.marker = 'x';
EDGEBOXES.legend = 'EdgeBoxes [31]';

% MCG
MCG.color = MATLAB.Color.cyanMed;
MCG.marker = '*';
MCG.legend = 'MCG [3]';

% Selective Search
SS.color = MATLAB.Color.magenta;
SS.marker = '>';
SS.legend = 'Selective Search [28]';
% exp25_10 / average_precision *** Selective Search   **********
SS.average_precision = [ 0.160044, 0.153445, 0.353962, 0.306775, 0.105615, 0.146780, 0.301131, 0.120833, 0.103066, 0.070562, 0.410038, 0.070269, 0.000116, 0.217449, 0.215035, 0.151464, 0.204948, 0.152740, 0.217025, 0.246397, 0.114481, 0.327511, 0.189406, 0.223920, 0.382654, 0.120480, 0.298591, 0.249072, 0.103115, 0.341616, 0.337685, 0.084077, 0.002226, 0.369521, 0.319336, 0.222065, 0.140378, 0.230873, 0.373673, 0.084138, 0.185807, 0.018911, 0.041971, 0.257865, 0.106015, 0.135600, 0.138064, 0.001953, 0.337143, 0.129772, 0.343587, 0.323652, 0.245163, 0.164881, 0.264146, 0.124495, 0.196804, 0.176546, 0.000080, 0.234871, 0.105125, 0.222797, 0.171001, 0.133583, 0.278529, 0.002082, 0.242773, 0.206289, 0.284233, 0.305955, 0.262117, 0.000101, 0.042597, 0.001986, 0.078742, 0.188995, 0.293264, 0.239351, 0.248387, 0.161072, 0.138884, 0.194275, 0.183991, 0.372878, 0.056030, 0.009586, 0.094643, 0.032432, 0.094056, 0.592911, 0.140315, 0.103217, 0.113366, 0.113998, 0.297778, 0.213725, 0.090944, 0.019681, 0.319027, 0.085634, 0.288293, 0.091909, 0.006454, 0.001186, 0.201835, 0.323074, 0.412085, 0.062364, 0.251887, 0.073083, 0.152209, 0.145416, 0.274267, 0.406559, 0.184216, 0.100077, 0.199999, 0.036063, 0.219124, 0.232593, 0.151780, 0.166395, 0.169095, 0.125508, 0.000307, 0.171877, 0.175969, 0.010384, 0.279288, 0.172197, 0.314222, 0.140660, 0.071966, 0.492273, 0.028655, 0.118403, 0.118060, 0.138158, 0.027994, 0.230874, 0.078810, 0.198379, 0.164486, 0.079375, 0.120099, 0.082268, 0.368959, 0.144379, 0.038355, 0.159992, 0.099791, 0.216207, 0.196383, 0.006759, 0.128264, 0.043818, 0.285906, 0.271285, 0.255904, 0.259566, 0.144939, 0.208824, 0.231306, 0.207960, 0.237228, 0.100694, 0.036130, 0.122296, 0.203607, 0.247191, 0.140248, 0.060547, 0.284647, 0.449569, 0.406706, 0.240435, 0.018421, 0.237043, 0.155222, 0.203422, 0.219272, 0.173264, 0.508628, 0.160574, 0.005146, 0.060523, 0.259992, 0.347746, 0.256976, 0.069181, 0.323770, 0.130739, 0.172850, 0.134716, 0.441907, 0.327911, 0.064044, 0.216550, 0.308388, 0.153786 ];
% exp25_14 / average_precision *** Selective Search, top-1   **********
SS.average_precision_top_1 = [ 0.083194, 0.143408, 0.415227, 0.336852, 0.042366, 0.138919, 0.320656, 0.220139, 0.106305, 0.077130, 0.378453, 0.120783, 0.000103, 0.386824, 0.193847, 0.098769, 0.177843, 0.227008, 0.220576, 0.220594, 0.112362, 0.322483, 0.202842, 0.209129, 0.377491, 0.116292, 0.279351, 0.251483, 0.014738, 0.294197, 0.331525, 0.042106, 0.011376, 0.500787, 0.258587, 0.205249, 0.090555, 0.214711, 0.392752, 0.067181, 0.179746, 0.014634, 0.033095, 0.301367, 0.105936, 0.203556, 0.136403, 0.001839, 0.317639, 0.107046, 0.427652, 0.313070, 0.219571, 0.172213, 0.266092, 0.161540, 0.236843, 0.211511, 0.000222, 0.259685, 0.057081, 0.195971, 0.197117, 0.098872, 0.301530, 0.006521, 0.211186, 0.171823, 0.292584, 0.304823, 0.213703, 0.000908, 0.052239, 0.000622, 0.100019, 0.231393, 0.166676, 0.135673, 0.212101, 0.300515, 0.135801, 0.262854, 0.297841, 0.424174, 0.089898, 0.003616, 0.097526, 0.021971, 0.097974, 0.573561, 0.149108, 0.125033, 0.115637, 0.180085, 0.278455, 0.199864, 0.090941, 0.031644, 0.260507, 0.091616, 0.266506, 0.060234, 0.004975, 0.001155, 0.236713, 0.275191, 0.422446, 0.081998, 0.205843, 0.143621, 0.147707, 0.133405, 0.275769, 0.363182, 0.298301, 0.089437, 0.226642, 0.039934, 0.330794, 0.222628, 0.213609, 0.258621, 0.207219, 0.097265, 0.002783, 0.219874, 0.197066, 0.046305, 0.247788, 0.221346, 0.316985, 0.185871, 0.144519, 0.519317, 0.041997, 0.132266, 0.194154, 0.206052, 0.019700, 0.229469, 0.091364, 0.217855, 0.147664, 0.101406, 0.114340, 0.095813, 0.538722, 0.190617, 0.071647, 0.103970, 0.033896, 0.288163, 0.265345, 0.008246, 0.117449, 0.045524, 0.249994, 0.338826, 0.250889, 0.259255, 0.167715, 0.223295, 0.183318, 0.175146, 0.243516, 0.094562, 0.024936, 0.162535, 0.215720, 0.316783, 0.183524, 0.134016, 0.261843, 0.399613, 0.427279, 0.259318, 0.093386, 0.282120, 0.145389, 0.229471, 0.283074, 0.194321, 0.478273, 0.130531, 0.023463, 0.086006, 0.365606, 0.236385, 0.245711, 0.143442, 0.276443, 0.224855, 0.125262, 0.117850, 0.385244, 0.312720, 0.102157, 0.242950, 0.431906, 0.268484 ];

% BING
BING.color = MATLAB.Color.brownDark;
BING.marker = '^';
BING.legend = 'BING [4]';
% BING detection
% exp25_12 / average_precision *** BING   **********
BING.average_precision = [ 0.140819, 0.131846, 0.445673, 0.338388, 0.060055, 0.136440, 0.342333, 0.211444, 0.112258, 0.060164, 0.337768, 0.127223, 0.000093, 0.450883, 0.161673, 0.092409, 0.179067, 0.220297, 0.164568, 0.316774, 0.097759, 0.341972, 0.235524, 0.246882, 0.384484, 0.101938, 0.313629, 0.253805, 0.118061, 0.268050, 0.370472, 0.086257, 0.002087, 0.372804, 0.313978, 0.182199, 0.031624, 0.267242, 0.384848, 0.075995, 0.162589, 0.019617, 0.031965, 0.298339, 0.095618, 0.193760, 0.175238, 0.002133, 0.381083, 0.125585, 0.430404, 0.233194, 0.278483, 0.175009, 0.293453, 0.154729, 0.274113, 0.216688, 0.003152, 0.372010, 0.038140, 0.177138, 0.242476, 0.157988, 0.248429, 0.001573, 0.202552, 0.304011, 0.216139, 0.285328, 0.201483, 0.000291, 0.026444, 0.002596, 0.047053, 0.175285, 0.353788, 0.231952, 0.183471, 0.265085, 0.180604, 0.289237, 0.234019, 0.391109, 0.098637, 0.011258, 0.103774, 0.046352, 0.178054, 0.568252, 0.183530, 0.108450, 0.107827, 0.196166, 0.259996, 0.274259, 0.090959, 0.091245, 0.197908, 0.107379, 0.241964, 0.089703, 0.091077, 0.002079, 0.258750, 0.241476, 0.382679, 0.064559, 0.138815, 0.089139, 0.200147, 0.173331, 0.249692, 0.467556, 0.294257, 0.139948, 0.136049, 0.017182, 0.246386, 0.254563, 0.197759, 0.242962, 0.224629, 0.135265, 0.002662, 0.216319, 0.241308, 0.027499, 0.375893, 0.267381, 0.246334, 0.202797, 0.156428, 0.494961, 0.025490, 0.079073, 0.176417, 0.207425, 0.035777, 0.281339, 0.132463, 0.229250, 0.122091, 0.061173, 0.100463, 0.088210, 0.426673, 0.185689, 0.081131, 0.165640, 0.082179, 0.265749, 0.193514, 0.016151, 0.119492, 0.072128, 0.205719, 0.306111, 0.222357, 0.215939, 0.168306, 0.180079, 0.166280, 0.272620, 0.273494, 0.093109, 0.013069, 0.217282, 0.136285, 0.272521, 0.126814, 0.091368, 0.181437, 0.446913, 0.352690, 0.296162, 0.036317, 0.229822, 0.102887, 0.176892, 0.281064, 0.229448, 0.482492, 0.159093, 0.092222, 0.078334, 0.396129, 0.354481, 0.224155, 0.050557, 0.397463, 0.140546, 0.144921, 0.092083, 0.507331, 0.300508, 0.073308, 0.250323, 0.409529, 0.207259 ];
% exp25_10 / average_precision *** BING, top-1   **********
BING.average_precision_top_1 = [ 0.077204, 0.203100, 0.517663, 0.318741, 0.039866, 0.145105, 0.330085, 0.187641, 0.094574, 0.063300, 0.285421, 0.157364, 0.000085, 0.474210, 0.272347, 0.103947, 0.169257, 0.234421, 0.210074, 0.278371, 0.209332, 0.401405, 0.208093, 0.248484, 0.433387, 0.138724, 0.366538, 0.237083, 0.116140, 0.397379, 0.338054, 0.082955, 0.004408, 0.420960, 0.319440, 0.262620, 0.170131, 0.276214, 0.401262, 0.066914, 0.227242, 0.006466, 0.056108, 0.293553, 0.052371, 0.195933, 0.117455, 0.000914, 0.308491, 0.122174, 0.443822, 0.343273, 0.347319, 0.122748, 0.292551, 0.185731, 0.264789, 0.202620, 0.000128, 0.359808, 0.101594, 0.265777, 0.251803, 0.133713, 0.288448, 0.000877, 0.217701, 0.280623, 0.107256, 0.244356, 0.251836, 0.000605, 0.028251, 0.001455, 0.058159, 0.256980, 0.333746, 0.149046, 0.158627, 0.293906, 0.150311, 0.239397, 0.234805, 0.444248, 0.062600, 0.007959, 0.096111, 0.017297, 0.121789, 0.573558, 0.171863, 0.111713, 0.045676, 0.236851, 0.274373, 0.207019, 0.091000, 0.046282, 0.303956, 0.107982, 0.321954, 0.098040, 0.007939, 0.005959, 0.256440, 0.325922, 0.416675, 0.090309, 0.169193, 0.139138, 0.197682, 0.125906, 0.273965, 0.423876, 0.310172, 0.130406, 0.210272, 0.023716, 0.309551, 0.206996, 0.223691, 0.248665, 0.213589, 0.140213, 0.001183, 0.186371, 0.233192, 0.014630, 0.407845, 0.194768, 0.344924, 0.257839, 0.149874, 0.507335, 0.033145, 0.122055, 0.162665, 0.246186, 0.048357, 0.234149, 0.142936, 0.279773, 0.138920, 0.057199, 0.106897, 0.078111, 0.544190, 0.188368, 0.061294, 0.145820, 0.111723, 0.313503, 0.255850, 0.021586, 0.139884, 0.039139, 0.264937, 0.351701, 0.245953, 0.297598, 0.148841, 0.226443, 0.255251, 0.266093, 0.317002, 0.068690, 0.018165, 0.162569, 0.211830, 0.246585, 0.152085, 0.044420, 0.263563, 0.365666, 0.401011, 0.272269, 0.023593, 0.289135, 0.173760, 0.225512, 0.312755, 0.218109, 0.463945, 0.182819, 0.033643, 0.062163, 0.365602, 0.352310, 0.283431, 0.106497, 0.325893, 0.254397, 0.086588, 0.110139, 0.518106, 0.319667, 0.055982, 0.271285, 0.461311, 0.247478 ];

% Obfuscation Search (bboxes, GT) --- use STL for negative mining and testing!
BING_testing.color = MATLAB.Color.red;
BING_testing.marker = '*';
BING_testing.legend = 'BING testing [4]';
% exp25_18 / average_precision *** Obfuscation Search training/testing top-3   **********
BING_testing.average_precision = [ 0.043903, 0.064831, 0.306508, 0.233924, 0.049052, 0.094958, 0.052565, 0.118484, 0.015206, 0.024498, 0.294167, 0.030465, 0.000062, 0.187762, 0.115603, 0.053962, 0.169541, 0.075253, 0.161626, 0.229154, 0.071907, 0.257786, 0.222457, 0.167436, 0.252369, 0.057388, 0.246122, 0.148295, 0.044184, 0.216885, 0.283390, 0.052345, 0.000330, 0.279861, 0.284301, 0.089806, 0.063213, 0.119896, 0.289115, 0.007574, 0.239396, 0.006641, 0.011228, 0.122220, 0.095470, 0.101218, 0.105805, 0.000479, 0.262243, 0.041664, 0.281823, 0.165519, 0.238921, 0.139493, 0.166784, 0.157445, 0.160187, 0.201423, 0.001685, 0.000000, 0.094586, 0.145526, 0.106095, 0.142837, 0.276023, 0.001430, 0.153980, 0.286428, 0.176679, 0.206801, 0.191137, 0.000095, 0.008852, 0.000453, 0.035324, 0.049348, 0.197931, 0.137365, 0.104912, 0.176578, 0.048331, 0.160763, 0.196395, 0.238996, 0.078888, 0.015643, 0.010409, 0.010781, 0.061275, 0.447878, 0.086070, 0.063155, 0.115616, 0.131520, 0.185936, 0.076583, 0.045457, 0.010127, 0.175161, 0.050980, 0.166029, 0.044478, 0.000178, 0.018489, 0.222376, 0.238061, 0.344017, 0.047963, 0.134037, 0.111123, 0.147649, 0.099501, 0.174124, 0.378896, 0.225933, 0.106122, 0.125323, 0.035561, 0.117614, 0.283161, 0.157312, 0.157616, 0.081961, 0.061667, 0.000174, 0.157316, 0.133252, 0.012992, 0.263053, 0.206067, 0.154177, 0.177604, 0.098437, 0.418452, 0.014868, 0.072131, 0.132604, 0.205072, 0.025943, 0.284610, 0.133368, 0.000000, 0.085498, 0.024482, 0.095511, 0.054213, 0.360254, 0.186031, 0.024969, 0.120227, 0.030958, 0.250188, 0.213574, 0.021396, 0.146175, 0.000000, 0.239770, 0.217002, 0.181334, 0.188705, 0.150698, 0.190889, 0.256313, 0.217428, 0.214951, 0.090918, 0.045558, 0.037084, 0.119445, 0.207140, 0.109732, 0.044113, 0.093639, 0.192438, 0.045580, 0.222058, 0.022977, 0.124914, 0.173624, 0.243457, 0.159634, 0.062418, 0.364064, 0.142036, 0.001786, 0.103663, 0.245066, 0.218113, 0.202650, 0.060864, 0.199584, 0.147542, 0.072745, 0.119371, 0.306840, 0.261993, 0.031039, 0.128553, 0.279701, 0.144604 ];

% Obfuscation Search (bboxes, TopC=5)
OBFStopC.color = MATLAB.Color.orange2;
OBFStopC.marker = 'o';
OBFStopC.legend = 'STL-U (our method)';

% Obfuscation Search (bboxes, TopC=5)
OBFStopC_s1.color = MATLAB.Color.greyDark;
OBFStopC_s1.marker = 'o';
OBFStopC_s1.legend = 'STL-U - 200 classes';

% Obfuscation Search (bboxes, TopC=5)
OBFStopC_s2.color = MATLAB.Color.orange2;
OBFStopC_s2.marker = '*';
OBFStopC_s2.legend = 'STL-U - 1000 classes';


% % Obfuscation Search (bboxes, GT)
% OBFSgt.color = MATLAB.Color.red;
% OBFSgt.marker = '*';
% OBFSgt.legend = 'STL-CL (our method)';
% % exp25_09 / average_precision *** Obfuscation Search, GT   **********
% OBFSgt.average_precision = [ 0.121032, 0.175403, 0.440779, 0.231068, 0.103935, 0.285048, 0.334567, 0.220359, 0.107820, 0.051836, 0.363916, 0.133506, 0.000670, 0.476139, 0.207333, 0.090344, 0.184634, 0.141136, 0.212381, 0.318171, 0.114040, 0.288300, 0.234048, 0.209240, 0.415584, 0.112427, 0.288177, 0.216799, 0.122647, 0.319999, 0.387109, 0.104506, 0.002695, 0.483932, 0.271117, 0.300004, 0.143756, 0.200228, 0.330163, 0.045817, 0.193767, 0.006924, 0.051777, 0.308918, 0.095436, 0.158987, 0.163432, 0.001542, 0.352497, 0.120226, 0.435556, 0.287688, 0.290662, 0.146292, 0.257152, 0.128022, 0.249278, 0.139374, 0.000297, 0.384756, 0.095049, 0.212501, 0.168924, 0.170344, 0.222287, 0.008939, 0.289272, 0.338219, 0.245917, 0.277998, 0.190328, 0.000190, 0.044813, 0.000962, 0.042726, 0.218777, 0.323521, 0.247562, 0.160168, 0.305688, 0.133007, 0.256742, 0.155437, 0.408654, 0.078304, 0.016815, 0.094199, 0.010904, 0.135203, 0.670697, 0.208324, 0.089818, 0.112302, 0.147461, 0.270920, 0.273329, 0.090920, 0.012688, 0.273284, 0.138860, 0.328683, 0.059260, 0.018189, 0.003697, 0.226838, 0.278338, 0.429078, 0.071896, 0.217251, 0.135474, 0.198704, 0.156453, 0.268656, 0.499858, 0.237040, 0.074013, 0.140484, 0.096262, 0.305598, 0.236787, 0.190876, 0.292157, 0.159197, 0.121515, 0.000337, 0.197770, 0.211130, 0.022920, 0.334222, 0.305723, 0.389506, 0.223226, 0.144176, 0.542979, 0.021286, 0.061349, 0.156204, 0.145901, 0.016255, 0.326140, 0.129327, 0.388203, 0.138551, 0.059881, 0.106888, 0.076964, 0.535866, 0.188197, 0.057388, 0.181940, 0.107703, 0.278589, 0.199928, 0.014965, 0.163177, 0.108079, 0.313699, 0.295742, 0.304459, 0.174602, 0.177189, 0.123076, 0.199412, 0.222553, 0.279584, 0.090995, 0.012672, 0.151582, 0.167787, 0.317868, 0.130643, 0.041860, 0.208799, 0.500659, 0.314433, 0.256988, 0.048159, 0.316044, 0.153760, 0.134648, 0.249892, 0.179291, 0.519688, 0.202073, 0.046769, 0.130718, 0.420011, 0.292591, 0.311753, 0.084282, 0.278543, 0.210247, 0.059291, 0.154310, 0.441775, 0.343645, 0.093420, 0.243542, 0.379366, 0.253393 ];
% % exp25_13 / average_precision *** Obfuscation Search, GT, top-1   **********
% OBFSgt.average_precision_top_1 = [ 0.048209, 0.204655, 0.496866, 0.332295, 0.098097, 0.214258, 0.311220, 0.217396, 0.093555, 0.062078, 0.322179, 0.152949, 0.000801, 0.409646, 0.214532, 0.169536, 0.196262, 0.183848, 0.186695, 0.292333, 0.103719, 0.248687, 0.263623, 0.278365, 0.428334, 0.175238, 0.287277, 0.279350, 0.092883, 0.368728, 0.445314, 0.054817, 0.006129, 0.491905, 0.311441, 0.241716, 0.061602, 0.215412, 0.345705, 0.113291, 0.262552, 0.005584, 0.059282, 0.300513, 0.093265, 0.202780, 0.157301, 0.001827, 0.368031, 0.110169, 0.435181, 0.289958, 0.186288, 0.089861, 0.268516, 0.139556, 0.264467, 0.143050, 0.000307, 0.332017, 0.095550, 0.176368, 0.208521, 0.178908, 0.276791, 0.018333, 0.266676, 0.332531, 0.254547, 0.275494, 0.238352, 0.000251, 0.057077, 0.001746, 0.045332, 0.210754, 0.301777, 0.213734, 0.103157, 0.269224, 0.136967, 0.292302, 0.311811, 0.471921, 0.072257, 0.018584, 0.095697, 0.006900, 0.123312, 0.616331, 0.201121, 0.091161, 0.134687, 0.055741, 0.268019, 0.306243, 0.090915, 0.091612, 0.166312, 0.133082, 0.331360, 0.099955, 0.006837, 0.004616, 0.223055, 0.263580, 0.451659, 0.097078, 0.257681, 0.137914, 0.205278, 0.136847, 0.275325, 0.478769, 0.308383, 0.084353, 0.205120, 0.105998, 0.368615, 0.211755, 0.207166, 0.221842, 0.173660, 0.141968, 0.000970, 0.231877, 0.179991, 0.015957, 0.323546, 0.284082, 0.376105, 0.268282, 0.080248, 0.524612, 0.036510, 0.074223, 0.176257, 0.219574, 0.028559, 0.174502, 0.143305, 0.328852, 0.128220, 0.055977, 0.103557, 0.106893, 0.601079, 0.149707, 0.049746, 0.175114, 0.100794, 0.204544, 0.250703, 0.026727, 0.137987, 0.084257, 0.294902, 0.248964, 0.274923, 0.211244, 0.183995, 0.217266, 0.161576, 0.280083, 0.269095, 0.045916, 0.055416, 0.215646, 0.111747, 0.364757, 0.106462, 0.062995, 0.192848, 0.481188, 0.369493, 0.200201, 0.017244, 0.263797, 0.156879, 0.196023, 0.267816, 0.199291, 0.511563, 0.175327, 0.048172, 0.117039, 0.437257, 0.270420, 0.302314, 0.150271, 0.341987, 0.134354, 0.058756, 0.155762, 0.528826, 0.339293, 0.107610, 0.136358, 0.438497, 0.219965 ];


% Obfuscation Search (bboxes, GT) --- New similarity function
OBFSgt.color = MATLAB.Color.red;
OBFSgt.marker = '*';
OBFSgt.legend = 'STL-CL (our method)';
% exp25_16 / average_precision *** Obfuscation Search v2, GT, top-3   **********
OBFSgt.average_precision = [ 0.105881, 0.175368, 0.450972, 0.312715, 0.019538, 0.227913, 0.216003, 0.217771, 0.119562, 0.040974, 0.339572, 0.140943, 0.001079, 0.457463, 0.217319, 0.119989, 0.166950, 0.218207, 0.247468, 0.287787, 0.142608, 0.191787, 0.257521, 0.337909, 0.421200, 0.110571, 0.343942, 0.215770, 0.155009, 0.360825, 0.413915, 0.158163, 0.002800, 0.505598, 0.309657, 0.263561, 0.129081, 0.216231, 0.363039, 0.071049, 0.198203, 0.010496, 0.032676, 0.283208, 0.104109, 0.239351, 0.150988, 0.001456, 0.305025, 0.131022, 0.440749, 0.267169, 0.271828, 0.119385, 0.268524, 0.175384, 0.271777, 0.156463, 0.000434, 0.326263, 0.041362, 0.262885, 0.173573, 0.086317, 0.236051, 0.001625, 0.285645, 0.346408, 0.231263, 0.286824, 0.273156, 0.000980, 0.027980, 0.004015, 0.067902, 0.223522, 0.317480, 0.150051, 0.193119, 0.313355, 0.155650, 0.261079, 0.186883, 0.460464, 0.100104, 0.013322, 0.093327, 0.011738, 0.126630, 0.628594, 0.176298, 0.097087, 0.121464, 0.171911, 0.266623, 0.297480, 0.091043, 0.006625, 0.236004, 0.117755, 0.297398, 0.086936, 0.045789, 0.001333, 0.243774, 0.326866, 0.409672, 0.081336, 0.201851, 0.138093, 0.187405, 0.175511, 0.259233, 0.435582, 0.358530, 0.113251, 0.224024, 0.019690, 0.284844, 0.232617, 0.207657, 0.275782, 0.200441, 0.109306, 0.002188, 0.205274, 0.199349, 0.014905, 0.305831, 0.279097, 0.324756, 0.178006, 0.125043, 0.501459, 0.023473, 0.032968, 0.148533, 0.156927, 0.024018, 0.222560, 0.181896, 0.324076, 0.157762, 0.052812, 0.095794, 0.168833, 0.572553, 0.187813, 0.065939, 0.206584, 0.117432, 0.309913, 0.238561, 0.021817, 0.107613, 0.148107, 0.268088, 0.317363, 0.264784, 0.186681, 0.168449, 0.165767, 0.263658, 0.310756, 0.252362, 0.065477, 0.005891, 0.160022, 0.168530, 0.320247, 0.168314, 0.047416, 0.209957, 0.462382, 0.421112, 0.244577, 0.092909, 0.283411, 0.170680, 0.194327, 0.170872, 0.175983, 0.516916, 0.236240, 0.031468, 0.087169, 0.483725, 0.312734, 0.280244, 0.197925, 0.324027, 0.107669, 0.061929, 0.131093, 0.549606, 0.409860, 0.108231, 0.249275, 0.398001, 0.247826 ];
% exp25_17 / average_precision *** Obfuscation Search v2, GT, top-1   **********
OBFSgt.average_precision_top_1 = [ 0.135614, 0.201731, 0.460875, 0.309648, 0.044251, 0.240054, 0.304227, 0.171173, 0.103236, 0.054276, 0.297747, 0.119470, 0.000848, 0.439996, 0.245587, 0.137177, 0.200620, 0.315580, 0.214232, 0.220397, 0.156342, 0.302816, 0.287032, 0.336607, 0.441442, 0.126731, 0.301271, 0.254500, 0.162482, 0.416782, 0.415178, 0.056602, 0.002466, 0.449109, 0.300941, 0.299849, 0.168301, 0.254435, 0.391258, 0.055960, 0.193810, 0.004823, 0.025638, 0.298677, 0.103074, 0.229346, 0.153766, 0.001843, 0.288898, 0.147828, 0.434509, 0.362276, 0.252997, 0.117220, 0.255936, 0.149281, 0.270456, 0.211446, 0.002365, 0.301989, 0.104206, 0.255572, 0.249142, 0.201534, 0.290499, 0.002934, 0.211595, 0.293241, 0.269012, 0.286765, 0.283161, 0.007014, 0.036851, 0.001586, 0.054401, 0.248225, 0.333860, 0.165388, 0.116177, 0.284339, 0.142203, 0.245675, 0.183087, 0.412656, 0.110207, 0.016122, 0.095491, 0.009242, 0.136704, 0.589281, 0.200207, 0.113190, 0.116429, 0.164804, 0.292337, 0.288471, 0.045643, 0.033211, 0.211791, 0.127222, 0.301064, 0.117610, 0.011448, 0.003770, 0.268202, 0.320140, 0.394539, 0.086984, 0.204197, 0.130631, 0.237876, 0.155799, 0.274957, 0.446514, 0.360311, 0.078221, 0.209801, 0.023117, 0.334559, 0.241082, 0.217833, 0.224272, 0.188362, 0.131950, 0.005188, 0.264274, 0.196921, 0.031520, 0.321421, 0.256892, 0.370639, 0.166573, 0.103072, 0.543480, 0.031273, 0.074028, 0.169455, 0.221631, 0.014033, 0.310145, 0.137128, 0.336788, 0.111504, 0.050623, 0.110006, 0.111242, 0.634028, 0.170873, 0.060569, 0.169877, 0.107604, 0.291222, 0.239367, 0.039246, 0.164485, 0.099838, 0.296954, 0.315286, 0.253415, 0.231511, 0.176379, 0.221280, 0.166740, 0.315635, 0.268147, 0.045751, 0.067887, 0.178075, 0.184900, 0.312504, 0.114469, 0.058890, 0.288248, 0.450265, 0.397371, 0.278921, 0.094447, 0.268908, 0.158023, 0.161273, 0.221327, 0.186754, 0.483626, 0.200247, 0.093274, 0.076717, 0.470140, 0.330494, 0.215808, 0.189731, 0.358263, 0.233318, 0.097269, 0.172230, 0.530084, 0.390976, 0.114440, 0.219620, 0.423227, 0.243369 ];

% Obfuscation Search (bboxes, GT) --- use STL for negative mining and testing!
OBFSgt_testing.color = MATLAB.Color.red;
OBFSgt_testing.marker = '*';
OBFSgt_testing.legend = 'STL-CL+U (our method)';
% exp25_18 / average_precision *** Obfuscation Search training/testing top-3   **********
OBFSgt_testing.average_precision = [ 0.126974, 0.190175, 0.424449, 0.316851, 0.037348, 0.209792, 0.124943, 0.188119, 0.098626, 0.053684, 0.345255, 0.135180, 0.000991, 0.453140, 0.190694, 0.136184, 0.147198, 0.248829, 0.226364, 0.255841, 0.126742, 0.261640, 0.310655, 0.237415, 0.367705, 0.134076, 0.321878, 0.191606, 0.105917, 0.315284, 0.405664, 0.123958, 0.011464, 0.505833, 0.276967, 0.232064, 0.062301, 0.235613, 0.374319, 0.078019, 0.315384, 0.012132, 0.023083, 0.263969, 0.104425, 0.144848, 0.144175, 0.003561, 0.280743, 0.105282, 0.424100, 0.302311, 0.227290, 0.123386, 0.271975, 0.159475, 0.245217, 0.242698, 0.000463, 0.309627, 0.026780, 0.273284, 0.195608, 0.200817, 0.210827, 0.003451, 0.231042, 0.358198, 0.203839, 0.295476, 0.253824, 0.000623, 0.054506, 0.002724, 0.080211, 0.153139, 0.212923, 0.128952, 0.173637, 0.195912, 0.140177, 0.248028, 0.216006, 0.457871, 0.101891, 0.014260, 0.095921, 0.026214, 0.046908, 0.642796, 0.167748, 0.066810, 0.117128, 0.149922, 0.300151, 0.280562, 0.091094, 0.006070, 0.170814, 0.143390, 0.246484, 0.073599, 0.030412, 0.000495, 0.255451, 0.269742, 0.367101, 0.056458, 0.217808, 0.133610, 0.156646, 0.124066, 0.270170, 0.433090, 0.242649, 0.083241, 0.231360, 0.029389, 0.247425, 0.227966, 0.193187, 0.317669, 0.169265, 0.076621, 0.000923, 0.199082, 0.186842, 0.009336, 0.346160, 0.299212, 0.322568, 0.259536, 0.085249, 0.538884, 0.032452, 0.059507, 0.175039, 0.187552, 0.006872, 0.328383, 0.140057, 0.355603, 0.179973, 0.044211, 0.104551, 0.155317, 0.486905, 0.193256, 0.051802, 0.150042, 0.101374, 0.282720, 0.241686, 0.011248, 0.099605, 0.177217, 0.274223, 0.327104, 0.223290, 0.237561, 0.151799, 0.208078, 0.249936, 0.279113, 0.293320, 0.045922, 0.012200, 0.124509, 0.210763, 0.306263, 0.139199, 0.061199, 0.229277, 0.272898, 0.385383, 0.246494, 0.045677, 0.276152, 0.149083, 0.212101, 0.350537, 0.213104, 0.502569, 0.240729, 0.004488, 0.104727, 0.392925, 0.276734, 0.203697, 0.196359, 0.264680, 0.060553, 0.084202, 0.166647, 0.560852, 0.414522, 0.038846, 0.248019, 0.370511, 0.243567 ];

% SlidingWindow heatmap
SWheat.color = MATLAB.Color.greyMed;
SWheat.legend = 'Sliding Window heatmap';


% SlidingWindow
SW.color = MATLAB.Color.brown;
SW.marker = 'o';
SW.legend = 'Sliding Window';


% GT detection
GTdet.color = MATLAB.Color.green;
GTdet.legend = 'Ground truth';
% exp25_07 / average_precision *** GT   **********
GTdet.average_precision = [ 0.099972, 0.183150, 0.520973, 0.400109, 0.021709, 0.308551, 0.318760, 0.216061, 0.109340, 0.289190, 0.453859, 0.151501, 0.054757, 0.471839, 0.304942, 0.120650, 0.255446, 0.265871, 0.294215, 0.295148, 0.322387, 0.309376, 0.310295, 0.307361, 0.454188, 0.235573, 0.360494, 0.279757, 0.286398, 0.421614, 0.395788, 0.144976, 0.006456, 0.625978, 0.341555, 0.302398, 0.100356, 0.277858, 0.418132, 0.124177, 0.224883, 0.100415, 0.034739, 0.296068, 0.034879, 0.300876, 0.192642, 0.045943, 0.467401, 0.145264, 0.447408, 0.495571, 0.208727, 0.373220, 0.303881, 0.203043, 0.297521, 0.330807, 0.001041, 0.404716, 0.078364, 0.273723, 0.290807, 0.243079, 0.295766, 0.091472, 0.319398, 0.305548, 0.292620, 0.321339, 0.318953, 0.000521, 0.239688, 0.014320, 0.131869, 0.208581, 0.434485, 0.348690, 0.343466, 0.286192, 0.139015, 0.331383, 0.273992, 0.453419, 0.268272, 0.064165, 0.048130, 0.099103, 0.180989, 0.652785, 0.180220, 0.133150, 0.134492, 0.163373, 0.326264, 0.174664, 0.091602, 0.007110, 0.266084, 0.333655, 0.344738, 0.094320, 0.004099, 0.006342, 0.338638, 0.315801, 0.484331, 0.088148, 0.339286, 0.203145, 0.230328, 0.161830, 0.291886, 0.446643, 0.319059, 0.086092, 0.192453, 0.243189, 0.450052, 0.313482, 0.234313, 0.188317, 0.267026, 0.296841, 0.005422, 0.309523, 0.278926, 0.010464, 0.271096, 0.477102, 0.357163, 0.230118, 0.122543, 0.556326, 0.070449, 0.204554, 0.231816, 0.262238, 0.021607, 0.359959, 0.183753, 0.359211, 0.139736, 0.119477, 0.115749, 0.191154, 0.591159, 0.255838, 0.199700, 0.187569, 0.103434, 0.272373, 0.249603, 0.057696, 0.202194, 0.394778, 0.347487, 0.273285, 0.344346, 0.278140, 0.217153, 0.244135, 0.265730, 0.340999, 0.300954, 0.091153, 0.070217, 0.230103, 0.200937, 0.364105, 0.209806, 0.103346, 0.268815, 0.585496, 0.430190, 0.325490, 0.045050, 0.292776, 0.167190, 0.075258, 0.273595, 0.234920, 0.582850, 0.216653, 0.094679, 0.220909, 0.518571, 0.375983, 0.229188, 0.253626, 0.547300, 0.206527, 0.258518, 0.149441, 0.516801, 0.449973, 0.121867, 0.210968, 0.406785, 0.286259 ];
[GT_average_precision_sort, idx] = sort(GTdet.average_precision);

% EDGEBOXES detection
EBdet.color = MATLAB.Color.green;
EBdet.legend = 'EDGEBOXES';
EBdet.average_precision = [ 0.117140, 0.141030, 0.332344, 0.278168, 0.048785, 0.191039, 0.211904, 0.139476, 0.091412, 0.051785, 0.399653, 0.128939, 0.000582, 0.250603, 0.163782, 0.113223, 0.123477, 0.059267, 0.219535, 0.104364, 0.151496, 0.268263, 0.222264, 0.180912, 0.305992, 0.125071, 0.246528, 0.273973, 0.159529, 0.222008, 0.310375, 0.060823, 0.012992, 0.405202, 0.178207, 0.230859, 0.107067, 0.123709, 0.319099, 0.049226, 0.242249, 0.020172, 0.068984, 0.321010, 0.030970, 0.266031, 0.194222, 0.010231, 0.394805, 0.128353, 0.293802, 0.330158, 0.186754, 0.095119, 0.054412, 0.111529, 0.165505, 0.265818, 0.006998, 0.196551, 0.094106, 0.127006, 0.185706, 0.140744, 0.213839, 0.001159, 0.234746, 0.361603, 0.150502, 0.215052, 0.123947, 0.000102, 0.022747, 0.005764, 0.107257, 0.131284, 0.364926, 0.165116, 0.214381, 0.217267, 0.070727, 0.130885, 0.250581, 0.247094, 0.184141, 0.019338, 0.031577, 0.013464, 0.186832, 0.467319, 0.119861, 0.129949, 0.119021, 0.100751, 0.226107, 0.146249, 0.022748, 0.045463, 0.144717, 0.165429, 0.170739, 0.108487, 0.005792, 0.002052, 0.231026, 0.175826, 0.418031, 0.110159, 0.196483, 0.158718, 0.148653, 0.104803, 0.233946, 0.289474, 0.201676, 0.096248, 0.199634, 0.107484, 0.263062, 0.178823, 0.152174, 0.209325, 0.156217, 0.181543, 0.000133, 0.197306, 0.182057, 0.006998, 0.251151, 0.302933, 0.302142, 0.120205, 0.038696, 0.513856, 0.055875, 0.100963, 0.156742, 0.172925, 0.012557, 0.321240, 0.062099, 0.189806, 0.124670, 0.041763, 0.102571, 0.194410, 0.445047, 0.004826, 0.065220, 0.149406, 0.102972, 0.192915, 0.214566, 0.022599, 0.145651, 0.138692, 0.267477, 0.274510, 0.212758, 0.163575, 0.131860, 0.089448, 0.107302, 0.265409, 0.208674, 0.092903, 0.005638, 0.202963, 0.138526, 0.256760, 0.140764, 0.030159, 0.089113, 0.556125, 0.159613, 0.232550, 0.014578, 0.132807, 0.137158, 0.176825, 0.249407, 0.261263, 0.560047, 0.153275, 0.030917, 0.180130, 0.269446, 0.300120, 0.241599, 0.068533, 0.459004, 0.073892, 0.127693, 0.036327, 0.371646, 0.429664, 0.021664, 0.146522, 0.311513, 0.233393 ];
[EB_average_precision_sort, idx] = sort(EBdet.average_precision);


% Info 200-classes detection
classs_list_200 = {...
    'n01930112';'n03461385';'n01688243';'n02120505';'n04067472';'n02119022';'n03673027';'n03126707';...
    'n03494278';'n07749582';'n01641577';'n07747607';'n02802426';'n03930630';'n02107142';'n03724870';...
    'n01692333';'n02115641';'n04562935';'n02111500';'n02672831';'n02110627';'n02113023';'n02256656';...
    'n04579145';'n03710193';'n02484975';'n02087394';'n04409515';'n02093859';'n02111129';'n04141975';...
    'n03372029';'n03133878';'n03733805';'n01798484';'n04560804';'n02950826';'n03935335';'n04141076';...
    'n02483362';'n03825788';'n04501370';'n03785016';'n02906734';'n01828970';'n07720875';'n03134739';...
    'n02277742';'n01443537';'n03290653';'n01773549';'n02091032';'n03259280';'n03085013';'n01990800';...
    'n02437312';'n04355338';'n03804744';'n03874293';'n02815834';'n02108089';'n02396427';'n01616318';...
    'n02114367';'n04371430';'n02168699';'n10565667';'n04485082';'n03337140';'n04399382';'n03976657';...
    'n03792782';'n04311174';'n03787032';'n04325704';'n02177972';'n04335435';'n03832673';'n02116738';...
    'n02749479';'n02095314';'n02099712';'n03814906';'n03445777';'n06874185';'n03908714';'n03983396';...
    'n04467665';'n02128385';'n04111531';'n04254777';'n02233338';'n04209239';'n07697537';'n04311004';...
    'n02777292';'n03355925';'n02110958';'n01530575';'n02107908';'n04200800';'n04154565';'n04023962';...
    'n01514668';'n03180011';'n03131574';'n03124043';'n03902125';'n12768682';'n03775546';'n07714571';...
    'n03594734';'n02480495';'n02099267';'n03967562';'n03866082';'n03379051';'n03417042';'n02104365';...
    'n07730033';'n01729977';'n01698640';'n04252225';'n03476991';'n03796401';'n01514859';'n03729826';...
    'n03201208';'n01614925';'n07711569';'n02356798';'n07684084';'n01882714';'n04153751';'n04049303';...
    'n07718747';'n04004767';'n04591157';'n02115913';'n04447861';'n03781244';'n01693334';'n07745940';...
    'n07753592';'n01537544';'n04398044';'n04589890';'n02607072';'n04037443';'n02783161';'n02093256';...
    'n02412080';'n12267677';'n02909870';'n02165456';'n02487347';'n02108915';'n02504013';'n02106382';...
    'n03220513';'n02087046';'n03065424';'n02099601';'n02127052';'n04592741';'n03476684';'n01883070';...
    'n02102973';'n02226429';'n03347037';'n03887697';'n04428191';'n02276258';'n03733281';'n03424325';...
    'n02948072';'n02992211';'n03400231';'n04296562';'n02490219';'n03888257';'n02965783';'n03998194';...
    'n03803284';'n02206856';'n03977966';'n02086240';'n04040759';'n03670208';'n02280649';'n02441942';...
    'n03761084';'n03908618';'n02510455';'n02794156';'n02841315';'n02865351';'n02088238';'n02927161'...
};
classs_description_200 = {...
'nematode, nematode worm, roundworm';'grocery store, grocery, food market, market';...
'frilled lizard, Chlamydosaurus kingi';'grey fox, gray fox, Urocyon cinereoargenteus';...
'reel';'red fox, Vulpes vulpes';'liner, ocean liner';'crane';...
'harmonica, mouth organ, harp, mouth harp';'lemon';'bullfrog, Rana catesbeiana';...
'orange';'basketball';'pickup, pickup truck';'Doberman, Doberman pinscher';'mask';...
'Gila monster, Heloderma suspectum';'dingo, warrigal, warragal, Canis dingo';'water tower';...
'Great Pyrenees';'accordion, piano accordion, squeeze box';'affenpinscher, monkey pinscher, monkey dog';...
'Pembroke, Pembroke Welsh corgi';'cicada, cicala';'whiskey jug';'mailbox, letter box';...
'guenon, guenon monkey';'Rhodesian ridgeback';'tennis ball';'Kerry blue terrier';...
'Leonberg';'scale, weighing machine';'flute, transverse flute';'Crock Pot';'measuring cup';...
'prairie chicken, prairie grouse, prairie fowl';'water jug';'cannon';'piggy bank, penny bank';...
'sax, saxophone';'gibbon, Hylobates lar';'nipple';'turnstile';'moped';'broom';'bee eater';...
'bell pepper';'croquet ball';'ringlet, ringlet butterfly';'goldfish, Carassius auratus';...
'entertainment center';'barn spider, Araneus cavaticus';'Italian greyhound';'Dutch oven';...
'computer keyboard, keypad';'isopod';'Arabian camel, dromedary, Camelus dromedarius';...
'sundial';'nail';'paddlewheel, paddle wheel';'beaker';'boxer';'wild boar, boar, Sus scrofa';...
'vulture';'timber wolf, grey wolf, gray wolf, Canis lupus';'swimming trunks, bathing trunks';...
'long-horned beetle, longicorn, longicorn beetle';'scuba diver';'tripod';'file, file cabinet, filing cabinet';...
'teddy, teddy bear';'pole';'mountain bike, all-terrain bike, off-roader';'steel drum';...
'mortarboard';'stole';'weevil';'streetcar, tram, tramcar, trolley, trolley car';...
'notebook, notebook computer';'African hunting dog, hyena dog, Cape hunting dog, Lycaon pictus';...
'assault rifle, assault gun';'wire-haired fox terrier';'Labrador retriever';...
'necklace';'golf ball';'traffic light, traffic signal, stoplight';'pencil sharpener';...
'pop bottle, soda bottle';'trailer truck, tractor trailer, trucking rig, rig, articulated lorry, semi';...
'leopard, Panthera pardus';'rotisserie';'sock';'cockroach, roach';'shower curtain';...
'hotdog, hot dog, red hot';'steel arch bridge';'balance beam, beam';'flagpole, flagstaff';...
'pug, pug-dog';'brambling, Fringilla montifringilla';'Appenzeller';'shoe shop, shoe-shop, shoe store';...
'screwdriver';'punching bag, punch bag, punching ball, punchball';'cock';'desktop computer';...
'crib, cot';'cowboy boot';'pay-phone, pay-station';'buckeye, horse chestnut, conker';...
'mixing bowl';'head cabbage';'jean, blue jean, denim';'orangutan, orang, orangutang, Pongo pygmaeus';...
'flat-coated retriever';'plow, plough';'overskirt';'football helmet';'garbage truck, dustcart';...
'schipperke';'cardoon';'green snake, grass snake';'American alligator, Alligator mississipiensis';...
'snowplow, snowplough';'hair spray';'moving van';'hen';'matchstick';'dining table, board';...
'bald eagle, American eagle, Haliaeetus leucocephalus';'mashed potato';...
'fox squirrel, eastern fox squirrel, Sciurus niger';'French loaf';...
'koala, koala bear, kangaroo bear, native bear, Phascolarctos cinereus';'screw';...
'rain barrel';'artichoke, globe artichoke';'printer';'Windsor tie';'dhole, Cuon alpinus';...
'toilet seat';'monastery';'green lizard, Lacerta viridis';'strawberry';'banana';...
'indigo bunting, indigo finch, indigo bird, Passerina cyanea';'teapot';'window screen';...
'anemone fish';'racer, race car, racing car';'ballpoint, ballpoint pen, ballpen, Biro';...
'Staffordshire bullterrier, Staffordshire bull terrier';'ram, tup';'acorn';'bucket, pail';...
'ladybug, ladybeetle, lady beetle, ladybird, ladybird beetle';'macaque';'French bulldog';...
'Indian elephant, Elephas maximus';'Bouvier des Flandres, Bouviers des Flandres';'dome';...
'toy terrier';'coil, spiral, volute, whorl, helix';'golden retriever';'lynx, catamount';...
'wing';'hair slide';'wombat';'Irish water spaniel';'grasshopper, hopper';'fire screen, fireguard';...
'paper towel';'thresher, thrasher, threshing machine';'admiral';'maze, labyrinth';...
'gasmask, respirator, gas helmet';'candle, taper, wax light';'cello, violoncello';...
'frying pan, frypan, skillet';'stage';'marmoset';'parachute, chute';'car mirror';...
'prayer rug, prayer mat';'muzzle';'bee';'police van, police wagon, paddy wagon, patrol wagon, wagon, black Maria';...
'Shih-Tzu';'radiator';'limousine, limo';'cabbage butterfly';'weasel';'microwave, microwave oven';...
'pencil box, pencil case';'giant panda, panda, panda bear, coon bear, Ailuropoda melanoleuca';...
'barometer';'binoculars, field glasses, opera glasses';'bolo tie, bolo, bola tie, bola';...
'basset, basset hound';'butcher shop, meat market'...
};
num_classes = length(classs_list_200);
