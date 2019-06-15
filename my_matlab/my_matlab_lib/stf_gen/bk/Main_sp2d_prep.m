clear;clc

libpath = '/home/jiazeh/Desktop/alljh/pfiles/my_matlab_lib/stf_gen/functions';
addpath(libpath)

opath = '/home/jiazeh/Desktop/alljh/pfiles/my_matlab_lib/stf_gen/multi_sp2d_src_3rickers';
addpath(opath)

par_para;

rng(1);
%% select observed received data 

load('/home/jiazeh/Desktop/alljh/pfiles/my_matlab_lib/stf_gen/multi_sp2d_src_3rickers/Up_file_single_3src_dr_rickers_all__f0300000.mat', 'rtoall')
rto = transpose(rtoall(:,1:num_rec));
for k = 1:num_rec 
[f,temp] = myfft(dt,rto(k,:),f_show_star,f_show_end,flag_plot_spectrum);
rfo(k,:)= transpose(temp);
end
STFALL.rfo = rfo;
 
%% generate the stfo (Rickers with amplitue and delay adjustments)
for k = 1:num_src 
delay_steps_ricker = k * 50
amp_att = amp_att_matrix(k)
% amp_att = 1./exp(k);
[t,stfricker] = ricker(delay_steps_removal,delay_steps_ricker,...
    amp_att,fc, total_time, dt,flag_plot_signal);
% plot(t,w_less_delay,'-r')
[f,sffricker] = myfft(dt,stfricker,f_show_star,f_show_end,flag_plot_spectrum);

stfrickermat(k,:) = stfricker;
sffrickermat(k,:) = sffricker;
end

% % % data_saving;
%% generate the stfs (the same tonebursts for all the signals) - not useful
[t,stftoneburst] = toneburst(delay_steps,fc, total_time, dt,peaks,flag_plot_signal);
% plot(t,w_less_delay,'-r')
[f,sfftoneburst] = myfft(dt,stftoneburst,f_show_star,f_show_end,flag_plot_spectrum);
% [f,Xk] = myfft(dt,w_less_delay,f_show_star,f_show_end);
for k = 1:num_src 
% [f,temp] = myfft(dt,rto(k,:),f_show_star,f_show_end,flag_plot_spectrum);
stfs(k,:) = stftoneburst;
sffs(k,:)= sfftoneburst;
end
STFALL.stfs = stfs;
STFALL.sffs = sffs;

%% per frequency
freq_num = fc/STFALL.df + 1;
sffrickermat_col = sffrickermat(:,freq_num);
sffs_col = sffs(:,freq_num);
rfo_col = rfo(:,freq_num);
%%  select synthetic received data 


rfs_file_wok = "Up_file_single_3_5pks_for_stfs_";
arrayname = 'rtoall';

[rs_multi_point_srcs,Gs] = load_multisrcs_mat(num_rec,num_src,opath,...
    rfs_file_wok,arrayname,STFALL,sfftoneburst(1,freq_num),freq_num);

% for k = 1:num_src
%     rfs_file = sprintf('/Up_file_single_3_5pks_for_stfs_%d.mat',k);
%     rfs_filefull = strcat(opath,rfs_file);    
%     load(rfs_filefull, 'rtoall');
%     rts = transpose(rtoall(:,1:num_rec));
%     for nn=1:num_rec
%        [f,temp] = myfft(dt,rts(nn,:),f_show_star,f_show_end,flag_plot_spectrum);
%        rs_multi_point_srcs(nn,k) = temp(:,freq_num);
%     end
% end


STFALL.Gs = Gs;


%% load stf syn from sp2d 
 
for k = 1:num_src
    stfs_sp2d_file = sprintf('/stf_3src_5pks_%d__f0300000',k);
    stfs_sp2d_filefull = strcat(opath,stfs_sp2d_file);    
    stfs_load_wt= importdata(stfs_sp2d_filefull);
    
    stfs_load(k,:) = transpose(stfs_load_wt(:,2));
    [f,temp] = myfft(dt,stfs_load(k,:),f_show_star,f_show_end,flag_plot_spectrum);
    sffs_load(k,:) = temp;
end

sffs_load_col = sffs_load(:,freq_num);
STFALL.sffs_load = sffs_load;
%% load stf obs rickers from sp2d 
 
for k = 1:num_src
    stfo_sp2d_file = sprintf('/stf_3src_ricker_%d__f0300000',k);
    stfo_sp2d_filefull = strcat(opath,stfo_sp2d_file);    
    stfo_load_wt= importdata(stfo_sp2d_filefull);
    
    stfo_load(k,:) = transpose(stfo_load_wt(:,2));
    [f,temp] = myfft(dt,stfo_load(k,:),f_show_star,f_show_end,flag_plot_spectrum);
    sffo_load(k,:) = temp;
end

sffo_load_col = sffo_load(:,freq_num);

STFALL.sffo_load = sffo_load;

%% load stf obs same ricker from sp2d 
 
for k = 1:num_src
    stfsr_sp2d_file = sprintf('/stf_3src_samericker_%d__f0300000',k);
    stfsr_sp2d_filefull = strcat(opath,stfsr_sp2d_file);    
    stfsr_load_wt= importdata(stfsr_sp2d_filefull);
    
    stfsr_load(k,:) = transpose(stfsr_load_wt(:,2));
    [f,temp] = myfft(dt,stfsr_load(k,:),f_show_star,f_show_end,flag_plot_spectrum);
    sffsr_load(k,:) = temp;
end

sffsr_load_col = sffsr_load(:,freq_num);

STFALL.sffsr_load_col = sffsr_load_col;


%%  select observed received data 

ro_multi_point_srcs = zeros(num_rec,num_src);
for k = 1:num_src
    rfo_file = sprintf('/Up_file_single_3_ricker_for_stfo_%d.mat',k);
    rfo_filefull = strcat(opath,rfo_file);    
    load(rfo_filefull, 'rtoall');
    rto = transpose(rtoall(:,1:num_rec));
    for nn=1:num_rec
       [f,temp] = myfft(dt,rto(nn,:),f_show_star,f_show_end,flag_plot_spectrum);
       ro_multi_point_srcs(nn,k) = temp(:,freq_num);
    end
    Go(:,k) =  ro_multi_point_srcs(:,k)./sffo_load_col(k);
end

% Gs = ro_multi_point_srcs./sfftoneburst(1,freq_num)
STFALL.Go = Go;

%%  select observed same-ricker received data 

rsr_multi_point_srcs = zeros(num_rec,num_src);
for k = 1:num_src
    rfsr_file = sprintf('/Up_file_single_3_samericker_for_stfo_%d.mat',k);
    rfsr_filefull = strcat(opath,rfsr_file);    
    load(rfsr_filefull, 'rtoall');
    rtsr = transpose(rtoall(:,1:num_rec));
    for nn=1:num_rec
       [f,temp] = myfft(dt,rtsr(nn,:),f_show_star,f_show_end,flag_plot_spectrum);
       rsr_multi_point_srcs(nn,k) = temp(:,freq_num);
    end
    Gsr(:,k) =  rsr_multi_point_srcs(:,k)./sffsr_load_col(k);
end

% Gs = ro_multi_point_srcs./sfftoneburst(1,freq_num)
STFALL.Gsr = Gsr;

results_comp;

data_saving;