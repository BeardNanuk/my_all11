clear; clc;

rng('default');

%%%% initialization 
rng(1);
%% unknown
sft1o= rand(1) + i*(rand(1))
%% known
Gs1r1o = rand(1) + i*(rand(1))

r1o= sft1o * Gs1r1o %rand(1) + i*(rand(1))

%%%%% inverse 
%% simulation 
sft1s= rand(1) + i*(rand(1))
%% assume the same Green's function is used
Gs1r1s = Gs1r1o
%Gs1r1s = rand(1) + i*(rand(1))
r1s= sft1s * Gs1r1s % rand(1) + i*(rand(1))

istfo= r1o * sft1s / r1s

%% results generation 
%printf('hey')

%fprintf('stf1o : %.08f \n', sft1o);
fprintf('stf1o : %.08f + %.08fj \n', real(sft1o),imag(sft1o));
fprintf('istfo : %.08f + %.08fj \n', real(istfo),imag(istfo));
