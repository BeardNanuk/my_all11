#!/usr/bin/env python

### compare multiple traces in one shot, can be extented to multiple shots and multiple iterations

from my_sfs.ze_plot_section import plot_one_signal_comp
## for parallel computing
from multiprocessing import Process, current_process
import numpy as np


## plot one signal pair comparison in serial 
#polot_one_signal_comp(data_syn=data_syn,data_obs=data_obs,receiver_num=5,\
#                 dt_syn=4e-9,dt_obs=5e-8,\
#                 t_star_showsyn=10000, t_end_showsyn=14000,\
#                 t_star_showobs=1800,t_end_showobs=2120,flag_range=1,flag_same_range=0,\
#                 fig_filename='',flag_savepng=0)

## paramters for parallel computing 
rec_matrix = np.arange(0,170,10) 
#rec_matrix = [0,3,9,12,15]
dt_syn=6e-9
dt_obs=5e-8
source_num=0
iter_num=0
t_star_showsyn=14000
t_end_showsyn=22000
t_star_showobs=1500
t_end_showobs=2700
flag_range=1
flag_same_range=0
flag_savepng=1
## 
processes = []

for receiver_num in rec_matrix:
    per_rec_png = OUTPUT_path + 'rec'+str(receiver_num) + '.png'
    fig_filename=per_rec_png
    # for the following args will work only when the args are passed in sequence
    # as in the defined function, and the args should contain the values of the variables
    process = Process(target=plot_one_signal_comp,args=(data_syn,data_obs,dt_syn,dt_obs,source_num,receiver_num,iter_num,t_star_showsyn,t_end_showsyn,t_star_showobs,t_end_showobs,flag_range,flag_same_range, fig_filename,flag_savepng))
    processes.append(process)
            # Processes are spawned by creating a Process object and 
    process.start()

    for process in processes[1:]:
        process.join()




