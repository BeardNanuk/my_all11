 function [t,y] = toneburst(delay_steps,fc, total_time, dt,peaks,flag_plot_signal)

%%%% toneburst generation

    B=2*fc/sqrt(3)/peaks
    fmax=fc+B
    fmin=fc-B
    dfpulselen = (peaks/fmax)
    dfl = ceil(dfpulselen/dt)

    
    win = hann(dfl)';
    y_sig(1:dfl) = sin(2*pi*fc*dt*(0:(dfl-1))).*win;
%     df_samp = 1/((N*dt));
%     F_samp = (-1/(2*dt):df_samp:1/(2*dt)-df_samp) ;
%     num_fmax=ceil(fmax/df_samp);
%     num_fmin=floor(fmin/df_samp);

t = dt:dt:(total_time);
y = [zeros(1,delay_steps),y_sig,zeros(1,length(t)-length(y_sig)-delay_steps)];


% t = (-total_time/2):dt:(total_time/2)-dt;
% 
% y= -(1.0-2.0*(pi^2)*(fc^2)*(t.^2)).* exp(-pi^2*(fc^2)*(t.^2));
% 
% w_less_delay = [y(1,delay_steps_removal+1:end),zeros(1,delay_steps_removal)];
% 
% tshift = dt:dt:(total_time);


plot_constants;
if flag_plot_signal==1
plot_signal;
end
