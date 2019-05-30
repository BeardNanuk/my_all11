#!/usr/bin/env python

###! /usr/bin/python

import glob
import os
import sys

#import prusct.io.read_data as rd
from my_sfs.ze_plot_section import plot_seismo_su, seismofold_src
from seisflows.config import loadpy, Dict
from multiprocessing import Process, current_process

parameters = loadpy('parameters.py')
sys.modules['seisflows_parameters'] = Dict(parameters)  
PAR = sys.modules['seisflows_parameters']

print(os.getcwd())

execfile('zfuncfolder/zconstants.py')
execfile('zfuncfolder/zseismo_load_plot_main.py')
#execfile('zfuncfolder/zmulti_signal_comp_main.py')

