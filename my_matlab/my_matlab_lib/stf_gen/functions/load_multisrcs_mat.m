function [rs_multi_point_srcs,Gs] = load_multisrcs_mat(num_rec,num_src,...
    opath,file_wok,arrayname,STFALL,sff,freq_num)
       
rs_multi_point_srcs = zeros(num_rec,num_src);       
       
for k = 1:num_src
    %% add '/' 
    file_wok = strcat('/',file_wok);  
    if num_src==1
    file_wok_2ndpart ='.mat';   
    else
    % the second part
    file_wok_2ndpart = sprintf("%d.mat",k);
    % full mat filename
    end
    rfs_file = strcat(file_wok,file_wok_2ndpart);
    % full path to the mat file
    rfs_filefull = strcat(opath,rfs_file);  
    load(rfs_filefull, arrayname);
    % extract the array from 'arrayname'
    rts= eval([strcat(arrayname,"(:,1:num_rec)")]);
    rts=transpose(rts);
    for nn=1:num_rec
       [f,temp] = myfft(STFALL.dt,rts(nn,:),STFALL.f_show_star,...
           STFALL.f_show_end,STFALL.flag_plot_spectrum);
       rs_multi_point_srcs(nn,k) = temp(:,freq_num);
    end
    %% for the different stfs    
    if isempty(sff)
    else 
        if length(sff)~=1
            Gs(:,k) =  rs_multi_point_srcs(:,k)./sff(k);
        end
    end
    
end

%% for the same stf
if isempty(sff)
else
    if length(sff)==1
        Gs = rs_multi_point_srcs./sff;
    end
end