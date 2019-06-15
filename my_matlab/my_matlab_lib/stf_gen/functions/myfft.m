
function [f,Xk] = myfft(dt,y,f_show_star,f_show_end,flag_plot_spectrum)

%% input above 

%%%%%%%%%% fft 
fs = 1/dt;
Nt = length(y);
Nt_fft = 2^nextpow2(Nt);

k = 0:Nt_fft-1;
Xk = fft(y,Nt_fft);

f = (k/Nt_fft)*fs;
df = fs/Nt_fft;

% plot(f,abs(Xk))

fn_show_star = round(f_show_star/df);
fn_show_end = round(f_show_end/df);

% plot(f(1,fn_show_star:fn_show_end),abs(Xk(1,fn_show_star:fn_show_end)),'r');
plot_constants;
if flag_plot_spectrum==1
plot_signal_freq;
end


