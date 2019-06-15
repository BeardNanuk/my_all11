#!/usr/bin/env python

import sys
import numpy as np
from seisflows.plugins import readers, writers
from scipy.fftpack import fft, ifft
import matplotlib.pyplot as plt
from obspy.core import Stream, Trace
from obspy.signal.filter import bandpass
from scipy.signal import resample


# define seismic data reader and writer
reader = getattr(readers,'su')
writer = getattr(writers, 'su')

obs = reader('./OUTPUT_FILES/','Up_file_single.su')
nstep = len(obs[0].data)

freqmin=1
freqmax=50000

dt=0.00000008
df=(1./dt)

delay = 756

resampl=1
nstep_resampled=400

print 'length of data : ' + str(nstep)

delayed_stf = np.zeros(nstep + delay )
output = obs.copy()

for i in range(0,len(obs)):
   obs[i].taper(0.05, type='hann')
   delayed_stf[-nstep:] = obs[i].data
   resu = bandpass(delayed_stf, freqmin, freqmax, df, zerophase=True)
   if resampl == 1 :
      res = resample(resu[:nstep],int(1.5*nstep_resampled))
      output[i].data = np.float32(res[:nstep_resampled])
   else:
      output[i].data = np.float32(resu[:nstep])
   #output[i].taper(0.05, type='hann')
   output[i].stats.delta=0.01
 

output.write('./data/data2.su',format='SU')

