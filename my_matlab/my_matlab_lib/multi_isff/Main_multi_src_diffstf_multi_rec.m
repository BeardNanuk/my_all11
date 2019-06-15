clear; clc;

libpath = '/home/jiazeh/Desktop/alljh/pfiles/my_matlab_lib/stf_gen/functions';
addpath(libpath)


libpath = '/home/jiazeh/Desktop/alljh/pfiles/my_matlab_lib/multi_isff/ricker';
addpath(libpath)

libpath = '/home/jiazeh/Desktop/alljh/pfiles/my_matlab_lib/multi_isff/functions';
addpath(libpath)

par_para;

%% unknown
[t,stfricker] = ricker(delay_steps_removal,fc, total_time, dt);
[f,sffricker] = myfft(dt,stfricker,f_show_star,f_show_end);

%%
rng('default');

%%%% initialization 
rng(1);

for freq_num = 0:k
    
Go=fakeGperfreq(n,m)
ro = Go * sffricker;

stfs = rand(m,1) + i * rand(m,1);
Gs=Go;
rs = Gs * stfs;
end

% Gs=fakeGperfreq(n,m)



%%%%%%%%%%%%%%%%%%%%


% stfo = rand(m,1) + i * rand(m,1);
%% known
% Go=rand(n,m)+i*rand(n,m);
% ro = Go * stfo;

%%%%% inverse 
%% simulation 
% % % % % stfs = rand(m,1) + i * rand(m,1);
% % % % % %% assume the same Green's function is used
% % % % % Gs=Go;
% % % % % rs = Gs * stfs;

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