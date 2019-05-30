#!/usr/bin/env python

# old way for generating plots in signals in mat and txt   

# revised on Tue Oct 16 20:14:21 UTC 2018
# created by Jiaze He


import os

cwd = os.getcwd()
#onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]
src_files = os.listdir(cwd)

import argparse

from obspy import read
import matplotlib.pyplot as plt
from seisflows.tools.graphics import plot_section
import numpy as np
import pandas as pd
import obspy
import matplotlib.pyplot as plt
from scipy.interpolate import interp1d

from obspy.core.stream import Stream

import argparse

#from obspy import read
import matplotlib.pyplot as plt

from seisflows.tools.graphics import plot_section, _convert_to_array

import scipy.io as sio
# for file finding
import glob




# create a class of structure that can be used to store parameters for ML 
class para_struct:

    def __init__(self, name):
        self.name = name

    pass

sensor_array_su = para_struct('sensor_array_su')
OUTPUT_FILES_path = "obf"
sensor_array_su.filenamelist = glob.glob(OUTPUT_FILES_path + '/' + "*file_single.su")


for f in sensor_array_su.filenamelist:
    fhead=(f[len(OUTPUT_FILES_path)+1:len(OUTPUT_FILES_path)+3])
    print(fhead)
    #relativefiles = './' + OUTPUT_FILES_path + '/' + fhead
    stream = read(f,format='SU', byteorder='<')
    #sismo_png_fn = './' + OUTPUT_FILES_path + '/' + fhead + '_seismo.png'
    #./savesismo f -save= sismo_png_fn -c=100 -xint=2 -yint=1000 -c=90 > /dev/null &
    matfile = './' + OUTPUT_FILES_path + '/' + fhead + '.mat'
    txtfile = './' + OUTPUT_FILES_path + '/' + fhead + '.txt'
    # convert stream to image array
    data = _convert_to_array(stream)
    adict = {}
    adict[f[:2]] = data
    #adict['pkt_np_array'] = data
    adict['whatever'] = 1 

    sio.savemat(matfile,adict)
    np.savetxt(txtfile, data, fmt='%20.19f')   # X is an array
   
    if fhead=='Ux':
        print('is'+fhead)
        Ux_data = np.asarray(data)
	print(Ux_data.shape)
    elif fhead=='Uz':
	print('is'+fhead)
        Uz_data = np.asarray(data)
        print(Uz_data.shape)

data_big = np.stack((Ux_data,Uz_data)).transpose(1,0,2)


	#U_data = np.concatenate((Ux_data, Uz_data), axis=1)
        #print(U_data.shape)
#data_load = np.loadtxt("OUTPUT_FILES/wcsg.txt")
#print(type(data_load))

#for i in range(25000):
#    print(Ux_data[i,1])

RecPos_fn = 'DATA/RecPos_fn_000000.dat'
RecPos = pd.read_csv(RecPos_fn,header=None)
RecPosValues=(RecPos.values/0.1).transpose()
print(RecPosValues.shape)

pd_big = RecPosValues*data_big
normal_disp = pd_big.sum(1)
np.savetxt('OUTPUT_FILES/U_norm_disp.txt', normal_disp, fmt='%20.19f')   # X is an array

fig = plt.figure()
ax = plt.subplot(111)
ax.imshow(normal_disp)
ax.set_aspect('auto')
fig.show()
fig.savefig('OUTPUT_FILES/U_norm_disp', format='eps', dpi=1000)


  #  plot_section(stream,
  #      cmap=args.cmap,
  #      clip=(100-args.clip),
  #      title=args.title,
  #      x_interval=args.x_interval,
  #      y_interval=args.y_interval)

  #  plt.show()

###################

  #  # default values
  #  fsize = 6
  #  scale_factor = 1.5

  #  if ax is None:
  #      fig, ax = plt.subplots(figsize=(fsize, scale_factor*fsize))

  #  im = ax.imshow(normal_disp, aspect=scale_factor*d_aspect, clim=_cscale(data, clip=clip))
  #  im.set_cmap(cmap)

  #  # labels
  #  ax.set_title(title)
  #  ax.set_xlabel('Offset [km]')
  #  ax.set_ylabel('Time [s]')

  #  #set ticks
  #  t =  
  #  yticks, ytick_labels = get_regular_ticks(t, y_interval)
  #  ax.set_yticks(yticks)
  #  ax.set_yticklabels(ytick_labels)

  #  offsets =_get_offsets(stream)
  #  xticks, xtick_labels = get_regular_ticks(offsets, x_interval)
  #  ax.set_xticks(xticks)
  #  ax.set_xticklabels(xtick_labels)

  #  return ax








#for i in range(450):
#    #print(RecPosValues[i,:].shape)
#    for j in range(25000):
#        #print(Ux_data[j,i])
#        row_one_step=np.append([Ux_data[j,i]], [Uz_data[j,i]],axis=0)
#	#print(row_one_step)
#	dp2[[j,i]] = np.dot(row_one_step,RecPosValues[i,:].T)
#
##print(dp2)
#np.savetxt('dp2', dp2, fmt='%20.19f')   # X is an array

#plot_section(dp2,
             #cmap=args.cmap,
             #clip=(100-args.clip),
             #title=args.title,
             #x_interval=args.x_interval,
             #y_interval=args.y_interval)
