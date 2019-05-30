#!/usr/bin/env python

## /scratch/gpfs/jiazeh/inversion_test2/zplot_signals_main.py
## plot several signals to evaluate inversion behaviors

### created on Thu Dec  6 18:17:23 UTC 2018
### created by Jiaze He 

### revised on Mon Dec 24 20:29:46 UTC 2018 
### parallized using Process 

#### figure gereration in parallel
if __name__ == '__main__':
    # The porcesses list will store each call we make to "square" and the 
    # numbers list contains the numbers we loop through and call the 
    # "square" function on. 

    import time

    import obspy
    import numpy as np
    import pandas as pd
    from myFormat.data_format import para_struct
    from seisflows.tools.graphics import _convert_to_array
    from scipy.interpolate import interp1d

    ## for parallel computing
    from multiprocessing import Process, current_process

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

    iter_matrix = [0,1];
    #iter_matrix = [0,1,2,3,4]
    #iter_matrix = [0,1,2,3,4,5,6,7]
    #iter_matrix = [0,1,2,3,4,5,6,7,8,9,10,12,14,16,18]
    sig_plot_para.iter_matrix=iter_matrix 
    #iter_matrix2 = np.concatenate(([0], iter_matrix), axis=0)
    #sig_plot_para.iter_matrix2=iter_matrix2 
    source_matrix = [0]
    sig_plot_para.source_matrix=source_matrix
    rec_matrix = [0,10,20,40]
    sig_plot_para.rec_matrix=rec_matrix

    save_sig_plot_para_pickledump_fn = 'obf/sig_plot_para_pickle'
    pickle.dump(sig_plot_para,open(save_sig_plot_para_pickledump_fn,'wb'))
    t1 = time.time()

#    processes = []
#    for iter_num in iter_matrix:
#	for source_num in source_matrix:   
##	    zplot_signals_one_iter_one_source(iter_num,source_num, rec_matrix,save_sig_plot_para_pickledump_fn)
#	    process = Process(target=zplot_signals_one_iter_one_source, args=(iter_num,source_num, rec_matrix,save_sig_plot_para_pickledump_fn)) 	
#	    processes.append(process)
#	    # Processes are spawned by creating a Process object and 
#	    process.start()
#
#    for process in processes[1:]: 
#	process.join()
    ## added on Fri May 24 15:37:17 EDT 2019
    execfile('zplot_seismo_main.py')
    execfile('zfuncfolder/zmulti_signal_comp_main.py')

    print("Multiprocessing complete")
    t2 = time.time()
    print("total time is " + str(t2-t1))

