from mpi4py import MPI

comm = MPI.COMM_WORLD
name=MPI.Get_processor_name()
print("hello, from name:",name,", my rank is",comm.Get_rank(), ", my size is ", comm.Get_size() )

