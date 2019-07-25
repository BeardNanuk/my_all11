
from scipy import interpolate
import numpy as np

def readsu(idir='obf/input/Up_delayed_ricker_f0500000.su'):
    # read .su file using obspy and seisflows.tools.graphics
    # return a numpy array	
    from obspy import read 
    from seisflows.tools.graphics import _convert_to_array
    stream_obs = read(idir,format='SU', byteorder='<')    
    data_np = _convert_to_array(stream_obs)
    return data_np

def readebsu(idir='', t_total=0,NREC=0):
    """ Reads Seismic Unix files

      Hardwired - return numpy array''
    """
    import obspy
    import numpy as np
    from obspy.core import Stream, Stats, Trace

    with open(idir, 'rb') as file:
      SU_data_linear = np.fromfile(file,dtype=np.float32)
    #print('shape of SU_data_linear:',SU_data_linear.shape)     
    #print('time steps found as :',len(SU_data_linear)/float(NREC))   
    data_2d = SU_data_linear.reshape(NREC,t_total+60).transpose()
    
    return data_2d[60:,:]

####### seismic unix
    with open(idir, 'rb') as file:
      SU_data_linear = np.fromfile(file,dtype=np.float64)
    #print('shape of SU_data_linear:',SU_data_linear.shape)     
    #print('time steps found as :',len(SU_data_linear)/float(NREC))   
    data_2d = SU_data_linear.reshape(NREC,t_total).transpose()

    return data_2d[:,:]



#def readebsu(idir='',trace_obs=0, t_total_obs=0):
#    """ Reads Seismic Unix files
#
#      Hardwired ''
#    """
#    import obspy
#    import numpy as np
#    from obspy.core import Stream, Stats, Trace
#    #stream = obspy.read(path +'/'+ filename, 
#    #               format='SU',
#    #               byteorder='<')
#
#    with open(idir, 'rb') as file:
#      SU_data = np.fromfile(file,dtype=np.float32)
#
#    NSTEP = (len(SU_data)-PAR.NREC*60) / PAR.NREC
#
#    stream = Stream()
#    
#    for irec in range(PAR.NREC):
#        stats = Stats()
#        data = SU_data[60 + (60+NSTEP)*irec : (60+NSTEP)*(irec+1)]
#        stats.sampling_rate = 1./PAR.DT
#        #stats.npts = PAR.NT
#
#        stream.append(Trace(data=data, header=stats))
#
#    return stream

def readstreamsu(path, filename,t_total=0,NREC=0,dt=0):
    """ Reads Seismic Unix files

      Hardwired ''
    """
    import obspy
    import numpy as np
    from obspy.core import Stream, Stats, Trace
    #stream = obspy.read(path +'/'+ filename, 
    #               format='SU',
    #               byteorder='<')

    with open(path +'/'+ filename, 'rb') as file:
      SU_data = np.fromfile(file,dtype=np.float32)

    NSTEP = (len(SU_data)-NREC*60) / NREC

    stream = Stream()

    for irec in range(NREC):
        stats = Stats()
        data = SU_data[60 + (60+NSTEP)*irec : (60+NSTEP)*(irec+1)]
        stats.sampling_rate = 1./dt
        #stats.npts = PAR.NT

        stream.append(Trace(data=data, header=stats))

    return stream


def readmat(idir='',variable_name_in_mat='fan_beam_scan_full'):
    # return a numpy array	
    from scipy.io import loadmat
    matfile2=loadmat(idir)
    data_np = matfile2[variable_name_in_mat]
    return data_np

def utraceprepare(trace_obs=0, t_total_obs=0,t_totalNew_obs=0):
    tck = interpolate.splrep(t_total_obs, trace_obs, s=0)
    traceNew_obs = interpolate.splev(t_totalNew_obs, tck, der=0)
    return traceNew_obs
    #data_Re_obs[:,trace_num] = traceNew_obs
    

