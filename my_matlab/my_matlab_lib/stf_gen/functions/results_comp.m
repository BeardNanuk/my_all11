%%%% 
clc;

sprintf('synthetic data:')


rs_multi_point_srcs

Gsdotsffs_load_col1= Gs* transpose([sffs_load_col(1), 0 ,0])
Gsdotsffs_load_col2= Gs* transpose([0, sffs_load_col(2) ,0])
Gsdotsffs_load_col3= Gs* transpose([0, 0 ,sffs_load_col(3)])


sprintf('observed data:')

rfo_col
Gsdotsffrickermat_col = Gs*sffrickermat_col;
%%% Green's functions using individual rickers and self-gererated 
Godotsffrickermat_col = Go*sffrickermat_col;
Gsdotsffsr_load_col = Gs*sffo_load_col;
% Gsdotsffsr_load_col = Gs*sffo_load_col;
%%% Green's functions using individual rickers and the plot_stf from sp2d
Godotsffsr_load_col = Go*sffo_load_col;
norm(rfo_col - Gsdotsffrickermat_col)
norm(rfo_col - Godotsffrickermat_col)
norm(rfo_col - Gsdotsffrickermat_col)
norm(rfo_col - Godotsffsr_load_col)

sprintf('observed same ricker data:')
rsr_multi_point_srcs
Gsrdotsffsr_load_col1 = Gsr* transpose([sffsr_load_col(1), 0 ,0])
%Gsrdotsffs_load_col2 = Gsr* transpose([0, sffsr_load_col(2) ,0])
%Gsrdotsffs_load_col3 = Gsr* transpose([0, 0 ,sffsr_load_col(3)])

Gsrdotsffrickermat_col = Gsr* transpose([sffrickermat_col(1), 0 ,0])

%%% Gs is not that good, but OK, Go (diff rickers) is the best, 
%%% Gsr (the ricker) is similar to Gs
norm(Gs - Go)
norm(Gsr - Go)
norm(Gsr - Gs)
