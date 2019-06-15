clear;clc

libpath = '/home/jiazeh/Desktop/alljh/pfiles/my_matlab_lib/stf_gen/functions';
addpath(libpath)

opath = '/home/jiazeh/Desktop/alljh/pfiles/my_matlab_lib/stf_gen/multi_ricker';
addpath(opath)

par_para;

rng(1);

for k = 1:num_src 

delay_steps_ricker = k * 1;
amp_att = rand(1)
% amp_att = 1./exp(k);
    
[t,stfricker] = ricker(delay_steps_removal,delay_steps_ricker,...
    amp_att,fc, total_time, dt,flag_plot_signal);
% plot(t,w_less_delay,'-r')
[f,sffricker] = myfft(dt,stfricker,f_show_star,f_show_end,flag_plot_spectrum);

stfmat(k,:) = stfricker;
sffmat(k,:) = sffricker;

end
data_saving;


% [t,stftoneburst] = toneburst(delay_steps,fc, total_time, dt,peaks);
% % plot(t,w_less_delay,'-r')
% [f,sfftoneburst] = myfft(dt,stftoneburst,f_show_star,f_show_end);
% [f,Xk] = myfft(dt,w_less_delay,f_show_star,f_show_end);
%%

    
    