 function [t,y] = ricker(delay_steps_removal,delay_steps_ricker,amp_att,fc, total_time, dt,flag_plot_signal)

%%%% ricker generation

tnoshift = (-total_time/2):dt:(total_time/2)-dt;

ynodelay= -(1.0-2.0*(pi^2)*(fc^2)*(tnoshift.^2)).* exp(-pi^2*(fc^2)*(tnoshift.^2));

y = [zeros(1,delay_steps_ricker),ynodelay(1,delay_steps_removal+1:end),zeros(1,delay_steps_removal-delay_steps_ricker)];

if amp_att~=1
y = amp_att .* y;
end

t = dt:dt:(total_time);


plot_constants;
if flag_plot_signal==1
plot_signal;
end
