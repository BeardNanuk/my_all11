%%

clear;clc;
% load the library for source_station_file_generation

libpath = '/home/jiazeh/Desktop/alljh/pfiles/my_matlab_lib/array_gen_sp2d';
addpath(libpath)


%folder_for_para="csic_80src/";
%addpath(folder_for_para);



folder_for_para="linear_array_inversion/";
addpath(folder_for_para);
% paraname='par_para';
% parafullpath=strcat(folder_for_para);vi
% addpath(parafullpath);

%%% par_para was called from the folder of 'folder_for_para';

flag_load_para = 2 % 1 for loading, 2 for not
flag_plot = 1 
num_scan_posi = 1 % 23
src_num_spc = 1

switch flag_load_para 
    case 1
        k_num = 0
        for k = 8%1:7:16 %l = 1;
            k_num = k_num+1
        for i = 1:num_scan_posi
            filename = sprintf('obsFan%02d_SRC%02d_para.mat',i,k);
            eval(['load ', filename, ' mystation';]);
            par_para;
            stations_generation;
            source_generation;
            plot_source_stations;
        end
        end
        
        matrix_events = 1:num_scan_posi*src_num_spc;
        source_station_selection;
        
    case 2 
        par_para;
        stations_generation;
        source_generation;
        
end


rmpath(libpath,folder_for_para)
