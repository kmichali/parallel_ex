#this implementation exceeds 4gb of RAM around n=10e7

import time
import numpy as np
#from numba import jit

#@jit
def area():
    return 4/(1.0 + w*(l - 0.5)*w*(l - 0.5))


start_time = time.time()

n = int(10e7)
w = 1.0/n

l = np.linspace(1, n, n)
f = area()

pi = w*np.sum(f)

duration = time.time() - start_time

print(n, "   ", pi, "   ", duration)
