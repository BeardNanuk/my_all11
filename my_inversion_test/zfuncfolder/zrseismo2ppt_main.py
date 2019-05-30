#!/usr/bin/env python


#processes = []

        #print('seismofold:', seismofold)
        #print('srcnum:', srcnum)
for srcnum in srcnum_matrix:         
    for seismofold in seismofold_matrix: 
        for iter_num in iter_matrix:
            if iter_num==0:
                #### .su files in traces_0000 
                flag_data_or_scratch=1
                if seismofold=='adj': 
                    print('')
                else: 
                    execfile('zfuncfolder/zrseismo2ppt_one.py')  
            else:  
                flag_data_or_scratch=3
                if seismofold=='obs': 
                    print('')
                else:  
                    execfile('zfuncfolder/zrseismo2ppt_one.py')  
            print(' ppt: iternum:', iter_num, ' seismofold:', seismofold, ' srcnum:', srcnum)
#for process in processes[1:]:
#    process.join()

