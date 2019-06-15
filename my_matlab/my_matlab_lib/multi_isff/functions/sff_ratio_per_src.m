function [temp] = sff_ratio_per_src(sffo,k)
%%% generate the kth source corresponding ratios (true)

   temp = [sffo/sffo(k)];
   R(:,k)=temp;
   temp(k)=[];

   