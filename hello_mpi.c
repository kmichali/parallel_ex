#include <stdlib.h>
#include <stdio.h>
#include <mpi.h>

int main(int argc,char **argv) {
  MPI_Comm comm;
  int nprocs,procid;

  MPI_Init(&argc,&argv);
  comm = MPI_COMM_WORLD;
  MPI_Comm_size(comm,&nprocs);
  MPI_Comm_rank(comm,&procid);

  int name_length = 100;  
  char proc_name[name_length];
  MPI_Get_processor_name(proc_name,&name_length);
  printf("Hello from process %d out of %d running on %s\n",procid,nprocs, proc_name);
  MPI_Finalize();
  return 0;
}

