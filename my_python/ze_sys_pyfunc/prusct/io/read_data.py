


def readsu(idir='obf/input/Up_delayed_ricker_f0500000.su'):
    # read .su file using obspy and seisflows.tools.graphics
    # return a numpy array	
    from obspy import read 
    from seisflows.tools.graphics import _convert_to_array
    stream_obs = read(idir,format='SU', byteorder='<')    
    data_np = _convert_to_array(stream_obs)
    return data_np

def readmat(idir='',variable_name_in_mat='fan_beam_scan_full'):
    # return a numpy array	
    from scipy.io import loadmat
    matfile2=loadmat(idir)
    data_np = matfile2[variable_name_in_mat]
    return data_np
     
