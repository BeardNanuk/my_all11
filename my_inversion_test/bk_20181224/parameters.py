WORKFLOW='inversion'    # inversion, migration,test_forward
SOLVER='specfem2d_new'      # specfem2d, specfem3d
SYSTEM='multicore'   # serial, pbs, slurm
OPTIMIZE='LBFGS'         # base, newton
PREPROCESS='base'       # base
POSTPROCESS='base'      # base
#SCHEME='NLCG'
#MPIEXEC='srun --wait=0 --ntasks=1 --nodes=1 '  

MISFIT='Waveform' 
MATERIALS='Acoustic'
DENSITY='Constant'
ATTENUATION='no'	

# WORKFLOW
BEGIN=1                # first iteration
END= 200
NREC=180
NSRC=4               # number of sources
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


NT=1300         # number of time steps
DT=0.00000004         # time step
F0=300000

# SYSTEM
NTASK=4             # must satisfy 1 <= NTASK <= NSRC
NPROC=1                # processors per task
NTASKMAX=4	
#NGPU=4
#WALLTIME= 120 # walltime
