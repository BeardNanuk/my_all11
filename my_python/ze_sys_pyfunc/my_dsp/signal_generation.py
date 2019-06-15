
# ze function for signal processing 
# created on Sat Sep 22 15:21:32 EDT 2018

## Revised on Wed Dec 26 17:20:43 EST 2018
##  25 def freqlist2indexes(freqlist,df):

import math as m 
import numpy as np
#from future.utils import native






def ricker(delay_steps_removal=0,f=300000, length=0, dt=4e-8,NtNew=5800):

    t = np.arange(-length/2, (length-dt)/2, dt)
    y = - (1.0 - 2.0*(np.pi**2)*(f**2)*(t**2)) * np.exp(-(np.pi**2)*(f**2)*(t**2))
    a = np.zeros(np.abs(delay_steps_removal))
    w_less_delay = np.append(y[delay_steps_removal:NtNew],a, axis=0)
    return t, w_less_delay 

def rickerad(delay_steps_removal=0,delay_steps_ricker=0, amp_att=1,f=300000, length=0, dt=4e-8,NtNew=5800):

    t = np.arange(-length/2, (length-dt)/2, dt)
    #print('amp_att:',amp_att)
    y = - amp_att*(1.0 - 2.0*(np.pi**2)*(f**2)*(t**2)) * np.exp(-(np.pi**2)*(f**2)*(t**2))
    adelay= np.zeros(np.abs(delay_steps_ricker))
    y=np.append(adelay,y,axis=0)
    a = np.zeros(np.abs(delay_steps_removal-delay_steps_ricker))
    w_less_delay = np.append(y[delay_steps_removal-delay_steps_ricker:NtNew],a, axis=0)
    return t, w_less_delay


def toneburst(peaks,delay_steps=0,f=300000,dtNew=1e-8,NtNew=5800):
    B=2*f/m.sqrt(3)/peaks
    fmax=f+B
    fmin=f-B
    dfpulselen = (peaks/fmax)
    df1 = m.ceil(dfpulselen/dtNew)

    signal3 = np.sin(2*m.pi*f*dtNew*np.arange(0, df1))*np.hanning(df1)
    signal4 = np.append(np.zeros(int(delay_steps)),signal3, axis=0)
    signal5 = np.append(signal4,np.zeros(int(NtNew-df1-delay_steps)), axis=0)
    return signal5

