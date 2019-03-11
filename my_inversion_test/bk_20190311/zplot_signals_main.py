#!/usr/bin/env python

## /scratch/gpfs/jiazeh/inversion_test2/zplot_signals_main.py
## plot several signals to evaluate inversion behaviors

### created on Thu Dec  6 18:17:23 UTC 2018
### created by Jiaze He 

### revised on Wed Dec 12 15:38:36 UTC 2018
### many iterations now included
import time

import obspy
import numpy as np
import pandas as pd
from myFormat.data_format import para_struct
from seisflows.tools.graphics import _convert_to_array
from scipy.interpolate import interp1d

## for ploting
import matplotlib.pyplot as plt 
from seisflows.tools.graphics import plot_section

import argparse

## for i/o
from obspy import read
import scipy.io as sio 
from obspy.core.stream import Stream
import os, sys  
from seisflows.config import loadpy, Dict
from my_sfs.ze_seisflows import load_su2np,zplot_signals_one_src_all_rec,zplot_signals_one_iter_one_source
import pickle

# for file finding
import glob

### the parameters collection for all signal plotting 
sig_plot_para = para_struct('sig_plot_para')

flag_seismotype = 6; sig_plot_para.flag_seismotype = flag_seismotype

parameters = loadpy('parameters.py')
sys.modules['seisflows_parameters'] = Dict(parameters)
PAR = sys.modules['seisflows_parameters']
#nproc=PAR.NPROC
#print nproc

#D_T = 4e-8
#NSTEP = 5800
D_T = PAR.DT; sig_plot_para.D_T = sig_plot_para
NSTEP = PAR.NT; sig_plot_para.NSTEP = NSTEP
flag_plot_spectrum = 1; sig_plot_para.flag_plot_spectrum = flag_plot_spectrum 
t_star_showobs = 1; sig_plot_para.t_star_showobs = t_star_showobs
t_end_showobs= PAR.NT; sig_plot_para.t_end_showobs = t_end_showobs


t_total_obs = np.arange(D_T,NSTEP*D_T+D_T,D_T)*1e6
sig_plot_para.t_total_obs=t_total_obs
#iter_num=1
#source_num = 0
#receiver_num = 31

iter_matrix = [1,2,3,4,5,6,7,8,9];sig_plot_para.iter_matrix=iter_matrix
#iter_matrix = [1,2,3,4,5,6,7,8,9,10,11,12]
source_matrix = [0]
sig_plot_para.sig_plot_para=sig_plot_para
rec_matrix = [0,3,9,12,15]
sig_plot_para.rec_matrix=rec_matrix

save_sig_plot_para_pickledump_fn = 'output/sig_plot_para_pickle'
pickle.dump(sig_plot_para,open(save_sig_plot_para_pickledump_fn,'wb'))
t1 = time.time()

for iter_num in iter_matrix:
    for source_num in source_matrix:   
     # execfile('zplot_signals_one_iter_one_source.py')
      #  zplot_signals_one_iter_one_source(iter_num,source_num)        	
	zplot_signals_one_iter_one_source(iter_num,source_num, rec_matrix,save_sig_plot_para_pickledump_fn)
t2 = time.time()
print("total time is " + str(t2-t1))
#INPUT_path = "./output/traces_%04d/" % (iter_num)
#OUTPUT_FILES_path = "./output/traces_%04d/" % (iter_num)
#
#
#INPUT_obs_file = 'output/traces/obs/%06d/Up*' % source_num
#stream = read(INPUT_obs_file,format='SU', byteorder='<')
#    # convert stream to image array
#data = _convert_to_array(stream)
#adict = {}
#adict[INPUT_obs_file[:2]] = data
##adict['pkt_np_array'] = data
#adict['whatever'] = 1 
#obs_data = np.asarray(data)
#
#print('INPUT_obs_file',INPUT_obs_file)
#print('shape of obs_data', obs_data.shape)
#
#rec_matrix = [10,20]
#
#for receiver_num in rec_matrix: 
#   save_signals_seisflows_png = OUTPUT_FILES_path + 'one_signal_src%d_rec%d.png' % (source_num,receiver_num)
#   execfile('zplot_signals_load_su.py')
#   execfile('zplot_signals_one_fig.py')
#
