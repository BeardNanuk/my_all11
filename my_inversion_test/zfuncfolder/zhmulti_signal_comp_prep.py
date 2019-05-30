#!/usr/bin/env python

### compare multiple traces in one shot, can be extented to multiple shots and multiple iterations


flag_data_or_scratch=3

##### folder setup 
seismofold='syn'
(sufile,srcnum_format,iter_num_format,syn_folder,ipath)=seismofold_src(iter_num=iter_num,srcnum=srcnum, seismofold=seismofold, flag_data_or_scratch=flag_data_or_scratch) 

#### synthetic in scratch 
data_syn=rd.readebsu(idir=ipath,t_total = PAR.NT,NREC=PAR.NREC)
#print('data_syn:',data_syn.shape)

#### adj in scratch 
seismofold='adj'
(sufile,srcnum_format,iter_num_format,syn_folder,ipath)=seismofold_src(iter_num=iter_num, srcnum=srcnum, seismofold=seismofold, flag_data_or_scratch=flag_data_or_scratch) 
data_adj=rd.readebsu(idir=ipath,t_total = PAR.NT,NREC=PAR.NREC)
#print('data_adj:',data_adj.shape)

