
## created on Fri Dec 14 17:30:13 EST 2018 
## created by Jiaze He 

## common parts shared by printgllmap and zPrintgllmap



parameters = loadpy('parameters.py')
sys.modules['seisflows_parameters'] = Dict(parameters)
PAR = sys.modules['seisflows_parameters']
nproc=PAR.NPROC
print nproc

x=np.array([])
z=np.array([])
for i in range(nproc):
  if (par == 'last'):
     x_temp, z_temp = getcoords('./model_init',i)
  else:
     x_temp, z_temp = getcoords('./model_init',i)
     #x_temp, z_temp = getcoords(dirname,i)
  x=np.append(x,x_temp)
  z=np.append(z,z_temp)

###print('xshape = ', x.shape)
###print('zshape = ', z.shape)
#get parameter to image vector
v=np.array([])
for i in range(nproc):
    if (par == 'last'):
       #filename=dirname +'/'+'' + str(i).zfill(6) + '.bin'
       filename=dirname +'/'+'proc' + str(i).zfill(6) + '_' + 'vp' + '_kernel.bin'
    else:
       filename=dirname +'/'+'proc' + str(i).zfill(6) + '_' + par + '.bin'
    v= np.append(v,_read(filename))

print('vshape = ', v.shape)
w=v
w_undersamp = w[::undersamp_fact]
#w_undersamp = w
x_undersamp = x[::undersamp_fact]
#x_undersamp = x
z_undersamp = z[::undersamp_fact]


max_abs_value = np.max(abs(w))
print('max value= ', max_abs_value)

#minval = min(w_undersamp)
#maxval = max(w_undersamp)
#maxabs = max(abs(w_undersamp))
#temp='jh ='
#print temp, maxval-minval
#print msg % (filename, minval, maxval)
f, p = meshplot(x_undersamp, z_undersamp, w_undersamp)
plt.xticks( color = 'k', size = 18)
plt.yticks( color = 'k', size = 18)
ax = plt.axes()
ax.xaxis.set_major_locator(ticker.MultipleLocator(multi_locator_spc))
ax.yaxis.set_major_locator(ticker.MultipleLocator(multi_locator_spc))
#ax.xaxis.set_minor_locator(ticker.MultipleLocator(0.025))
#ax.xaxis.set_major_locator(ticker.MaxNLocator(5))
#ax.xaxis.set_minor_locator(ticker.MaxNLocator(8))
ax.set_xlim((-half_x-0.00001,half_x+0.00001))
ax.set_ylim((-half_z-0.00001,half_z+0.00001))
#print('z[-1]',z[-1])
#####print('x[0],x[10],x[-10],x[-1]',x[0],x[10],x[-10],x[-1])
#####print('z[0],z[10],z[-10],z[-1]',z[0],z[10],z[-10],z[-1])
#ax.set_xlim((-0.1001,0.1001))
p.set_cmap(plt.cm.RdYlBu)
#    p.cmap.set_over('k')
cbar=plt.colorbar(fraction=0.046, pad=0.04, orientation='vertical',format='%.1f')
cbar.ax.tick_params(labelsize=18)
#plt.colorbar(myplot, format='%.0f')
#plt.show()
figure = plt.gcf() # get current figure
figure.set_size_inches(10, 6)
#pylab.title(par,size=30)