def mat_to_su(obs_file=0,i=0,t_total_obs=0,t_totalNew_obs=0):

    from myFormat.data_format import para_struct
    import pickle
    import os
    
    exp_para = para_struct('exp_para')

    ## i/o files

    obs_format = '.mat'
    #### obs_format = '.pickle'
    exp_para.obs_format = obs_format
    exp_para.obs_file = obs_file

    save_exp_para_pickledump_fn='parameters'
    pickle.dump(exp_para,open(save_exp_para_pickledump_fn,'wb'))

    ## dirs contain i/o files
    #obspath=os.getcwd() + '/obf/input/' + obs_file + obs_format

    #INPUT_path_folder =os.getcwd() + '/obf/input/obsFan_ts400_mat/'
    #OUTPUT_path_folder =os.getcwd() + '/obf/output/obsFan_ts400_su/'
    
    INPUT_path_folder =os.getcwd() + '/obf/input/emFan_ts0_mat/'
    OUTPUT_path_folder =os.getcwd() + '/obf/output/emFan_ts0_su/'

    i2= (i-1) 
    save_su_fn = '%06d/' % i2 
    
    #idir='/home/jiazeh/Desktop/my_files/py2project/pythonvenv_playground/james_source_inversion/obf/input/Up_delay_ricker_noatt_f0300000.su'
    ifile=INPUT_path_folder + obs_file
    ofolder = OUTPUT_path_folder + save_su_fn
    ofile= ofolder + 'Up_file_single.su'
    
    #stream_interp_delay(idir=ifile, t_total_obs=t_total_obs, t_totalNew_obs=t_totalNew_obs, ofolder=ofolder, ofile=ofile)
    stream_interp(idir=ifile, t_total_obs=t_total_obs, t_totalNew_obs=t_totalNew_obs, ofolder=ofolder, ofile=ofile)
    #stream_no_interp(idir=ifile, t_total_obs=t_total_obs, t_totalNew_obs=t_totalNew_obs, ofolder=ofolder, ofile=ofile)

def itsu2mat(itfoldername,ifolder,ofolder,NSRC=20):
    from shutil import copyfile,rmtree
    from scipy.io import savemat
    import os

    if os.path.exists(ofolder+itfoldername):
       rmtree(ofolder+itfoldername)
    os.makedirs(ofolder+itfoldername)
    for k in range(1,NSRC+1): 
    
        ifile = "output/traces/syn/%06d/Up_file_single.su" % (k-1)
        ipath = ifolder+itfoldername+ifile
        print(itfoldername + ifile +' copied')
        data_np=readsu(idir=ipath)
        adict = {}
        adict['rtoall'] = data_np
        adict['whatever'] = 1
        
        ofile = "Up_file_single_sfs_%04d.mat" % (k-1)
        opath = ofolder+itfoldername+ofile
        savemat(opath,adict)
        
        ####### STFs copy #################
        ifile = "output/OUTPUT_FILES/%06d/plot_source_time_function.txt" % (k-1)
        ipath = ifolder+itfoldername+ifile
        
        ofile = "stf_sfs_%04d.txt" % (k-1)
        opath = ofolder+itfoldername+ofile
        copyfile(ipath,opath)

def spsu2mat(spfoldername,itfoldername,ifolder,ofolder):
    from shutil import copyfile,rmtree
    from scipy.io import savemat
    import os

    if os.path.exists(ofolder+itfoldername):
       #rmtree(ofolder+itfoldername)
        print(ofolder+itfoldername)
    else:
        os.makedirs(ofolder+itfoldername)

    ifile = "OUTPUT_FILES/Up_file_single.su"
    ipath = ifolder+spfoldername+ifile
    print(spfoldername + ifile +' copied')
    data_np=readsu(idir=ipath)
    adict = {}
    adict['rtoall'] = data_np
    adict['whatever'] = 1

    ofile = "Up_file_single_ro.mat"
    opath = ofolder+itfoldername+ofile
    savemat(opath,adict)


def stream_no_interp(idir=0, t_total_obs=0, t_totalNew_obs=0, ofolder=0, ofile=0):

    import prusct.io.read_data as rd
    import prusct.io.write_data as wd

    ### flip the sign as needed
    data_obs = rd.readmat(idir=idir)
    #print('shape of data_obs:',(data_obs).shape)
    print('max of data_obs:',(data_obs).max())
    print('ofile: ', ofile) 
    #from scipy import interpolate

    data1 = readstreamsu('obf/input/','Up_file_single_3360.su',t_total=t_total_obs,NREC=176,dt=5e-4)

    for trace_num in range(0,176,1):
        trace_obs = data_obs[:,trace_num]
        data1[trace_num].data[:] = trace_obs
        data1[trace_num].stats.sampling_rate = 1/5e-4

    import shutil
    import os

    #print('max of data1[12].data[:].max():',data1[12].data[:].max())
    if os.path.exists(ofolder):
        shutil.rmtree(ofolder)

    os.makedirs(ofolder)

    wd.writestreamsu(data1,ofolder,'Up_file_single.su')
    #data1.write(ofile,format='SU')
    #data1.write(ofile)



