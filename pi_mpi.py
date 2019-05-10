import time
import numpy as np
from mpi4py import MPI
n = int(10e9)

comm = MPI.COMM_WORLD
name=MPI.Get_processor_name()
myrank = comm.Get_rank()
nproc = comm.Get_size()

if myrank == 0:
    start_time = time.time()

    
start = 1+myrank * int(n/nproc)
finish = (myrank+1) * int(n/nproc)


psum = 0.0
pi = 0.0
w = 1.0/n

for i in range(start, finish + 1):
    x = w*(i - 0.5)
    psum = psum+4.0/(1.0 + x*x)
    
psum = np.asarray(psum)
pi = np.asarray(pi)
comm.Reduce(psum, pi, op=MPI.SUM) 
pi=w*pi


if myrank == 0:
    duration = time.time() - start_time
    print(n, "   ", pi, "   ", duration)


