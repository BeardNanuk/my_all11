clear; clc;

tic;

rng('default');

% number of source
m = 3; 
% number of receivers
n = ceil(m*1.2); 

%%%% initialization 
rng(1);
%% unknown
one_stf = rand(1)+ i* rand(1);
all_stf = ones(m,1) *  one_stf;

AS = rand(m,1) + i * rand(m,1);
stfo = all_stf .* AS ;
%% known
Go=rand(n,m)+i*rand(n,m);
ro = Go * stfo;

%%%%% inverse 
%% simulation 
stfs = rand(m,1) + i * rand(m,1);
%% assume the same Green's function is used
Gs=Go;
rs = Gs * stfs;

%% results generation (if one_stf is known)
% % % % stfo;
% % % % istfo = pinv(transpose(Gs) * Gs) * (transpose(Gs) * ro);
% % % % istfo2 = inv(transpose(Gs) * Gs) * (transpose(Gs) * ro);
% % % % 
% % % % fprintf('istfo - stfo: \n');
% % % % istfo - stfo;
% % % % fprintf('norm(istfo - stfo): \n');
% % % % norm(istfo - stfo);
% % % % 
% % % % fprintf('istfo2 - stfo: \n');
% % % % istfo2 - stfo;
% % % % fprintf('norm(istfo2 - stfo): \n');
% % % % norm(istfo2 - stfo);
% % % % fprintf('AS - (istfo2./one_stf): \n');
% % % % AS - (istfo2./one_stf);


%% a simple test for the double difference inversion 
rk1= AS./AS(1);

g1o=Go(1,2:3);
g2o=Go(2,2:3);
g3o=Go(3,2:3);

G23p = [g1o - ro(1)/ro(2).*g2o;
        g2o - ro(2)/ro(3).*g3o;
        g3o - ro(3)/ro(1).*g1o];


bp = [-Go(1,1) + ro(1)/ro(2).*Go(2,1);
      -Go(2,1) + ro(2)/ro(3).*Go(3,1);
      -Go(3,1) + ro(3)/ro(1).*Go(1,1)];

rk1;
irk1_noone = inv(transpose(G23p) * G23p) * (transpose(G23p) * bp);

%% matrix expression for the double difference inversion 

%%%% generate the unknown matrix
for k=1%:m
   temp = [AS/AS(k)];
   R(:,k)=temp;
   temp(k)=[];
   Rhat(:,k)=temp;
end

%%%% amplitude and shift change inversion

for k=1%:m

for i=1:n
    temp = Go(i,:);
    temp(k) = [];
    Ghat(i,:) = temp;
    
end

ntotal=0;
for i = 1:n
    for j = 1:n
        if j~=i
        ntotal=ntotal+1;
        bdd(ntotal,:)= - Go(i,k)+ro(i)/ro(j)*Go(j,k);
        Add(ntotal,:) = Ghat(i,:) - ro(i)/ro(j) * Ghat(j,:);
        end
    end
end

irk1_noonev2 = inv(transpose(Add) * Add) * (transpose(Add) * bdd);

iRhat(:,k)=irk1_noonev2;
end % k=1:m

Rhat
iRhat
fprintf('Rhat - iRhat: \n');
iRhat - Rhat

m
n
toc