#!/usr/bin/env python

## /scratch/gpfs/jiazeh/inversion_test2/zplot_signals_load_su.py
## load data to plot one signal from adj, obs, and syn 

### created on Wed Dec 12 10:51:11 EST 2018
### created by Jiaze He 

### per iteration, per event, syn, obs, adj loading

#data_para = para_struct('data_para')
#data_para.filenamelist = glob.glob(INPUT_path + "*Up*")

#directory_list = list()
#for root, dirs, files in os.walk(INPUT_path, topdown=False):
#    for name in files:
#        directory_list.append(os.path.join(root, name))

#print directory_list

#priny('INPUT_path', INPUT_path)
#print(data_para.filenamelist)
#filenamelist = [syn, obs, adj]
#for f in data_para.filenamelist:
#    fhead=(f[len(INPUT_path)+1:len(INPUT_path)+4])
#    print(fhead)
INPUT_adj_file = INPUT_path + 'adj/%06d/Up*' % source_num
stream = read(INPUT_adj_file,format='SU', byteorder='<')
    # convert stream to image array
data = _convert_to_array(stream)
adict = {}
adict[INPUT_adj_file[:2]] = data
#adict['pkt_np_array'] = data
adict['whatever'] = 1 
adj_data = np.asarray(data)

#print('INPUT_adj_file',INPUT_adj_file)
#print('shape of adj_data', adj_data.shape)


INPUT_syn_file = INPUT_path + 'syn/%06d/Up*' % source_num
stream = read(INPUT_syn_file,format='SU', byteorder='<')
    # convert stream to image array
data = _convert_to_array(stream)
adict = {}
adict[INPUT_adj_file[:2]] = data
#adict['pkt_np_array'] = data
adict['whatever'] = 1 
syn_data = np.asarray(data)

#print('INPUT_syn_file',INPUT_syn_file)
#print('shape of syn_data', syn_data.shape)




#    if fhead=='syn':
#
#        print('is'+ fhead)
#        syn_data = np.asarray(data)
#        print('shape of Ux_data:', syn_data.shape)
#        #np.save(npfile,Ux_data)
#    elif fhead=='obs':
#        print('is'+ fhead)
#        obs_data = np.asarray(data)
#        print('shape of Uz_data:', obs_data.shape)
#        #np.save(npfile,Uz_data)
#    elif fhead=='adj':
#        print('is'+ fhead)
#        adj_data = np.asarray(data)
#        print('shape of Up_data:', adj_data.shape)
#        #np.save(npfile,Uz_data)
    



