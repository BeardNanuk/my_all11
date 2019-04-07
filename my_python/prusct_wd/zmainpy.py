#!/usr/bin/env python

import matplotlib
matplotlib.use('Agg')


print('this is a shell script containing python command')

execfile('paths.py')

import prusct.io.read_data as rd

data_syn=rd.readsu(idir=synpath)
print('shape of data_syn:',(data_syn).shape)
data_obs=rd.readmat(idir=obspath)
print('shape of data_obs:',(data_obs).shape)

from my_sfs.ze_plot_section import plot_section_steps
plot_section_steps(data=data_syn, y_star = 10000, y_end = 22000, \
title='data_syn', y_interval=2000., fig_filename=syn_opng,flag_savepng=1)
plot_section_steps(data=data_obs, y_star = 1500, y_end = 2700,\
title='data_obs',fig_filename=obs_opng,flag_savepng=1)
 
execfile('zmulti_signal_comp.py')



