
# ze function for signal processing 
# created on Sat Sep 22 15:21:32 EDT 2018

## Revised on Wed Dec 26 17:20:43 EST 2018
##  25 def freqlist2indexes(freqlist,df):

import math as M
import numpy as np
from future.utils import native
def next_pow_2(i):
    """
    Find the next power of two

    >>> int(next_pow_2(5))
    8
    >>> int(next_pow_2(250))
    256
    """
    # do not use NumPy here, math is much faster for single values
    buf = M.ceil(M.log(i) / M.log(2))
    return native(int(M.pow(2, buf)))

def freq2index(freq,df):
## convert the absolute frequency to the index number of an array of frequency range
    return int(round(freq/df))

def freqlist2indexes(freqlist,df):

    freqlist2list=[]

    for freq in freqlist: 

        freqindex=int(freq/df)

        #freqindex=freq2index(freq,df)

        freqlist2list.append(freqindex)

    return freqlist2list 


