import numpy as np 

### plot t_x signals using numpy arrays

### created on Sun Mar 31 22:28:36 UTC 2019 
### created by Jiaze He  


import numpy as np
import matplotlib.pyplot as plt 



def _cscale(v, clip=100):
    """ Return limits for colormap.
    """
    perc = clip / 100.
    return -perc * abs(v).max(), perc * abs(v).max()
def _get_time(stream):
    """ Get fixed time vector for stream object.
    """
    dt = stream[0].stats.delta
    nt = len(stream[0].data)
    return np.arange(0, nt*dt, dt)

def _get_time2(dt,nt):
    """ Get fixed time vector for stream object.
    """
    #dt = stream[0].stats.delta
    #nt = len(stream[0].data)
    return np.arange(0, nt*dt, dt)

def get_regular_ticks(v, interval):
    """ Returns regular tick intervals.
    """
    from scipy.interpolate import interp1d

    f = interp1d(v, range(len(v)))
    begin = int(v[0] / interval) * interval
    end = v[-1]
    tick_labels = np.arange(begin, end, interval)
    ticks = f(tick_labels)

    return ticks, tick_labels


def _get_offsets(stream):
    """ Return offsets.
    """
    nr = len(stream)
    offsets = np.zeros(nr)
    scalco = stream[0].stats.su.trace_header.scalar_to_be_applied_to_all_coordinates

    # set scale to km
    if scalco == 0:
        scalco = 1e-3 # assume coords are in m
    else:
        scalco = 1.0e-3 / scalco

    for i, tr in enumerate(stream):
        offsets[i] = (tr.stats.su.trace_header.group_coordinate_x -
                      tr.stats.su.trace_header.source_coordinate_x) * scalco
    return offsets


def plot_section_steps(data=np.random.rand(11, 11), clip=100, title='', dt = 5e-8, \
                       y_star = 0, y_end = 11, x_interval=1.0, y_interval=100.0, \
                       fraction_val=0.06, pad_val=0.04,cmap='seismic',\
                       fsize = 6,scale_factor = 1.5,fig_filename='',flag_savepng=0):

    nr = len(data[0,:])
    nt = len(data[1,:])

    d_aspect = (nr) / float(y_end-y_star)
    y_range=np.arange(y_star, y_end)
    
    fig, ax = plt.subplots(figsize=(fsize, scale_factor*fsize))

    im = ax.imshow(data[y_star:y_end,:], aspect=scale_factor*d_aspect, clim=_cscale(data, clip=clip))
    
    im.set_cmap(cmap)
    pad=pad_val
    fraction=fraction_val
    fig.colorbar(im,fraction=fraction, pad=pad, extend='both')
    # labels
    ax.set_title(title)
    ax.set_xlabel('Receiver number')
    #ax.set_ylabel(r'Time ($\mu s$)')
    ax.set_ylabel(r'Time Steps')
    
    yticks, ytick_labels = get_regular_ticks(y_range, y_interval)
    ax.set_yticks(yticks)
    ax.set_yticklabels(ytick_labels)
    if flag_savepng is 1:
       plt.savefig(fig_filename,format='png', bbox_inches='tight') 
    #fig.show()

def plot_one_signal_comp(data_syn=np.random.rand(11, 11),data_obs=np.random.rand(11, 11),\
                     dt_syn=0,dt_obs=0,source_num=0,receiver_num=0,iter_num=0,\
                    t_star_showsyn=0, t_end_showsyn=0,t_star_showobs=0, t_end_showobs=0,\
                    flag_range=0,flag_same_range=0,fig_filename='',flag_savepng=0):
    
    
    nt_syn=len(data_syn[:,0])
    nt_obs=len(data_obs[:,0])
    t_total_syn=np.arange(dt_syn,dt_syn*(nt_syn+1),dt_syn)
    t_total_obs=np.arange(dt_obs,dt_obs*(nt_obs+1),dt_obs)
  
    if flag_range is 0: 
        # show the total time step range
        t_end_showsyn=len(data_syn[:,0])
        t_end_showobs=len(data_obs[:,0])
    elif flag_same_range is 1: 
        # if show the same time range
        # for well-aligned data only
        t_star_showobs=int(t_total_syn[t_star_showsyn]/dt_obs)
        t_end_showobs=int(t_total_syn[t_end_showsyn]/dt_obs)
    
    fig, (ax2,ax3,ax5) = plt.subplots(nrows=3)
    ax2.plot(t_total_syn[t_star_showsyn:t_end_showsyn],data_syn[t_star_showsyn:t_end_showsyn,receiver_num],'g-')
    ax2.set_title('synthetic -source '+str(source_num)+' trace ' + str(receiver_num))
    ax2.set_xlabel(r'time ($\mu s$)')

    ax3.plot(t_total_obs[t_star_showobs:t_end_showobs],data_obs[t_star_showobs:t_end_showobs,receiver_num],'m-')
    ax3.set_title('observed -source '+str(source_num)+' trace ' + str(receiver_num))
    ax3.set_xlabel(r'time ($\mu s$)')

    ax5.plot(t_total_syn[t_star_showsyn:t_end_showsyn],\
             data_syn[t_star_showsyn:t_end_showsyn,receiver_num]/max(data_syn[t_star_showsyn:t_end_showsyn,receiver_num]),\
             'g-',label='syn')
    ax5.plot(t_total_obs[t_star_showobs:t_end_showobs],\
             data_obs[t_star_showobs:t_end_showobs,receiver_num]/max(data_obs[t_star_showobs:t_end_showobs,receiver_num]),\
             'm-',label='obs')
    ax5.set_title('together - iter num' + str(iter_num) + ' , source '+str(source_num)+' trace ' + str(receiver_num))
    ax5.set_xlabel(r'time ($\mu s$)')

    plt.tight_layout(rect=[0, 0, 1.5, 1.3])
    if flag_savepng is 1:
        plt.savefig(fig_filename,format='png', bbox_inches='tight')
    #plt.close(fig)



#def plot_signal_comp(syn_data=np.random.rand(11, 11),obs_data=np.random.rand(11, 11),channel=0,\
#                     t_total_obs):
#    fig, (ax2,ax3,ax5) = plt.subplots(nrows=4)    
#    ax2.plot(t_total_obs[t_star_showobs:t_end_showobs],syn_data[t_star_showobs:t_end_showobs,receiver_num],'g-')
#    ax2.set_title('synthetic -source '+str(source_num)+' trace ' + str(receiver_num))
#    ax2.set_xlabel(r'time ($\mu s$)')
#
#    ax3.plot(t_total_obs[t_star_showobs:t_end_showobs],obs_data[t_star_showobs:t_end_showobs,receiver_num],'m-')
#    ax3.set_title('observed -source '+str(source_num)+' trace ' + str(receiver_num))
#    ax3.set_xlabel(r'time ($\mu s$)')
#
#    ax5.plot(t_total_obs[t_star_showobs:t_end_showobs],syn_data[t_star_showobs:t_end_showobs,receiver_num],'g-',label='syn')
#    ax5.plot(t_total_obs[t_star_showobs:t_end_showobs],obs_data[t_star_showobs:t_end_showobs,receiver_num],'m-',label='obs')
#    ax5.set_title('together - iter num' + str(iter_num) + ' , source '+str(source_num)+' trace ' + str(receiver_num))
#    ax5.set_xlabel(r'time ($\mu s$)')
#
#    plt.tight_layout(rect=[0, 0, 1.5, 1.3])
#
#    plt.savefig(save_signals_seisflows_png,format='png', dpi=150, bbox_inches='tight')
#    #plt.show()
#    plt.close(fig)


