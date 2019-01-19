#!/usr/bin/env python

### constant generation

## created on Fri Nov  9 16:25:17 UTC 2018
## created by Jiaze He

## revised on Tue Nov 13 20:43:18 STD 2018
## add the trace range: inv_trace_num_star inv_trace_num_end

#inv_trace_num_star = 88 
#inv_trace_num_end = 89 

#####################
# create a class of structure that can be used to store parameters for 
#from myFormat.data_format import para_struct
exp_para = para_struct('exp_para')
# load all parameters: 

flag_plot_spectrum = 1 # 1 plot, 2 not plot
exp_para.flag_plot_spectrum=flag_plot_spectrum
flag_check_recovered = 2 # 1 run 2 not run 
exp_para.flag_check_recovered=flag_check_recovered
flag_stf_inverse = 1 # 1 run 2 not run 
exp_para.flag_stf_inverse=flag_stf_inverse
flag_plot_inverted_stf = 1 # 1 plot # 2 not plot
exp_para.flag_plot_inverted_stf=flag_plot_inverted_stf
flag_save_inverted_stf = 1 # 1 save # 2 not save 
exp_para.flag_save_inverted_stf=flag_save_inverted_stf
flag_istf_using_stack = 2 # 1 yes # 2 not stack
exp_para.flag_istf_using_stack=flag_istf_using_stack


syn_name = 'gaussian'; exp_para.syn_name=syn_name
obs_name = 'tbd' # to be determined
exp_para.obs_name=obs_name


f0=3500000; exp_para.f0 = f0
fmax = 10000000; exp_para.fmax = fmax
#####   dt related  ####################################################
dt = 4e-9; exp_para.dt = dt 
dtsyn = 4e-9; exp_para.dtsyn = dtsyn
dtobs = 5e-8; exp_para.dtobs = dtobs
UpSampleFact = dtsyn/dtobs; exp_para.UpSampleFact=UpSampleFact
UpSampleFact2 = 1; exp_para.UpSampleFact2=UpSampleFact2 
SubSampleFact = 1; exp_para.SubSampleFact=SubSampleFact;
dtNew = dt*UpSampleFact; exp_para.dtNew = dtNew;

print('UpSampleFactor : %20.19f ' % UpSampleFact) 
#UpSampleFact2 = dtsyn 
## dt for after resampling 
dtNewobs = dtobs*UpSampleFact; exp_para.dtNewobs = dtNewobs;
dtNewsyn = dtsyn*UpSampleFact2; exp_para.dtNewsyn = dtNewsyn;
dtNewsyncomp= dtsyn*SubSampleFact; exp_para.dtNewsyncomp= dtNewsyncomp;

#####   fs related  ####################################################
##### sampling rate - original  
fssyn = 1.0/dtsyn; exp_para.fssyn=fssyn;
fsobs = 1.0/dtobs; exp_para.fsobs=fsobs;
#### sampling rate after resampling
fsNew=1./dtNew; exp_para.fsNew=fsNew;
fsNewsyn=1./dtNewsyn; exp_para.fsNewsyn=fsNewsyn;
fsNewobs=1./dtNewobs; exp_para.fsNewobs=fsNewobs;
fsNewsyncomp = 1.0/dtNewsyncomp; exp_para.fsNewsyncomp=fsNewsyncomp;
print('sampling rate fsNewsyncomp after resampling : %f Hz' % fsNewsyncomp)


#%%% about the filters 
half_width=400000; exp_para.half_width = half_width;
low_freq=100000; exp_para.low_freq = low_freq;
high_freq=900000; exp_para.high_freq = high_freq;
band=[low_freq,high_freq]; exp_para.band = band;
nyq_freq=2.5e7; exp_para.nyq_freq = nyq_freq;

#####   Nt related  ####################################################
#SOURCE_SIGNAL_MATRIX=para.SOURCE_SIGNAL_MATRIX;

#%rawdata = para.rawdata;
Nt=42000; exp_para.Nt = Nt; 
#Na=20250; exp_para.Na = Na; 
NSrc=1; exp_para.NSrc = NSrc; 
NRec=176; exp_para.NRec = NRec;

Ntsyn=42000; exp_para.Ntsyn = Ntsyn;
Ntsyncomp=42000; exp_para.Ntsyncomp=Ntsyncomp;
Ntobs=3360; exp_para.Ntobs = Ntobs; 


## time steps after resamping
NtNewobs = int(Ntobs/UpSampleFact)
exp_para.NtNewobs=NtNewobs
NtNewsyn = int(Ntsyn/UpSampleFact2)
exp_para.NtNewobs=NtNewobs
# number of time steps for the subsampled recovered data - 5800
NtNewsyncomp= int(Ntsyncomp/SubSampleFact)
exp_para.NtNewsyncomp=NtNewsyncomp

#print('time steps after resamping Ntnewobs = ',NtNewobs)

#####   total time related  #################################################
t_total = np.arange(dtNew,Nt*dtNew+dtNew,dtNew)
t_cut = t_total;#exp_para.t_cut = t_cut
t_total_syn = np.arange(dtsyn,Ntsyn*dtsyn+dtsyn,dtsyn)
t_total_obs = np.arange(dtobs,Ntobs*dtobs+dtobs,dtobs)

## time array - aftering resampling 
t_totalNew_obs = np.arange(dtNewobs,NtNewobs*dtNewobs+dtNewobs,dtNewobs)
t_totalNew_syn = t_total_syn;
# this the 5800
t_totalNew_comp = np.arange(dtNewsyncomp,NtNewsyncomp*dtNewsyncomp+dtNewsyncomp,dtNewsyncomp)

