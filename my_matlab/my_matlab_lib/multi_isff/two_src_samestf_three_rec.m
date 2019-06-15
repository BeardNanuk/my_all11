clear; clc;

rng('default');

%%%% initialization 
rng(1);
%% unknown
sft1o= rand(1) + i*(rand(1))
%% known

Go=rand(3,2)+i*rand(3,2)
stfo = transpose([sft1o,sft1o])
ro = Go * stfo

%%%%% inverse 
%% simulation 
sft1s= rand(1) + i*(rand(1))
%% assume the same Green's function is used
Gs=Go
stfs = transpose([sft1s,sft1s])
rs = Gs * stfs

%% results generation 
stfo
istfo = pinv(transpose(Gs) * Gs) * (transpose(Gs) * ro) 
istfo2 = inv(transpose(Gs) * Gs) * (transpose(Gs) * ro) 
