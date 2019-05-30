#!/usr/bin/env python

### compare multiple traces in one shot, can be extented to multiple shots and multiple iterations


srcnum_format= '%06d' % (int(srcnum))
iter_num_format= 'traces_%04d' % (int(iter_num))

####
source_folder_signals= os.getcwd()+'/obf/output/' + iter_num_format +'/'+ srcnum_format 
#print('source_folder_signals:', source_folder_signals)
#if os.path.exists(source_folder_signals):
#   shutil.rmtree(source_folder_signals)
#os.makedirs(source_folder_signals)
ofilepng=  str(receiver_num) +  '.png'
opath=source_folder_signals+ '/' + ofilepng
print('opath:',opath)

