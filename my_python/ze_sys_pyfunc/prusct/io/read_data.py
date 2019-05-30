
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

    INPUT_path_folder =os.getcwd() + '/obf/input/obs_ts400/'
    OUTPUT_path_folder =os.getcwd() + '/obf/output/obs_ts400_su_delay_adjust/'
    
    i2= (i-1) 
    save_su_fn = '%06d/' % i2 
    
    #idir='/home/jiazeh/Desktop/my_files/py2project/pythonvenv_playground/james_source_inversion/obf/input/Up_delay_ricker_noatt_f0300000.su'
    ifile=INPUT_path_folder + obs_file
    ofolder = OUTPUT_path_folder + save_su_fn
    ofile= ofolder + 'Up_file_single.su'
    
    stream_interp_delay(idir=ifile, t_total_obs=t_total_obs, t_totalNew_obs=t_totalNew_obs, ofolder=ofolder, ofile=ofile)
    #stream_interp(idir=ifile, t_total_obs=t_total_obs, t_totalNew_obs=t_totalNew_obs, ofolder=ofolder, ofile=ofile)



def stream_interp(idir=0, t_total_obs=0, t_totalNew_obs=0, ofolder=0, ofile=0):

    import prusct.io.read_data as rd

    ### flip the sign as needed
    data_obs=-rd.readmat(idir=idir)
    print('shape of data_obs:',(data_obs).shape)
    from scipy import interpolate


    from seisflows.plugins import adjoint, misfit, readers, writers
    import prusct.io.read_data as rd

    reader = getattr(readers,'su')
    writer = getattr(writers,'su')


    data1 = reader('obf/input/','Up_scsic_r14_gpu_mtrue1578stf8_seis6_f03500000.su')

    for trace_num in range(0,176,1):
        trace_obs = data_obs[:,trace_num]
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

    data1.write(ofile,format='SU')

def stream_interp_delay(idir=0, t_total_obs=0, t_totalNew_obs=0, ofolder=0, ofile=0,steps_num=-3412):

    import prusct.io.read_data as rd

    ### flip the sign as needed
    data_obs=rd.readmat(idir=idir)
    #if steps_num < 0:
    #    ## padd zeros to the front
    #    zerosarray = np.zeros((abs(steps_num),176))
    #    data_Re_obs =  np.concatenate((zerosarray, data_obs[0:-1-abs(steps_num)+1,:]), axis=0)

    #elif steps_num > 0:
    #    zerosarray = np.zeros((abs(steps_num),176))
    #    data_Re_obs =  np.concatenate((data_obs[abs(steps_num):-1,:],zerosarray), axis=0)
    #print('data_Re_obs', data_Re_obs.shape)
    #print('t_total_obs', t_total_obs.shape)

    from numpy.linalg import norm


    from scipy import interpolate


    from seisflows.plugins import adjoint, misfit, readers, writers
    import prusct.io.read_data as rd

    reader = getattr(readers,'su')
    writer = getattr(writers,'su')


    data1 = reader('obf/input/','Up_scsic_r14_gpu_mtrue1578stf8_seis6_f03500000.su')

    for trace_num in range(0,176,1):
        trace_obs = data_obs[:,trace_num]
        #trace_obs = data_Re_obs[:,trace_num]
        interped_trace = utraceprepare(trace_obs, t_total_obs, t_totalNew_obs)
        zerosarray=np.zeros(abs(steps_num),)
        interped_trace_delay =  np.concatenate((zerosarray,interped_trace[0:-1-abs(steps_num)+1,]), axis=0)
        interped_trace_delay_norm = interped_trace_delay/norm(interped_trace_delay)
        data1[trace_num].data[:] = interped_trace_delay_norm 
        data1[trace_num].stats.sampling_rate = 1/4e-4

    import shutil
    import os
    
    if os.path.exists(ofolder):
        shutil.rmtree(ofolder)

    os.makedirs(ofolder)

    data1.write(ofile,format='SU')

    
 
