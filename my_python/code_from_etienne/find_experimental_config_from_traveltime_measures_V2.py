from scipy.optimize import least_squares
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

#Initial parameters to set (number of sources, receivers and length of the box)
Ns=7
Nr=20
L=0.0256000
NDIM=2


print 'Number of unknowns : ',  NDIM*(Ns+Nr)+1+Nr+Ns
print 'Number of equations : ',  Ns*Nr
print ''

# Generates randomly the configuration set-up, ie values of positions of source/receivers, the wavespeed and the delays
Xs = L * np.random.rand(Ns,NDIM)
Xr = L * np.random.rand(Nr,NDIM)
c  = 1500 + 20 * ( np.random.rand(1) - 0.5 )



#for i in  range(Ns):
#  Xs[i,0] = L/2 
#  Xs[i,1] =  (L) * i / Ns

#for i in  range(Nr):
#  Xr[i,0] = L - 0.001
#  Xr[i,1] = L * i / Nr





def dist(X1,X2):
   x = (X1[0]-X2[0])**2 + (X1[1]-X2[1])**2
   if NDIM==3 :
     x +=   (X1[2]-X2[2])**2
   return x  

def travel_time(X1,X2,c,NDIM):
   return np.sqrt(dist(X1,X2)) / c

#Generate vector of delays
delay_real = 0.001*(np.random.rand(Ns+Nr)-0.5)
# Generates vector of traveltime observations
obs_tt = np.zeros(Nr*Ns)
obs_tt_without_delay = np.zeros(Nr*Ns)
for i in range(0,Nr):
   for j in range(0,Ns):
      obs_tt[Ns*i+j] = travel_time(Xr[i,:],Xs[j,:],c,NDIM) + delay_real[j] + delay_real[Ns+i]
      obs_tt_without_delay[Ns*i+j] = travel_time(Xr[i,:],Xs[j,:],c,NDIM)

def cost_function(X,T,Ns,Nr,NDIM,c):
#X[0:3*Ns-1]                                           = Xs values
#X[3*Ns:3*Ns + 3*Nr-1]                                 = Xr values
#X[3*Ns + 3*Nr:3*Ns + 3*Nr + Ns + Nr ]        = delay s/r
   vec = np.zeros(Nr*Ns)
   for i in range(0,Nr):
      for j in range(0,Ns):
         vec[Ns*i+j] = travel_time(X[NDIM*j:NDIM*j+NDIM],X[NDIM*Ns+NDIM*i:NDIM*Ns+NDIM*i+NDIM],c,NDIM) + X[NDIM*Ns+NDIM*Nr+j] + X[NDIM*Ns+NDIM*Nr+Ns+i]
   return T - vec


# Generates a random initial guess
#X_init = L * np.random.rand(3*Ns+3*Nr)
X_init = np.zeros(NDIM*Ns+NDIM*Nr+1+Ns+Nr)
X_real = np.zeros(NDIM*Ns+NDIM*Nr)

xs= np.zeros(NDIM*Ns)
for i in range(Ns):
   xs[NDIM*i]=Xs[i,0]
   xs[NDIM*i+1]=Xs[i,1]
   if NDIM==3 :
     xs[NDIM*i+2]=Xs[i,2]
      
xr= np.zeros(NDIM*Nr)
for i in range(Nr):
   xr[NDIM*i]=Xr[i,0]
   xr[NDIM*i+1]=Xr[i,1]
   if NDIM==3 :
     xr[NDIM*i+2]=Xr[i,2]


X_err_source = (L/5)*( np.random.rand(NDIM*Ns) - 0.5 )
X_err_station = (L/5)*( np.random.rand(NDIM*Nr) - 0.5 )


X_init[0:NDIM*Ns] = xs + X_err_source
X_init[NDIM*Ns:NDIM*Ns+NDIM*Nr] = xr + X_err_station
X_init[NDIM*Ns+NDIM*Nr :3*Ns+3*Nr+Ns+Nr] = 0

X_real[0:NDIM*Ns] = xs 
X_real[NDIM*Ns:NDIM*Ns+NDIM*Nr] = xr 

# Solve the non-linear least squares problem
res_lsq = least_squares(cost_function, X_init,method = 'lm', ftol=1e-14,xtol=1e-15, args=(obs_tt,Ns,Nr,NDIM,c))

print 'final cost function :',res_lsq.cost

# Recalibrate the solution
dx =  res_lsq.x[0] - xs[0]
dy =  res_lsq.x[1] - xs[1]
if NDIM==3 :
  dz =  res_lsq.x[2] - xs[2]
for i in range(Ns+Nr):
 res_lsq.x[NDIM*i]   -= dx
 res_lsq.x[NDIM*i+1] -= dy
 if NDIM==3 :
  res_lsq.x[NDIM*i+2] -= dz
dt_source = delay_real[0] - res_lsq.x[NDIM*Ns+NDIM*Nr]
res_lsq.x[NDIM*Ns+NDIM*Nr:NDIM*Ns+NDIM*Nr+Ns] += dt_source
dt_receivers = delay_real[Ns] - res_lsq.x[NDIM*Ns+NDIM*Nr+Ns]
res_lsq.x[NDIM*Ns+NDIM*Nr+Ns:NDIM*Ns+NDIM*Nr+Ns+Nr] += dt_receivers

