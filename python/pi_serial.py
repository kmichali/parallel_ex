import time

n = int(10e9)

start_time = time.time()

w = 1.0/n
psum = 0.0

for i in range(1,n+1):
    x = w*(i - 0.5)
    psum = psum+4.0/(1.0 + x*x)
pi=w*psum
duration = time.time() - start_time


print(n, "   ", pi, "   ", duration)
