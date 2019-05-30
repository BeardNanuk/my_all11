

## created on Fri Dec 14 17:30:13 EST 2018 
## created by Jiaze He 

## preparation for pringgllmap


import os, argparse
import sys
import numpy as np
import matplotlib.ticker as ticker
import matplotlib.pyplot as plt
import pylab
from glob import glob
from seisflows.plugins.solver_io.fortran_binary import _read
from seisflows.config import loadpy, Dict
## added on Fri May 24 09:14:52 EDT 2019
from my_sfs.ze_plot_section import getcoords, meshplot, getnames


msg = ''' 
%s\nmin, max: %f, %f
'''

undersamp_fact = 1
clip_fact = 1.0 
multi_locator_spc = 0.021
half_x= 0.042
half_z= 0.042

