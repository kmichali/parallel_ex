### this only runs on one core!??

import time
import multiprocessing as mp

def calc_sum(myrange,w,q):
    psum = 0.0

    for i in myrange:
        psum += 4.0/(1.0 + w*w*(i - 0.5)*(i - 0.5))
    q.put(psum)


n = int(10e5)

start_time = time.time()

queue = mp.Queue() 
w = 1.0/n
p = mp.Process(target=calc_sum, args=(range(1,n+1), w, queue))

p.start()
p.join()



while queue:
    print(w * queue.get())

#pi=w*sum

duration = time.time() - start_time

#print(f"{n:,d}", "   ", pi, "   ", duration)


