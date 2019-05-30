WORKFLOW='inversion'    # inversion2, migration,test_forward2
SOLVER='specfem2d_new_ze'      # specfem2d, specfem3d
SYSTEM='tiger_sm_gpu'   # serial, pbs, slurm
OPTIMIZE='LBFGS'         # base, newton
PREPROCESS='double_difference'       # base2,double_difference
POSTPROCESS='base'      # base
#SCHEME='NLCG'
MPIEXEC='srun --wait=0 --ntasks=1 --nodes=1 '  

MISFIT='Traveltime'     # TraveltimeInexact  
MATERIALS='Acoustic'
DENSITY='Constant'
ATTENUATION='no'	

# WORKFLOW
BEGIN=1                # first iteration
END= 200
NREC=180
NSRC=120           # number of sources
SAVEGRADIENT=1        # save gradient how often
SAVETRACES=1

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


NT=900         # number of time steps
DT=0.00000004         # time step
F0=300000

# SYSTEM
NTASK=4      # must satisfy 1 <= NTASK <= NSRC
NPROC=1              # processors per task
nodes=1              # number of nodes - added by jh
NNODES_PERTASK=1     # number of nodes needed by each task in slurm_lg
NTASKMAX=4         # set equals to NTASK for slurm_lg
NODESIZE=1           # number of TASKS on each node - but seems to be ok to equal to NPROC
NGPU=1               # for slurm_lg_gpu_ze -  seems to be ok to equal to NPROC, so = 1 
TASKTIME=62
WALLTIME=60  # walltime