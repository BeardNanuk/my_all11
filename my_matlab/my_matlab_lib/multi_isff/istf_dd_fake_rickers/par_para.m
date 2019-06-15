%%% parameter loading
load('/home/jiazeh/Desktop/alljh/pfiles/my_matlab_lib/stf_gen/multi_ricker/STFALL.mat', 'STFALL')

libpath = '/home/jiazeh/Desktop/alljh/pfiles/my_matlab_lib/multi_isff/functions';
addpath(libpath)

% number of source
m = STFALL.num_src; 
% number of receivers
n = STFALL.num_rec; 

%%%% initialization 
rng(1);