sample_total = np.arange(1,Nt+1,1)
sample_syn = np.arange(1,Ntsyn+1,1)
sample_obs = np.arange(1,Ntobs+1,1)
#sample_cut = np.arange(1,output_time_step+1,1)
#sample_cut  = sample_total

### 1.0 filtering of the observed data 
import math as M
from future.utils import native
def next_pow_2(i):
    """
    Find the next power of two

    >>> int(next_pow_2(5))
    8
    >>> int(next_pow_2(250))
    256
    """
    # do not use NumPy here, math is much faster for single values
    buf = M.ceil(M.log(i) / M.log(2))
    return native(int(M.pow(2, buf)))


nfft = next_pow_2(Nt); exp_para.nfft=nfft
nfftsyn = next_pow_2(Ntsyn); exp_para.nfftsyn=nfftsyn
nfftobs = next_pow_2(Ntobs); exp_para.nfftobs=nfftobs


## length of total sampling points for fft, after resampling 
nfftNewobs = next_pow_2(NtNewobs);
exp_para.nfftNewobs=nfftNewobs
nfftNewsyn = next_pow_2(NtNewsyn)
exp_para.nfftNewsyn=nfftNewsyn
nfftNewsyncomp = next_pow_2(NtNewsyncomp)
exp_para.nfftNewsyncomp=nfftNewsyncomp

## df after padding
dfNew_pad = (fsNew/nfft); exp_para.dfNew_pad=dfNew_pad
dfNew_padsyn = (fsNewsyn/nfftsyn); exp_para.dfNew_padsyn=dfNew_padsyn
dfNew_padobs = (fsNewobs/nfftobs); exp_para.dfNew_padobs=dfNew_padobs
dfNew_padResyn = (fsNewsyn/nfftNewsyn);
exp_para.dfNew_padResyn=dfNew_padResyn

dfNew_padReobs = (fsNewobs/nfftNewobs)
exp_para.dfNew_padReobs=dfNew_padReobs

dfNew_padSubsyn = (fsNewsyncomp/nfftNewsyncomp)
exp_para.dfNew_padSubsyn=dfNew_padSubsyn

### 1.01 calculate the frequency spectrum for original signals before intepolations
xf = np.linspace(0.0, fsNew, nfft)
xf_obs = np.linspace(0.0, fsobs, nfftobs)

### 1.03 resampling the signals such that sythetics and experimental data will match 
xf_Newobs = np.linspace(0.0, fsNewobs, nfftNewobs)
xf_Newsyn = np.linspace(0.0, fsNewsyn, nfftNewsyn)

### 1.04 filtering the resampled signal 
## just to show full spectrum, the real one is a bit later	
## figureid=101
freqmin=1000; exp_para.freqmin=freqmin
freqmax=100000; exp_para.freqmax=freqmax


### 1.05 plot FFT results for resampling
freq_show_star = 1; exp_para.freq_show_star=freq_show_star
freq_show_end = 1000000; exp_para.freq_show_end=freq_show_end

freq_show_list=[freq_show_star,freq_show_end]

freq_step_star = int(round(freq_show_star/dfNew_pad))
exp_para.freq_step_star=freq_step_star
freq_step_end = int(round(freq_show_end/dfNew_pad))
exp_para.freq_step_end=freq_step_end
print('freq_step_star is ' +  str(freq_step_star))

freq_step_starNewobs = int(round(freq_show_star/dfNew_padReobs))
exp_para.freq_step_starNewobs=freq_step_starNewobs
freq_step_endNewobs = int(round(freq_show_end/dfNew_padReobs))
exp_para.freq_step_endNewobs=freq_step_endNewobs

freq_step_starNewsyn = int(round(freq_show_star/dfNew_padResyn))
exp_para.freq_step_starNewsyn=freq_step_starNewsyn
freq_step_endNewsyn = int(round(freq_show_end/dfNew_padResyn))
exp_para.freq_step_endNewsyn=freq_step_endNewsyn


# plot the received signals
time_star= 100 * dtobs; exp_para.time_star=time_star
time_end = 3200 * dtobs; exp_para.time_end=time_end

t_star_show = int(time_star/dtNew); exp_para.t_star_show=t_star_show
t_end_show = int(time_end/dtNew); exp_para.t_end_show=t_end_show

t_star_showsyn = int(time_star/dtsyn);
exp_para.t_star_showsyn=t_star_showsyn
t_end_showsyn = int(time_end/dtsyn)
exp_para.t_end_showsyn=t_end_showsyn

t_star_showobs = int(time_star/dtobs)
exp_para.t_star_showobs=t_star_showobs
t_end_showobs = int(time_end/dtobs)
exp_para.t_end_showobs=t_end_showobs

t_starNew_showobs = int(time_star/dtNewobs)
exp_para.t_starNew_showobs=t_starNew_showobs
t_endNew_showobs = int(time_end/dtNewobs)
exp_para.t_endNew_showobs=t_endNew_showobs

stf_subsample_factor = 1; exp_para.stf_subsample_factor = stf_subsample_factor 


pickle.dump(exp_para,open(save_exp_para_pickledump_fn,'wb'))

#execfile('pplot_one_spectrum.py')
#from myFormat.ze_plot_summary import textplot 
##print('textplot- run')
save_parafile_constants='src_csic_jp_results/para_constants.png'
textplot(exp_para,save_parafile_constants,flag_close=0)

####add_slide_ze(save_parafile_constants,total_filename_pptx)
