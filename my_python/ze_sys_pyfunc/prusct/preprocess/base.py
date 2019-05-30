
from scipy import interpolate
import numpy as np

def utraceprepare(data_obs, t_total_obs,trace_num):
    trace_obs = data_obs[:,trace_num]
    tck = interpolate.splrep(t_total_obs, trace_obs, s=0)
    traceNew_obs = interpolate.splev(t_totalNew_obs, tck, der=0)
    data_Re_obs[:,trace_num] = traceNew_obs



## no use ---
def one_trace_interp(trace=np.random.rand(1, 11), dt=0, flag_range=0,\
                     t_star_use=0,t_end_use=0,:
                     flag_range=0,flag_full_range=1,)
    nt=len(trace[:,0]) 
    t_total=np.arange(dt,dt*(nt+1),dt) 

    if flag_range is 0:
        t_end_use=nt
    elif flag_full_range is 1:
        # if show the same time range
        # for well-aligned data only
        t_star_use=int(t_total[t_star_use]/dt)
        t_end_use=int(t_total[t_end_use]/dt)



