import time
from numba import jit

@jit(nopython=True)
def calc_sum(n,w):
    psum = 0.0

    for i in range(1,n+1):
      psum += 4.0/(1.0 + w*w*(i - 0.5)*(i - 0.5))
    return psum


n = int(10e9)

start_time = time.time()
w = 1.0/n

sum = calc_sum(n,w)
pi=w*sum

duration = time.time() - start_time

print(f"{n:,d}", "   ", pi, "   ", duration)
