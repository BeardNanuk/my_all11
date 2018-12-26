#!/usr/bin/env python

import sys
import numpy as np
from seisflows.plugins import readers, writers
from scipy.fftpack import fft, ifft
import matplotlib.pyplot as plt
from obspy.core import Stream, Trace
from obspy.signal.filter import bandpass

# define seismic data reader and writer
reader = getattr(readers,'su')
writer = getattr(writers, 'su')

obs = reader('./','obs_data.su')
nstep = len(obs[0].data)

# 0 : Read data from files
file = 'stf_obs.txt'
f=open(file,"r")
lines=f.readlines()
stf_obs=[]
for x in lines:
    stf_obs.append(float(x.split()[1]))
f.close()
ft_stf_obs = fft(stf_obs)


file = 'stf_syn.txt'
f=open(file,"r")
lines=f.readlines()
stf_syn=[]
for x in lines:
    stf_syn.append(float(x.split()[1]))
f.close()
ft_stf_syn = fft(stf_syn)
#plt.plot(stf)



output = obs.copy()
for i in range(0,len(obs)):
#   obs[i].taper(0.05, type='hann')
#   delayed_stf[-nstep:] = obs[i].data
#   resu = bandpass(delayed_stf, freqmin, freqmax, df, zerophase=True)
   reconv_data = ifft((fft(obs[i].data)/ft_stf_obs)*(ft_stf_syn) ).real()
   output[i].data = np.float32(reconv_data)
   #output[i].taper(0.05, type='hann')
   output[i].stats.delta=0.01
   #print "maximum abs value of trace " + str(i) + " : " + str(max(abs(obs[i].data)))
   #plt.plot(abs(ft_stf_obs)/nstep) 
   #plt.figure()
   #plt.plot(abs(ft_stf_syn)/nstep)
   #plt.figure()
   #plt.plot(abs(fft(obs[i].data))/nstep)
   #plt.show()
#plt.show()
output.write('./reconv_data.su',format='SU')

