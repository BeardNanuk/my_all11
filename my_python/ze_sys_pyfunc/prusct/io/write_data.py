
from scipy import interpolate
import numpy as np


## by EB on 20190428
def writestreamsu(d, path, filename):
    for t in d:
        # work around obspy data type conversion
        t.data = t.data.astype(np.float32)

#    if d[0].stats.delta > max_delta:
#        for t in d:
#            t.stats.delta = dummy_delta

    # write data to file
#    d.write(path+'/'+filename, format='SU')


    with open(path +'/'+ filename, 'wb') as file:
      for t in d:
        a = np.zeros(len(t.data)+60,dtype=np.float32)
        a[60:] = t.data
        a.tofile(file)