#Plot results
a=0
b=0
t1_l1=0
t1_l2=0
t2_l1=0
t2_l2=0
inverted_tt = np.zeros(Nr*Ns)
#Get cost function for traveltimes
for i in range(Nr):
   for j in range(Ns):
      t1_l1 += abs(obs_tt_without_delay[Ns*i+j] - travel_time(X_init[NDIM*j:NDIM*j+NDIM],X_init[NDIM*Ns+NDIM*i:NDIM*Ns+NDIM*i+NDIM],c,NDIM))
      t1_l2 += abs(obs_tt_without_delay[Ns*i+j] - travel_time(X_init[NDIM*j:NDIM*j+NDIM],X_init[NDIM*Ns+NDIM*i:NDIM*Ns+NDIM*i+NDIM],c,NDIM))**2
      inverted_tt[Ns*i+j] = travel_time(res_lsq.x[NDIM*j:NDIM*j+NDIM],res_lsq.x[NDIM*Ns+NDIM*i:NDIM*Ns+NDIM*i+NDIM],c,NDIM)
      t2_l1 += abs(obs_tt_without_delay[Ns*i+j] - inverted_tt[Ns*i+j] )
      t2_l2 += abs(obs_tt_without_delay[Ns*i+j] - inverted_tt[Ns*i+j] )**2

#Get cost function for delays
delay_invert_l1 = abs(res_lsq.x[NDIM*Ns+NDIM*Nr:NDIM*Ns+NDIM*Nr+Ns+Nr]-delay_real[:]).sum()
delay_invert_l2 = ((res_lsq.x[NDIM*Ns+NDIM*Nr:NDIM*Ns+NDIM*Nr+Ns+Nr]-delay_real[:])**2).sum()
delay_init_l1 = abs(delay_real[:]).sum()
delay_init_l2 = ((delay_real[:])**2).sum()

for i in range(NDIM*(Ns+Nr)):
   a +=abs(X_real[i]-X_init[i])
   b +=abs(X_real[i]-res_lsq.x[i])

print ''
print 'initial gap in data space (traveltimes) L1 L2 :', t1_l1, t1_l2
print 'final gap in data space (traveltimes) L1 L2:', t2_l1, t2_l2
print ''
print 'initial gap in data space (delays) L1 L2 :', delay_init_l1,delay_init_l2
print 'final gap in data space (delays) L1 L2:', delay_invert_l1,delay_invert_l2
print ''
print 'initial gap in model space:', a
print 'final gap in model space:', b
print ''
print 'velocity: ', c
print ''

plt.plot(obs_tt_without_delay-inverted_tt)
plt.title('Differences between real and inverted traveltime for each pair of source-receiver [s]', fontsize=5)
plt.legend()

if NDIM==3 :
  fig = plt.figure()
  ax = fig.add_subplot(111, projection='3d')
  ax.scatter(X_real[0:3*(Ns+Nr):3], X_real[1:3*(Ns+Nr):3], X_real[2:3*(Ns+Nr):3], c='r', marker='^')

  ax.set_xlabel('X Label')
  ax.set_ylabel('Y Label')
  ax.set_zlabel('Z Label')

  fig3 = plt.figure()
  ax = fig3.add_subplot(111, projection='3d')
  ax.scatter(X_init[0:3*(Ns+Nr):3], X_init[1:3*(Ns+Nr):3], X_init[2:3*(Ns+Nr):3], c='r', marker='^')

  ax.set_xlabel('X Label')
  ax.set_ylabel('Y Label')
  ax.set_zlabel('Z Label')

  fig2 = plt.figure()
  ax = fig2.add_subplot(111, projection='3d')
  ax.scatter(res_lsq.x[3:3*(Ns+Nr):3], res_lsq.x[4:3*(Ns+Nr):3], res_lsq.x[5:3*(Ns+Nr):3], c='b', marker='^')
  ax.set_xlabel('X Label')
  ax.set_ylabel('Y Label')
  ax.set_zlabel('Z Label')

if NDIM==2:
  plt.figure()
  plt.plot(X_real[0],X_real[1], 'k*',label='source 1')
  plt.plot(X_real[2:2*Ns:2],X_real[3:2*Ns:2], "o",label='sources')
  plt.plot(X_real[2*Ns:2*(Ns+Nr):2],X_real[2*Ns+1:2*(Ns+Nr):2], 'g^',label='receivers')
  plt.title('Target configuration', fontsize=20)
  plt.legend()

  plt.figure()
  plt.plot(X_init[0],X_init[1], 'k*',label='source 1')
  plt.plot(X_init[2:2*Ns:2],X_init[3:2*Ns:2], "o",label='sources')
  plt.plot(X_init[2*Ns:2*(Ns+Nr):2],X_init[2*Ns+1:2*(Ns+Nr):2], 'g^',label='receivers')
  plt.title('Initial guess', fontsize=20)
  plt.legend()

  plt.figure()
  plt.plot(res_lsq.x[0],res_lsq.x[1], 'k*',label='source 1')
  plt.plot(res_lsq.x[2:2*Ns:2],res_lsq.x[3:2*Ns:2], "o",label='sources')
  plt.plot(res_lsq.x[2*Ns:2*(Ns+Nr):2],res_lsq.x[2*Ns+1:2*(Ns+Nr):2], 'g^',label='receivers')
  plt.title('Inverted configuration', fontsize=20)
  plt.legend()

#Plotting delays


plt.figure()
plt.plot(delay_real, label='delay reality')
plt.plot(res_lsq.x[NDIM*Ns+NDIM*Nr:NDIM*Ns+NDIM*Nr+Nr+Ns], label='delay reconstructed')
plt.legend()
plt.title('Delay of each source and each receiver', fontsize=20)
plt.show()

