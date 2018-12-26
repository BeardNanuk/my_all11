

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
from os.path import abspath, join
from seisflows.plugins.solver_io.fortran_binary import _read
from seisflows.tools.tools import exists
from seisflows.config import loadpy, Dict



def getcoords(dir,num=0):
    for names in getnames(dir,num):
        if exists(names):
            x, z = _read(names[0]), _read(names[1])
            return x, z
    else:
        print('Coordinate files not found.')
        sys.exit()


def meshplot(x, y, z): 
    """ Plots values on 2D unstructured mesh
    """
    r = (max(x) - min(x))/(max(y) - min(y))
    rx = r/np.sqrt(1 + r**2)
    ry = 1/np.sqrt(1 + r**2)

    f = plt.figure(figsize=(10*rx, 10*ry))
    p = plt.tricontourf(x, y, z, 125, extend="both")
    plt.axis('image')
    return f, p

def getnames(dir,num=0):
    return [
        (abspath(join(dir, subdir, 'proc' + str(num).zfill(6) + '_x.bin')),
         abspath(join(dir, subdir, 'proc' + str(num).zfill(6) + '_z.bin'))) 
         for subdir in [
         '.',
         '../model', 
         '../output/model_init',
         '../../output/model_init',
         '../../../output/model_init',
         '../../../../output/model_init',
         ]]

msg = ''' 
%s\nmin, max: %f, %f
'''

undersamp_fact = 1
clip_fact = 0.97
multi_locator_spc = 0.01
half_x= 0.02
half_z= 0.02

