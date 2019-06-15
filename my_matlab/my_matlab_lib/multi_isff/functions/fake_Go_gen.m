function [Go] = fake_Go_gen(n,m)

Go=rand(n,m)+i*rand(n,m);
% the frequency number to istf (+1 due to the f starting from 0 Hz)
% freq_num = fc/STFALL.df + 1
% sffo = STFALL.sffmat(:,freq_num)
