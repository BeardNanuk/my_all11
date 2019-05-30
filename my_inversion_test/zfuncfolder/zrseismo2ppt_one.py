#!/usr/bin/env python


(sufile,srcnum_format, iter_num_format,syn_folder,ipath)=seismofold_src(iter_num=iter_num,srcnum=srcnum, seismofold=seismofold, flag_data_or_scratch=flag_data_or_scratch) 
ofilepng=   srcnum_format + seismofold +  iter_num_format + '.png'
opath=os.getcwd()+'/obf/output/' + ofilepng
add_slide_ze(opath,total_filename_pptx,left_start=2, top_start=0.1, width=5,height=6)
