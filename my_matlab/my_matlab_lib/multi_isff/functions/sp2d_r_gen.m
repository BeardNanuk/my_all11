function [ro] = sp2d_obs_gen(fc,STFALL,rfo)

freq_num = fc/STFALL.df + 1;
% Go=fake_Go_gen(n,m);
ro = rfo(:,freq_num);

% the frequency number to istf (+1 due to the f starting from 0 Hz)
% freq_num = fc/STFALL.df + 1
% sffo = STFALL.sffmat(:,freq_num)
