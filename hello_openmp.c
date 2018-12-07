
#include <omp.h>
#include <stdio.h>

main (int argc, char *argv[])
{
  int nthreads, tid;

  #pragma omp parallel private(tid)
   {
     tid = omp_get_thread_num();
     nthreads = omp_get_num_threads();
     printf("Hello from thread %d of total %d threads!\n", tid, nthreads);
   }
}
