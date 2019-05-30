#!/bin/bash

# copy the important but limited number of i/o files of specfem2d to /home/jiazeh/temp


#created on Mon Oct  8 14:06:55 UTC 2018
#created by Jiazeh 

f0=$(sed -n 1,15p DATA/SOURCE | grep 'f0' | cut -d\= -f2 | tr -d '[:space:]')

intf0=${f0%.*}
echo 'intf0 ='$intf0

# foldername 
foldername="sp_halfcircles_r034_3pks_2e8__f0$intf0"
echo 'foldername='$foldername

#!!!!!!!!!!!! be really careful about the destination 
final_dir="/scratch/gpfs/jiazeh/Desktop/d/fwi_csic_fullsize"

final_foldername=$(printf "${final_dir}/${foldername}")
#final_foldername=$(printf "${final_dir}/f0_${intf0}")
echo 'final_foldername='$final_foldername

final_stf_filename=$(printf "${final_dir}/stf_${foldername}")
#final_stf_filename=$(printf "${final_dir}/stf_f0_${intf0}")

echo 'final_stf_filename='$final_stf_filename


final_seis_filename=$(printf "${final_dir}/seis_${foldername}.png")
#eval cp "$HOME/specfem2d/OUTPUT_FILES/plot_source_time_function.txt" $final_dir

rm -rf bk_small
mkdir bk_small


#final_dir="bk_small"
dfolder='bk_small'

cp -rf *.png $dfolder
eval cp qmeshergpu vsolvergpu $dfolder 
temp_full="$dfolder/DATA"
mkdir -p $temp_full && eval cp -r DATA/Par_file DATA/SOURCE DATA/STATIONS $temp_full
temp_full="$dfolder/OUTPUT_FILES"
mkdir -p $temp_full && eval cp -r OUTPUT_FILES/* $temp_full
#eval cp -r OUTPUT_FILES/plot_source_time_function.txt $temp_full
temp_full="$dfolder/obf/output"
mkdir -p $temp_full && eval cp -r obf/output/* $temp_full
temp_full="$dfolder/src/specfem2D"
mkdir -p $temp_full && eval cp -r src/specfem2D/compute_add_sources_acoustic.f90 $temp_full

#vi $final_dir/zreadme.txt && 
echo $PWD > $dfolder/zreadme.txt
today=`date +%Y-%m-%d.%H:%M:%S` # or whatever pattern you desire
echo $today >> $dfolder/zreadme.txt
eval mv $dfolder $final_foldername


## an option to generate the renamed stf for src inversion 
eval cp "$final_foldername/OUTPUT_FILES/plot_source_time_function.txt" $final_stf_filename
#eval cp "$final_foldername/obf/output/p_src01_delay.png" $final_seis_filename


#eval mv "$final_foldername/obf/output/p_src01_delay.png" "$final_stf_filename/$foldername"


#cp2temp 'DATA/Par_file'
#cp2temp 'DATA/Par_file'

