clear; clc;

tic;

libpath = '/home/jiazeh/Desktop/alljh/pfiles/my_matlab_lib/multi_isff/istf_dd_fake_rickers';
addpath(libpath)

par_para;
% % % %%% parameter loading
% % % load('/home/jiazeh/Desktop/alljh/pfiles/my_matlab_lib/stf_gen/multi_ricker/STFALL.mat', 'STFALL')
% % % 
% % % 
% % % % number of source
% % % m = STFALL.num_src; 
% % % % number of receivers
% % % n = ceil(m*1.2); 
% % % 
% % % %%%% initialization 
% % % rng(1);

% the frequency number to istf (+1 due to the f starting from 0 Hz)
% % freq_num = STFALL.fc/STFALL.df + 1
% % sffo = STFALL.sffmat(:,freq_num)

sffo=sffo_gen(STFALL.fc,STFALL);

%% known
% Go=rand(n,m)+i*rand(n,m);
% Go=fake_Go_gen(n,m);
% ro = Go * sffo;
[Go,ro]=fake_obs_gen(n,m,sffo);
 

%%%%% inverse 
%% simulation 
sffs = rand(m,1) + i * rand(m,1);
% stfs = rand(m,1) + i * rand(m,1);
%% assume the same Green's function is used
Gs=Go;
rs = Gs * sffs;
%% a simple test for the double difference inversion 
% % rk1= sffo./sffo(1);
% % 
% % g1o=Go(1,2:3);
% % g2o=Go(2,2:3);
% % g3o=Go(3,2:3);
% % 
% % G23p = [g1o - ro(1)/ro(2).*g2o;
% %         g2o - ro(2)/ro(3).*g3o;
% %         g3o - ro(3)/ro(1).*g1o];
% % 
% % 
% % bp = [-Go(1,1) + ro(1)/ro(2).*Go(2,1);
% %       -Go(2,1) + ro(2)/ro(3).*Go(3,1);
% %       -Go(3,1) + ro(3)/ro(1).*Go(1,1)];
% % 
% % rk1
% % irk1_noone = inv(transpose(G23p) * G23p) * (transpose(G23p) * bp)


%% matrix expression for the double difference inversion 

for k=1:m
   temp=sff_ratio_per_src(sffo,k);
   Rhat(:,k)=temp;
end

%%%% amplitude and shift change inversion
%% 
clc;
tic;
for k=1:m
fprintf('k: %d\n',k);
Ghat= Ghat_gen(Go,k,n);
[Add,bdd] =Add_bdd_gen(Go,Ghat,ro,k,n);

irk1_noonev2 = inv(transpose(Add) * Add) * (transpose(Add) * bdd);
iRhat(:,k)=irk1_noonev2;
end % k=1:m

Rhat
iRhat
fprintf('Rhat - iRhat: \n');
iRhat - Rhat


error_percent=norm(iRhat - Rhat)/norm(Rhat)


m
n
toc