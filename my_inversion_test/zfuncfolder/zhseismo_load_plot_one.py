#!/usr/bin/env python

from my_sfs.ze_plot_section import seismofold_src
#

#
#iter_num=0
#(sufile,srcnum_format, iter_num_format,syn_folder,ipath)=seismofold_src(iter_num=iter_num,srcnum=srcnum, seismofold=seismofold, flag_data_or_scratch=3) 



ofilepng= srcnum_format + seismofold + iter_num_format + '.png'
opath=os.getcwd()+'/obf/output/' + ofilepng

title = seismofold + "iter num " + str(iter_num) + "source number " + str(srcnum)   
process = Process(target=plot_seismo_su,args=(100,title,0,PAR.NT,1.0,yaxis_spc,opath,1,ipath, PAR.NT,PAR.NREC))
processes.append(process)
process.start()

