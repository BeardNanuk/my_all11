

%%% time domain stf - constants

Nt = 1100; STFALL.Nt = Nt;
dt = 4.882812500000000e-08; STFALL.dt = dt; 
total_time = Nt*dt; STFALL.total_time=total_time; 
t = dt:dt:total_time; STFALL.t=t;

fc = 300000; % A low wavelength of 25 Hz
STFALL.fc=fc

flag_plot_signal = 0; STFALL.flag_plot_signal =flag_plot_signal;
flag_plot_spectrum=0; STFALL.flag_plot_spectrum=flag_plot_spectrum;

%% ricker
delay_steps_removal = Nt/2 - 200; 
STFALL.delay_steps_removal =delay_steps_removal; 
% delay_steps_ricker = 190; STFALL.delay_steps_ricker=delay_steps_ricker;
% amp_att= 0.5; STFALL.amp_att = amp_att; 
amp_att_matrix= [0.4170,0.7203,1.1437e-04];

%% tone burst
peaks = 5; 
delay_steps = 140
%%%% frequency domain constants
% y=w_less_delay;

%% multiple signals 
num_src = 3; STFALL.num_src=num_src; 
num_rec = ceil(num_src*120); STFALL.num_rec=num_rec; 

%%
f_show_star = 20000; STFALL.f_show_star = f_show_star;
f_show_end = 1000000; STFALL.f_show_end=f_show_end;


fs = 1/dt; STFALL.fs=fs;
% Nt = length(t); STFALL.Nt=
Nt_fft = 2^nextpow2(Nt); STFALL.Nt_fft=Nt_fft;

k = 0:Nt_fft-1;STFALL.k=k;
% Xk = fft(y,Nt_fft);

f = (k/Nt_fft)*fs; STFALL.f=f;
df = fs/Nt_fft; STFALL.df=df;

 fn_show_star = round(f_show_star/df); STFALL.fn_show_star=fn_show_star;
 fn_show_end = round(f_show_end/df); STFALL.fn_show_end=fn_show_end;
%%%% temp



