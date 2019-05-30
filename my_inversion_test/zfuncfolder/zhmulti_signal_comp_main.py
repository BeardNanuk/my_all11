#!/usr/bin/env python

from my_sfs.ze_plot_section import plot_one_signal_comp2
## for parallel computing
import numpy as np
#####from seisflows.plugins.misfit import Traveltime
import shutil
import prusct.io.read_data as rd


print('%%%%%%%%%%%%%%%%%%%%%%% start: multiple signals plot %%%%%%%%%%%%%%%%%%%%%%%%%%%%')

processes = []


for srcnum in srcnum_matrix_sig:
    for receiver_num in rec_matrix:
        for iter_num in iter_matrix:
            if iter_num==0:
                flag_data_or_scratch=1
                #### obs in scratch 
                seismofold='obs'
                (sufile,srcnum_format,iter_num_format,syn_folder,ipath)=seismofold_src(iter_num=iter_num,srcnum=srcnum, seismofold=seismofold, flag_data_or_scratch=flag_data_or_scratch) 
                data_obs=rd.readebsu(idir=ipath,t_total = PAR.NT,NREC=PAR.NREC)
                #print('data_obs:',data_obs.shape)
    
                #### synthetic in DATA  
                seismofold='syn'
                (sufile,srcnum_format,iter_num_format,syn_folder,ipath)=seismofold_src(iter_num=iter_num,srcnum=srcnum, seismofold=seismofold, flag_data_or_scratch=flag_data_or_scratch) 
                data_syn_init=rd.readebsu(idir=ipath,t_total = PAR.NT,NREC=PAR.NREC)
            else:  
                srcnum_format= '%06d' % (int(srcnum))
                iter_num_format= 'traces_%04d' % (int(iter_num))
####
                source_folder_signals= os.getcwd()+'/obf/output/' + iter_num_format +'/'+ srcnum_format
                if os.path.exists(source_folder_signals):
                   shutil.rmtree(source_folder_signals)
                os.makedirs(source_folder_signals)
                ofilepng=  str(receiver_num) +  '.png'
                opath=source_folder_signals+ '/' + ofilepng
                print('opath:',opath)

                execfile('zfuncfolder/zhmulti_signal_comp_prep.py')
                process = Process(target=plot_one_signal_comp2,args= (data_syn,data_obs,data_adj,data_syn_init,dt,source_num,receiver_num,iter_num,t_star_showsyn,t_end_showsyn,t_star_showobs,t_end_showobs,t_star_showadj,t_end_showadj,flag_range,flag_same_range, opath,flag_savepng))
                process.start()

for process in processes[1:]:
    process.join()



print('%%%%%%%%%%%%%%%%%%%%%%% end: multiple signals plot %%%%%%%%%%%%%%%%%%%%%%%%%%%%')
