
#include <omp.h>
#include <stdio.h>

#define N 1000

main (int argc, char *argv[])
{
  int nthreads, tid, i;
  float a[N],b[N],c[N];

  for (i=0; i<N; i++)
     a[i] = b[i] = i*1.0;
  

#pragma omp parallel private(tid,i) shared(a,b,c,nthreads)
   {

#pragma omp for 
     for (i=0;i<N;i++)
       c[i] = a[i]+b[i];

    tid = omp_get_thread_num();
    nthreads = omp_get_num_threads();
    printf("Hello from thread %d of total %d threads!\n", tid, nthreads);
      
   }
 
}
