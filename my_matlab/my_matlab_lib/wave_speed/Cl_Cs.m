%%% shear\longitutional wave 

clear
clc

% http://asm.matweb.com/search/SpecificMaterial.asp?bassnum=ma7075t6

E=71.7e9
rho=2810
mu=0.33

G=E/(2*(1+mu))
lamda=E*mu/((1+mu)*(1-2*mu))


Gamma=[0.01,0.05,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,0.95 1]'

 for i=1:13

% Cs(i)=sqrt(E*Gamma(i)/(2*rho*(1+mu)));
% Cl(i)=sqrt((lamda+2*G*Gamma(i))/rho);
E2=E*Gamma(i);
% rho=2700
mu=0.33

G2=E2/(2*(1+mu))
lamda2=E2*mu/((1+mu)*(1-2*mu))



Cs_b(i,1)=sqrt(E2/(2*rho*(1+mu)))/1000;
Cl_b(i,1)=sqrt(E2*(1-mu)/(rho*(1+mu)*(1-2*mu)))/1000;
K(i,1)=lamda2+2*G2/3;

 end
 
 Cl_b(end,1)
 Cs_b(end,1)
 