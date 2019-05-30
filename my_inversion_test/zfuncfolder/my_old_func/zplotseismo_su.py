#!/bin/sh
''''exec python -W ignore -- "$0" "$@" # '''

## plot seismo using the new su readers. 
## created by Jiaze He 
## created on Fri May 10 19:21:35 UTC 2019 

# usage: adj, obs, syn 
#./zplotseismo_su.py adj 0


###! /usr/bin/python

import glob
import os 
import sys

import prusct.io.read_data as rd
from my_sfs.ze_plot_section import plot_section_steps
from seisflows.config import loadpy, Dict

if __name__ == '__main__':
    """ Plots data on 2-D unstructured mesh

    plot seismographs using the new su file reading
    """
    parameters = loadpy('parameters.py')
    sys.modules['seisflows_parameters'] = Dict(parameters)  
    PAR = sys.modules['seisflows_parameters']    

    print(os.getcwd())
    
    
    seismofold= sys.argv[1] 
    srcnum= sys.argv[2] 
    srcnum_format= '%06d' % int(srcnum)  
   
    if seismofold=='syn':
        sufile='Up_file_single.su'
    elif seismofold=='obs': 
        sufile='Up_file_single.su'
    elif seismofold=='adj': 
        sufile='Up_file_single.su'

     
    print('seismofold:', seismofold)
    print('sourcenum:', srcnum)
    print('srcnum_format:', srcnum_format)

    ipath=os.getcwd()+'/scratch/solver/' + srcnum_format + '/traces/' + seismofold + '/' + sufile
    print('ipath:', ipath)
    ofilepng= srcnum_format + seismofold + '.png'
    opath=os.getcwd()+'/obf/output/' + ofilepng
    print('opath:', opath)
#
#ipath='/scratch/gpfs/jiazeh/itsm/scratch/solver/000000/traces/syn/Up_file_single.su'
#opath='/scratch/gpfs/jiazeh/itsm/obf/output/sys_fig.png'
#
    data2dnp=rd.readebsu(idir=ipath,t_total = PAR.NT,NREC=PAR.NREC)
#print('shape of data_obs:', data_obs4.shape)
    plot_section_steps(data=data2dnp, clip=100, y_star = 0, y_end = 900, title=seismofold, y_interval=100., fig_filename=opath,flag_savepng=1)
#
