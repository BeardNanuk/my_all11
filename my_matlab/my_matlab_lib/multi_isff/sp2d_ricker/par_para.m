%%% parameter loading
load('/home/jiazeh/Desktop/alljh/pfiles/my_matlab_lib/stf_gen/multi_sp2d_src_3rickers/STFALL.mat', 'STFALL')

libpath = '/home/jiazeh/Desktop/alljh/pfiles/my_matlab_lib/multi_isff/functions';
addpath(libpath)

% number of source
m = STFALL.num_src; 
% number of receivers
n = ceil(m*1.2); 

%%%% initialization 
rng(1);
