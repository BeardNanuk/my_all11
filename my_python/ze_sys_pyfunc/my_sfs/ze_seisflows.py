
# ze plot functions
# create on Fri Sep 21 20:57:01 UTC 2018
# created by Jiaze He 

# revised on Tue Nov 20 16:44:27 UTC 2018
# add one_signal_plot

import obspy
import numpy as np
import pandas as pd
from myFormat.data_format import para_struct
from seisflows.tools.graphics import _convert_to_array
from scipy.interpolate import interp1d

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
import pickle

# for file finding
import glob



def load_su2np(INPUT_path,signal_type,source_num):
    if (signal_type == 'obs'):
	INPUT_file = INPUT_obs_file = 'output/traces/obs/%06d/Up*' % source_num
    else: 
	INPUT_file = INPUT_path + signal_type + '/%06d/Up*' % source_num
    stream = read(INPUT_file,format='SU', byteorder='<')
	# convert stream to image array
    data = _convert_to_array(stream)
    adict = {}
    adict[INPUT_file[:2]] = data
    #adict['pkt_np_array'] = data
    adict['whatever'] = 1 
    numpy_data = np.asarray(data)
    return numpy_data


def zplot_signals_one_src_all_rec(iter_num,source_num, rec_matrix, obs_data,OUTPUT_FILES_path,INPUT_path,save_sig_plot_para_pickledump_fn):
    global processes
    for receiver_num in rec_matrix: 
        save_signals_seisflows_png = OUTPUT_FILES_path + 'one_signal_src%d_rec%d.png' % (source_num,receiver_num)
        #execfile('zplot_signals_load_su.py')
        adj_data = load_su2np(INPUT_path,'adj',source_num) 
        syn_data = load_su2np(INPUT_path,'syn',source_num) 
        #execfile('zplot_signals_one_fig.py')
#	process = Process(target=zplot_signals_one_fig, args=(iter_num,source_num,receiver_num,save_sig_plot_para_pickledump_fn,syn_data,obs_data,adj_data,save_signals_seisflows_png))	
#        processes.append(process)
#        process.start()
        zplot_signals_one_fig(iter_num,source_num,receiver_num,save_sig_plot_para_pickledump_fn,syn_data,obs_data,adj_data,save_signals_seisflows_png)

def zplot_signals_one_fig(iter_num,source_num,receiver_num,save_sig_plot_para_pickledump_fn,syn_data,obs_data,adj_data,save_signals_seisflows_png): 
    print('receiver number: ', receiver_num)
    with open(save_sig_plot_para_pickledump_fn,'rb') as handle:
	sig_plot_para = pickle.load(handle)
	t_total_obs = sig_plot_para.t_total_obs 
        flag_plot_spectrum = sig_plot_para.flag_plot_spectrum
        t_star_showobs = sig_plot_para.t_star_showobs
        t_end_showobs = sig_plot_para.t_end_showobs
    if flag_plot_spectrum is 1:

       fig, (ax2,ax3,ax4,ax5) = plt.subplots(nrows=4)
       
    #    ax0.plot(xf_obs/1000,np.abs(yf_obs),'-k')
    #    ax0.set_title('observed - ' + str(obs_name) + ' trace  ' + str(trace_num) + '- absolute_value')
    #    ax0.set_xlabel('frequency (kHz)')
       
    #    ax1.plot(xf_Newobs/1000,np.abs(yf_Newobs),'-k')
    #    ax1.set_title('observed w resampling - ' + str(obs_name) + ' trace  ' + str(trace_num) + '- absolute_value')
    #    ax1.set_xlabel('frequency (kHz)')
       
       ax2.plot(t_total_obs[t_star_showobs:t_end_showobs],syn_data[t_star_showobs:t_end_showobs,receiver_num],'g-')
       ax2.set_title('synthetic -source '+str(source_num)+' trace ' + str(receiver_num))
       ax2.set_xlabel(r'time ($\mu s$)')

       ax3.plot(t_total_obs[t_star_showobs:t_end_showobs],obs_data[t_star_showobs:t_end_showobs,receiver_num],'m-')
       ax3.set_title('observed -source '+str(source_num)+' trace ' + str(receiver_num))
       ax3.set_xlabel(r'time ($\mu s$)')

       ax4.plot(t_total_obs[t_star_showobs:t_end_showobs],adj_data[t_star_showobs:t_end_showobs,receiver_num],'b-')
       ax4.set_title('adjoint -source '+str(source_num)+' trace ' + str(receiver_num))
       ax4.set_xlabel(r'time ($\mu s$)')
       
       ax5.plot(t_total_obs[t_star_showobs:t_end_showobs],syn_data[t_star_showobs:t_end_showobs,receiver_num],'g-',label='syn')
       ax5.plot(t_total_obs[t_star_showobs:t_end_showobs],obs_data[t_star_showobs:t_end_showobs,receiver_num],'m-',label='obs')
       ax5.plot(t_total_obs[t_star_showobs:t_end_showobs],adj_data[t_star_showobs:t_end_showobs,receiver_num],'b-',label='adj')
       ax5.set_title('together - iter num' + str(iter_num) + ' , source '+str(source_num)+' trace ' + str(receiver_num))
       ax5.set_xlabel(r'time ($\mu s$)')

       plt.tight_layout(rect=[0, 0, 1.5, 1.3])

       plt.savefig(save_signals_seisflows_png,format='png', dpi=150, bbox_inches='tight')
       #plt.show()
       plt.close(fig)

def zplot_signals_one_iter_one_source(iter_num,source_num, rec_matrix,save_sig_plot_para_pickledump_fn):
    global processes
    INPUT_path = "./output/traces_%04d/" % (iter_num)
    OUTPUT_FILES_path = "./output/traces_%04d/" % (iter_num)
    process_id = os.getpid()
    print("Porcess ID: " + str(process_id))
    obs_data = load_su2np(INPUT_path,'obs',source_num)
    zplot_signals_one_src_all_rec(iter_num,source_num, rec_matrix, obs_data, OUTPUT_FILES_path,INPUT_path,save_sig_plot_para_pickledump_fn)

def zplot_signals_one_iter_one_source2(data=np.random.rand(11, 11),iter_num=0,idir= ' ', odir= ' ',\
                                       source_num=0, rec_matrix=[0], flag_given_dir=1, \
                                       save_sig_plot_para_pickledump_fn=' '):
    global processes
    if flag_given_dir is 0: 
        idir = "./output/traces_%04d/" % (iter_num)
        odir = "./output/traces_%04d/" % (iter_num)

    process_id = os.getpid()
    print("Porcess ID: " + str(process_id))
    #obs_data = load_su2np(idir,'obs',source_num)
    zplot_signals_one_src_all_rec(iter_num,source_num, rec_matrix, data,odir,idir,save_sig_plot_para_pickledump_fn)


