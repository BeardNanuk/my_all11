#!/usr/bin/env python

print('%%%%%%%%%%%%%%%%%%%%%%% start: seismogram plot %%%%%%%%%%%%%%%%%%%%%%%%%%%%')

processes = []


for seismofold in seismofold_matrix: 
    for srcnum in srcnum_matrix:         
        for iter_num in iter_matrix:
            if iter_num==0:
                #### .su files in traces_0000 
                flag_data_or_scratch=1
                if seismofold=='adj': 
                    print('')
                else:  
                    (sufile,srcnum_format,iter_num_format,syn_folder,ipath)=seismofold_src(iter_num=iter_num,srcnum=srcnum, seismofold=seismofold, flag_data_or_scratch=flag_data_or_scratch) 
            else:  
                flag_data_or_scratch=3
                if seismofold=='obs': 
                    print('')
                else:  
                    (sufile,srcnum_format,iter_num_format,syn_folder,ipath)=seismofold_src(iter_num=iter_num,srcnum=srcnum, seismofold=seismofold, flag_data_or_scratch=flag_data_or_scratch) 

            print('iternum:', iter_num, ' seismofold:', seismofold, ' srcnum:', srcnum)
            execfile('zfuncfolder/zhseismo_load_plot_one.py')

for process in processes[1:]:
    process.join()

print('%%%%%%%%%%%%%%%%%%%%%%% end: seismogram plot %%%%%%%%%%%%%%%%%%%%%%%%%%%%')
