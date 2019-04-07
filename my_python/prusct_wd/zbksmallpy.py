#!/usr/bin/env python

# copy the important but limited number of i/o files of prusct_wd to /home/jiazeh/Desktop/d/prusct_wd


#created on Sat Apr  6 21:30:24 UTC 2019 
#created by Jiaze He  


import pickle
import os,shutil,glob 
from shutil import copyfile
from my_sysop.sysop import copyanything 

#### load filenames and other paramters in pickle 
load_para_pickleopen_fn = 'parameters'
with open(load_para_pickleopen_fn,'rb') as handle:
    exp_para = pickle.load(handle)


#### copy files in 'bk_small'
if os.path.exists('bk_small'):
   shutil.rmtree('bk_small')
os.makedirs('bk_small')  

os.makedirs('bk_small/obf/input')  
os.makedirs('bk_small/obf/output')  

### copy input files 
input_syn='obf/input/' + exp_para.syn_file + '.su'
input_obs='obf/input/' + exp_para.obs_file + '.mat'
dst_syn = 'bk_small/' + input_syn 
dst_obs = 'bk_small/' + input_obs 
copyfile(input_syn, dst_syn)
copyfile(input_obs, dst_obs)

### copy file list for output folder  
copyfilelist = glob.glob('obf/output/' + "*")
for f in copyfilelist:
    dst_f = 'bk_small/' + f
    copyfile(f,dst_f)

### copy scripts and parameters 
copyfilelist = glob.glob("[jpvwyz]*")
for f in copyfilelist:
    dst_f = 'bk_small/' + f
    copyfile(f,dst_f)


#### copy bk_small folder to backup folder
### final dir for backup
foldername = 'sigcomp_Syn' + exp_para.syn_file + '_Obs' + exp_para.obs_file
print('foldername = ' + foldername)
final_dir = '/home/jiazeh/Desktop/d/prusct_wd_data/' + foldername

copyanything('bk_small',final_dir)
####    


