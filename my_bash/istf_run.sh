#!/bin/bash

spout_folder="/home/jiazeh/Desktop/my_files/py2project/pythonvenv_playground/prusct_wd/obf/input/istf_ddd"
eval rm -fr "$spout_folder"
eval mkdir "$spout_folder"


cd sp2dc
./launch_sp2dct.sh
## need to manully setup the destination folder
./zbksmall.sh
cd ..
wait

cd itt2
sfclean; sfrun 
./zbksmall
cd ..
wait


cd itt3
sfclean; sfrun 
./zbksmall
cd ..
wait
#### python working folders
python /home/jiazeh/Desktop/my_files/py2project/pythonvenv_playground/prusct_wd/zmake_istf_mat.py
wait
#### remove it sp output
rm -r /home/jiazeh/Desktop/my_files/py2project/pythonvenv_playground/prusct_wd/obf/input/istf_ddd/stt[os]/output/
wait
#### backup files to matlab working folders
mat_ifolder="/home/jiazeh/Desktop/alljh/pfiles/my_matlab_lib/stf_gen/multi_toneburst_rand_ad_diff/LinNcF21_3os_5pks_rand_ad_7ss_v19"
eval rm -fr "$mat_ifolder"
eval mkdir "$mat_ifolder"
eval mv "$spout_folder" "$mat_ifolder/spit" 
eval mv /home/jiazeh/Desktop/my_files/py2project/pythonvenv_playground/prusct_wd/obf/output/istf_ddd "$mat_ifolder/mat" 

