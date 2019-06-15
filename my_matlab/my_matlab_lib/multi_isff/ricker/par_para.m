%%% time domain stf - constants

Nt = 1200
dt = 4e-8 
total_time = Nt*dt
t = dt:dt:total_time;

fc = 350000; % A low wavelength of 25 Hz
delay_steps_removal = Nt/2 - 200;


%% frequency domain constants
% y=w_less_delay;

f_show_star = 20000
f_show_end = 1000000

fs = 1/dt;
Nt = length(t);
Nt_fft = 2^nextpow2(Nt);

k = 0:Nt_fft-1;
% Xk = fft(y,Nt_fft);

f = (k/Nt_fft)*fs;
df = fs/Nt_fft;

fn_show_star = round(f_show_star/df)
fn_show_end = round(f_show_end/df)
%%%% temp

%% for stf 
% number of receivers
m = 3 
% number of sources
n = 2

