#!/bin/bash
#SBARCH --job-name=job_array_%a
#SBATCH --output=output/job_%a.out
#SBATCH --error=output/job_%a.err
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --array=0-1
#SBATCH -t 00:00:20

# Change to current directory
cd /home/uvaaland/scratch/job_array

# Execute script
srun python demo.py input/param_${SLURM_ARRAY_TASK_ID}.txt
