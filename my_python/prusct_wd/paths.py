#!/usr/bin/env python

### all options for paths  

import os 
from myFormat.data_format import para_struct

import pickle

exp_para = para_struct('exp_para')

## i/o files
syn_file = 'Up_sp_csic_r014_stftype3_f03500000'
obs_file = 'emFan01_SRC08_ts350_mat'
exp_para.syn_file = syn_file
exp_para.obs_file = obs_file

save_exp_para_pickledump_fn='parameters'
pickle.dump(exp_para,open(save_exp_para_pickledump_fn,'wb'))


## dirs contain i/o files
synpath=os.getcwd() + '/obf/input/' + syn_file + '.su'
obspath=os.getcwd() + '/obf/input/' + obs_file + '.mat'

## dirs for output png files
syn_opng=os.getcwd() + '/obf/output/' + syn_file + '.png'
obs_opng=os.getcwd() + '/obf/output/' + obs_file + '.png'


## output for individual signals
ipickcle_path=os.getcwd() + '/obf/input/' + 'sig_plot_para_pickle' 

INPUT_path =os.getcwd() + '/obf/input/' 
OUTPUT_path =os.getcwd() + '/obf/output/'

#idir='/home/jiazeh/Desktop/my_files/py2project/pythonvenv_playground/james_source_inversion/obf/input/Up_delay_ricker_noatt_f0300000.su'

