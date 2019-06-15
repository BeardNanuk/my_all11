clear; clc;

rng('default');

% number of source
m = 20; 
% number of receivers
n = 30; 

%%%% initialization 
rng(1);
%% unknown
stfo = rand(m,1) + i * rand(m,1);
%% known
Go=rand(n,m)+i*rand(n,m);
ro = Go * stfo;

%%%%% inverse 
%% simulation 
stfs = rand(m,1) + i * rand(m,1);
%% assume the same Green's function is used
Gs=Go;
rs = Gs * stfs;

%% results generation 
stfo;
istfo = pinv(transpose(Gs) * Gs) * (transpose(Gs) * ro); 
istfo2 = inv(transpose(Gs) * Gs) * (transpose(Gs) * ro); 

fprintf('istfo - stfo: \n');
istfo - stfo
fprintf('norm(istfo - stfo): \n');
norm(istfo - stfo)

fprintf('istfo2 - stfo: \n');
istfo2 - stfo
fprintf('norm(istfo2 - stfo): \n');
norm(istfo2 - stfo)
