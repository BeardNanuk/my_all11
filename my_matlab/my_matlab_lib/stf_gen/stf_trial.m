clear;clc

libpath = '/home/jiazeh/Desktop/alljh/pfiles/my_matlab_lib/stf_gen/functions';
addpath(libpath)

libpath = '/home/jiazeh/Desktop/alljh/pfiles/my_matlab_lib/stf_gen/o_ricker';
addpath(libpath)

par_para;

[t,stfricker] = ricker(delay_steps_removal,delay_steps_ricker,amp_att,fc, total_time, dt);
% plot(t,w_less_delay,'-r')
[f,sffricker] = myfft(dt,stfricker,f_show_star,f_show_end);


% [t,stftoneburst] = toneburst(delay_steps,fc, total_time, dt,peaks);
% % plot(t,w_less_delay,'-r')
% [f,sfftoneburst] = myfft(dt,stftoneburst,f_show_star,f_show_end);



% [f,Xk] = myfft(dt,w_less_delay,f_show_star,f_show_end);


%%

    
    