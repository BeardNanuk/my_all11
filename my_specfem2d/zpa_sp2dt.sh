#!/bin/bash
#SBATCH --nodes=1
#SBATCH -t 0:59:00
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1


#cd $SBATCH_O_WORKDIR 
cd $HOME/sp2dt/

echo `pwd`
module purge
module load intel/16.0/64/16.0.4.258   
module load openmpi/intel-16.0/1.10.2/64
#module load cudatoolkit/9.2

module list

NPROC=`grep ^NPROC DATA/Par_file | cut -d = -f 2 | cut -d \# -f 1 | tr -d ' '`
rm -f qmeshergpu
rm -f vsolvergpu
rm OUTPUT_FILES/*
cp DATA/Uexp.txt OUTPUT_FILES/Uexp.txt
#rm slurm* 
# creates and decomposes mesh
echo
echo "running mesher..."
echo
srun  ./bin/xmeshfem2D >> qmeshergpu

rm -f vsolvergpu
# runs simulation
echo
echo "  running solver..."
echo

srun ./bin/xspecfem2D >> vsolvergpu 

#mpirun -n $NPROC ./bin/xsmooth_sem 0.002 0.002 Qkappa ./DATA/ ./model T
#mv ./model/proc000000_vp_smooth.bin ./model/proc000000_vp.bin 

echo "running solver - done"

#sleep 420 

#. z2ndhalf

