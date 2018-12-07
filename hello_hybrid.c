#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

int main(int argc, char *argv[]){
  int rank,omp_rank,mpisupport;
  MPI_Init_thread(&argc,&argv, MPI_THREAD_FUNNELED,&mpisupport);
  MPI_Comm_rank(MPI_COMM_WORLD,&rank);


#pragma omp parallel  private(omp_rank)
  {
    omp_rank=omp_get_thread_num();
    printf("%d %d  \n",rank,omp_rank);
  }


  MPI_Finalize();
}