def stream_interp(idir=0, t_total_obs=0, t_totalNew_obs=0, ofolder=0, ofile=0):

    import prusct.io.read_data as rd
    import prusct.io.write_data as wd

    ### flip the sign as needed
    data_obs=rd.readmat(idir=idir)
    print('shape of data_obs:',(data_obs).shape)
    from scipy import interpolate


    #from seisflows.plugins import adjoint, misfit, readers, writers
    #import prusct.io.read_data as rd

    #reader = getattr(readers,'su')
    #writer = getattr(writers,'su')


    #data1 = reader('obf/input/','Up_scsic_r14_gpu_mtrue1578stf8_seis6_f03500000.su')
    data1 = readstreamsu('obf/input/','Up_file_single_filter3syn.su',t_total=t_total_obs,NREC=176,dt=5e-4)

    for trace_num in range(0,176,1):
        trace_obs = data_obs[:,trace_num]
        #print('about to utraceprepare')
        #print('trace_obs.shape', trace_obs.shape)
        #print('t_total_obs.shape', t_total_obs.shape)
        #print('t_totalNew_obs.shape', t_totalNew_obs.shape)
        #print('shape of data1[trace_num].data[:].shape:',data1[trace_num].data[:].shape)
        #print('utrace -shape: ', utraceprepare(trace_obs, t_total_obs, t_totalNew_obs).shape)
        data1[trace_num].data[:] = utraceprepare(trace_obs, t_total_obs, t_totalNew_obs)
        data1[trace_num].stats.sampling_rate = 1/4e-4

    import shutil
    import os
    
    if os.path.exists(ofolder):
        shutil.rmtree(ofolder)

    os.makedirs(ofolder)

    wd.writestreamsu(data1,ofolder,'Up_file_single.su')
    #data1.write(ofile,format='SU')

def stream_interp_delay(idir=0, t_total_obs=0, t_totalNew_obs=0, ofolder=0, ofile=0,steps_num=-3412):

    import prusct.io.read_data as rd
    import prusct.io.write_data as wd

    ### flip the sign as needed
    data_obs=rd.readmat(idir=idir)
    print('shape of data_obs:',(data_obs).shape)
    print('steps_num ', steps_num)
    if steps_num < 0:
        ## padd zeros to the front
        zerosarray = np.zeros((abs(steps_num),176))
        data_Re_obs =  np.concatenate((zerosarray, data_obs[0:-1-abs(steps_num)+1,:]), axis=0)

    elif steps_num > 0:
        zerosarray = np.zeros((abs(steps_num),176))
        data_Re_obs =  np.concatenate((data_obs[abs(steps_num):-1,:],zerosarray), axis=0)
    print('data_Re_obs', data_Re_obs.shape)

    from scipy import interpolate

    #from seisflows.plugins import adjoint, misfit, readers, writers
    #import prusct.io.read_data as rd

    #reader = getattr(readers,'su')
    #writer = getattr(writers,'su')

    #data1 = reader('obf/input/','Up_file_single_filter3syn.su')
    data1 = readstreamsu('obf/input/','Up_file_single_filter3syn.su',t_total=t_total_obs,NREC=176,dt=5e-4)

    for trace_num in range(0,176,1):
        #trace_obs = data_obs[:,trace_num]
        trace_obs = data_Re_obs[:,trace_num]
        #print('about to utraceprepare')
        #print('trace_obs.shape', trace_obs.shape)
        #print('t_total_obs.shape', t_total_obs.shape)
        #print('t_totalNew_obs.shape', t_totalNew_obs.shape)
        data1[trace_num].data[:] = utraceprepare(trace_obs, t_total_obs, t_totalNew_obs)
        data1[trace_num].stats.sampling_rate = 1/4e-4

    import shutil
    import os
    
    if os.path.exists(ofolder):
        shutil.rmtree(ofolder)

    os.makedirs(ofolder)

    #data1.write(ofile,format='SU')
    wd.writestreamsu(data1,ofolder,'Up_file_single.su')

    
 
