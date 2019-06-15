
%%%%%%%%%%% SOURCE creation %%%%%%%%%%%%%%%%%%%%%

    src.flag_source_shape = flag_source_shape;
    src.matrix_s_num = matrix_s_num;
    src.transducer_number=transducer_number;
    src.source_center_x = source_center_x;
    src.source_center_y = source_center_y;
    src.f0 = f0;
    src.folder_for_para = folder_for_para;
    src.source_type = source_type;
    src.time_function_type = time_function_type;
    src.name_of_source_folder = '/home/jiazeh/csp2d_base/DATA/sources/';
    src.name_of_source_file = '/home/jiazeh/csp2d_base/DATA/sources/stf_ricker_dt40ns_dlst200_f300000';
switch flag_source_shape
    case 2
    %line source
    src.transducer_length=transducer_length;
    src.delta_length = transducer_length/(transducer_number -1);
    src.flag_src_diff_stfs=flag_src_diff_stfs;
    src.name_of_source_folder = '/home/jiazeh/csp2d_base/DATA/sources/line/';
    %% the following line is useful only if  flag_src_diff_stfs~=1
    src.name_of_source_file = '/home/jiazeh/csp2d_base/DATA/sources/stf_5pks_dt48ns_dlst140_f300000';
    case 1
    %src.name_of_source_file = '/scratch/gpfs/jiazeh/inversion_test/specfem_data/sources/stf_ricker_small_delayed2';  
%     src.name_of_source_file = '/scratch/gpfs/jiazeh/specfem2d/DATA/sources/z2istf_trstar089_trend090'; 
    src.name_of_source_file = '/scratch/gpfs/jiazeh/csp2d_base/DATA/sources/z5istf_trstar089_trend090';  
    case 21
    %line source
    %src.transducer_length=transducer_length;
    %src.delta_length = transducer_length/(transducer_number -1);
    %%%src.name_of_source_file = '/home/jiazeh/specfem2d/DATA/stf_ricker_delayed';
    
    src.r = r;
    src.x_center = rec_x_center;
    src.y_center = rec_y_center;
    src.N = length(matrix_s_num);
    src.delta_degree = 2*pi/src.N;
    src.name_of_source_file = '/scratch/gpfs/jiazeh/csp2d_base/DATA/sources/linear_src/ricker_';  
    case {31,32,33,34}
    %line source
    src.transducer_length=transducer_length;
    src.delta_length = transducer_length/(transducer_number);
    src.name_of_source_file = '/home/jiazeh/specfem2d/DATA/stf_ricker_delayed';
end
SRCtemp = create_SOURCE(src);
%%%%%%%%%%% SOURCE creation %%%%%%%%%%%%%%%%%%%%%

