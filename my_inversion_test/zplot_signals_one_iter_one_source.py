#!/usr/bin/env python

## zplot_signals_one_iter_one_source.py
## One iteration and one source: plot several signals to evaluate inversion behaviors

### created on Thu Dec  6 18:17:23 UTC 2018
### created by Jiaze He 


INPUT_path = "./output/traces_%04d/" % (iter_num)
OUTPUT_FILES_path = "./output/traces_%04d/" % (iter_num)


#INPUT_obs_file = 'output/traces/obs/%06d/Up*' % source_num
#stream = read(INPUT_obs_file,format='SU', byteorder='<')
#    # convert stream to image array
#data = _convert_to_array(stream)
#adict = {}
#adict[INPUT_obs_file[:2]] = data
##adict['pkt_np_array'] = data
#adict['whatever'] = 1 
#obs_data = np.asarray(data)


obs_data = load_su2np(INPUT_path,'obs',source_num)


#print('INPUT_obs_file',INPUT_obs_file)
#print('shape of obs_data', obs_data.shape)

#rec_matrix = [10,15,20,25,30]

zplot_signals_one_src_all_rec(iter_num,source_num, rec_matrix, obs_data, OUTPUT_FILES_path,INPUT_path,save_sig_plot_para_pickledump_fn)

#for receiver_num in rec_matrix: 
#   save_signals_seisflows_png = OUTPUT_FILES_path + 'one_signal_src%d_rec%d.png' % (source_num,receiver_num)
#   #execfile('zplot_signals_load_su.py')
#   adj_data = load_su2np(INPUT_path,'adj',source_num) 
#   syn_data = load_su2np(INPUT_path,'syn',source_num) 
#   execfile('zplot_signals_one_fig.py')



