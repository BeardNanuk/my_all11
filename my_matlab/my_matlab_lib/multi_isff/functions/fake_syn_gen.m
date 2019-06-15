function [Go,ro] = fake_syn_gen(n,m,sffo)


Go=fake_Go_gen(n,m);
ro = Go * sffo;

% the frequency number to istf (+1 due to the f starting from 0 Hz)
% freq_num = fc/STFALL.df + 1
% sffo = STFALL.sffmat(:,freq_num)
