WORKFLOW='inversion_sm'    # inversion_sm, inversion_lg, migration,test_forward2
SOLVER='specfem2d_new_ze'      # specfem2d, specfem3d
SYSTEM='tiger_sm_gpu'   # serial, pbs, slurm,tiger_sm_gpu,tiger_lg_gpu_ze
OPTIMIZE='LBFGS'         # base, newton
PREPROCESS='base'       # base,double_difference
POSTPROCESS='base'      # base, base_lg
#SCHEME='NLCG'
MPIEXEC='srun --wait=0 --ntasks=1 --nodes=1 '  

MISFIT='Waveform'     # TraveltimeInexact  
MATERIALS='Acoustic'
DENSITY='Constant'
ATTENUATION='no'	

# WORKFLOW
BEGIN=1                # first iteration
END=30
NREC=180
NSRC=120           # number of sources
SAVEGRADIENT=1        # save gradient how often
SAVETRACES=1
SAVELAST=1

# PREPROCESSING
FORMAT='su'   # data file format
CHANNELS='p'            # data channels
NORMALIZE=0   # normalize
BANDPASS=0              # bandpass
#MUTE=0                  # mute direct arrival
#FREQLO=0.               # low frequency corner
#FREQHI=0.               # high frequency corner
#FILTER='Bandpass'
#FREQMIN=10000
#FREQMAX=2500000


MUTECONST=0.            # mute constant
MUTESLOPE=0.            # mute slope
WITH_MPI= True

# POSTPROCESSING
SMOOTH=0
SCALE=6.0e6             # scaling factor
RATIO=0.92
START=1

# OPTIMIZATION
PRECOND=None            # preconditioner type
STEPMAX=15              # maximum trial steps
STEPTHRESH=0.1          # step length safeguard
STEPINIT=0.05


NT=800         # number of time steps
DT=0.00000004         # time step
F0=300000

# SYSTEM
NTASK=8            # must satisfy 1 <= NTASK <= NSRC
NPROC=1              # processors per task
nodes=1              # number of nodes - added by jh
NNODES_PERTASK=1     # number of nodes needed by each task in slurm_lg
NTASKMAX=8         # set equals to NTASK for slurm_lg
NODESIZE=1           # number of TASKS on each node - but seems to be ok to equal to NPROC
NGPU=4               # for slurm_lg_gpu_ze -  seems to be ok to equal to NPROC, so = 1 
TASKTIME=62
WALLTIME=58 # walltime
