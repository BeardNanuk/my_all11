#!/usr/bin/env python

from my_sfs.ze_plot_section import plot_one_signal_comp2
## for parallel computing
import numpy as np
#####from seisflows.plugins.misfit import Traveltime
import shutil
import prusct.io.read_data as rd


for srcnum in srcnum_matrix_sig:
    for receiver_num in rec_matrix:
        for iter_num in iter_matrix:
            if iter_num==0:
               print('nothing') 
            else:  
                execfile('zfuncfolder/zhmulti_signal_comp_prepinit.py')
                add_slide_ze(opath,total_filename_pptx,left_start=2, top_start=0.1, width=7,height=5)
#                process.start()

#for process in processes[1:]:
#    process.join()

