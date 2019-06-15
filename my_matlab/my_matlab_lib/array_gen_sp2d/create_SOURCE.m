

function [s_num] = create_SOURCE(src)

%% generate the arrays necessary to create the values in SOURCE file for specfem2d 
for i_num = 1:length(src.matrix_s_num)

s_num = src.matrix_s_num(i_num);    

source_filename = sprintf('SOURCE_%06d',s_num-1);
parafullpath=strcat(src.folder_for_para,source_filename)
fileID = fopen(parafullpath,'w');

%source_center_x =  0.00001;

% % % 
% % % SIN=sin(SrcAngles(s_num)/180*pi);
% % % COS=cos(SrcAngles(s_num)/180*pi);


% SOURCE_file0.write("FORCE  0\n")
% SOURCE_file0.write("time shift:     0.0000")
% SOURCE_file0.write("f0 = %f\n" % f0)
% SOURCE_file0.write("latorUTM: = 0.3\n")
% SOURCE_file0.write("longorUTM: = 0.2\n")
% SOURCE_file0.write("depth: = 0.0\n")
% SOURCE_file0.write("factor force source:             1.d0\n")
% SOURCE_file0.write("component dir vect source E:     0.d0\n")
% SOURCE_file0.write("component dir vect source N:     0.d0\n")
% SOURCE_file0.write("component dir vect source Z_UP:  0.d0\n")




for iact_each = 1:src.transducer_number

    
switch src.flag_source_shape   
    case 2
Bottom_x(iact_each,1)=src.source_center_x;
Bottom_y(iact_each,1)=src.source_center_y - 0.5*src.transducer_length ...
    + src.delta_length*iact_each;    

tempx=Bottom_x(iact_each,1);
tempy=Bottom_y(iact_each,1);
    case 1
tempx=src.source_center_x;
tempy=src.source_center_y; 

    case 21
        i = i_num;
        tempx= src.x_center + src.r*cos(src.delta_degree*(i-1)); 
        tempy= src.y_center + src.r*sin(src.delta_degree*(i-1));
        
    case 31
        Bottom_x(iact_each,1)=src.source_center_x - 0.5*src.transducer_length ...
        + src.delta_length*(iact_each-1); 
        Bottom_y(iact_each,1)=src.source_center_y - 0.5*src.transducer_length; 
        tempx=Bottom_x(iact_each,1);
        tempy=Bottom_y(iact_each,1);
    case 32
        Bottom_x(iact_each,1)=src.source_center_x + 0.5*src.transducer_length; 
        Bottom_y(iact_each,1)=src.source_center_y - 0.5*src.transducer_length ...
        + src.delta_length*(iact_each-1); 
        tempx=Bottom_x(iact_each,1);
        tempy=Bottom_y(iact_each,1);
    case 33
        Bottom_x(iact_each,1)=src.source_center_x + 0.5*src.transducer_length ...
        - src.delta_length*(iact_each-1); 
        Bottom_y(iact_each,1)=src.source_center_y + 0.5*src.transducer_length; 
        tempx=Bottom_x(iact_each,1);
        tempy=Bottom_y(iact_each,1);
    case 34
        Bottom_x(iact_each,1)=src.source_center_x - 0.5*src.transducer_length; 
        Bottom_y(iact_each,1)=src.source_center_y + 0.5*src.transducer_length ...
        - src.delta_length*(iact_each-1); 
        tempx=Bottom_x(iact_each,1);
        tempy=Bottom_y(iact_each,1);
        
end

fprintf(fileID,'source_surf = .false. \n');
% source_point_x=transducer_length/transducer_number*iact_each;
xs_str = sprintf('xs = %6.5f \n', tempx);
fprintf(fileID,xs_str);
zs_str = sprintf('zs = %6.5f \n',tempy);
fprintf(fileID,zs_str);
fprintf(fileID,'source_type = %d \n', src.source_type);
fprintf(fileID,'time_function_type = %d \n',src.time_function_type);
if src.flag_src_diff_stfs ~= 1
name_of_source_file_str = sprintf('name_of_source_file          =  %s \n',src.name_of_source_file);
else
name_of_source_file_str = sprintf('name_of_source_file          =  %s%04d \n',src.name_of_source_folder,iact_each);
end
fprintf(fileID,name_of_source_file_str);
fprintf(fileID,'burst_band_width = 200.415 \n');
fprintf(fileID,'f0 = %6.3f \n',src.f0);
fprintf(fileID,'tshift = 0 \n');
fprintf(fileID,'anglesource = 0.00 \n');
fprintf(fileID,'Mxx = 1.000000 \n');
fprintf(fileID,'Mzz = 1.000000 \n');
fprintf(fileID,'Mxz = 0.000000 \n');
fprintf(fileID,'factor = 1000.000 \n');

end

% fprintf(fileID,formatSpec,[sen_col',squeeze(RecPos(s_num,:,:)),zeros(m,1),zeros(m,1)]');


fclose(fileID);
end
