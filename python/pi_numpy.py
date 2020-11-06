import time
import numpy as np
from numba import jit

@jit
def area(i, n, w):
    return 4/(1.0 + w*(i - 0.5)*w*(i - 0.5))


start_time = time.time()

n = int(10e7)
w = 1.0/n

i = np.linspace(1, n, n)
f = area(i,n,w)

pi = w*np.sum(f)

duration = time.time() - start_time

print(n, "   ", pi, "   ", duration)
