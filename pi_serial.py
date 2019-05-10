import time

n = int(10e9)

start_time = time.time()

w = 1.0/n
sum = 0.0

for i in range(1,n+1):
    x = w*(i - 0.5)
    sum = sum+4.0/(1.0 + x*x)
    
pi=w*sum
duration = time.time() - start_time


print(n, "   ", pi, "   ", duration)

