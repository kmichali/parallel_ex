EXE = pi_serial pi_openmp pi_mpi pi_hybrid hello_hybrid hello_mpi hello_openmp for_openmp
SRC = pi_serial.f90 pi_openmp.f90 pi_mpi.f90 pi_hybrid.f90 hello_hybrid.c hello_mpi.c hello_openmp.c for_openmp.c


$(EXE): $(SRC)
	ifort -o pi_serial pi_serial.f90
	ifort -qopenmp -o pi_openmp pi_openmp.f90
	mpif90 -o pi_mpi pi_mpi.f90
	mpif90 -qopenmp -o pi_hybrid pi_hybrid.f90
	icc -qopenmp -o hello_openmp hello_openmp.c
	mpicc -o hello_mpi hello_mpi.c
	mpicc -qopenmp -o hello_hybrid hello_hybrid.c
	icc -qopenmp -o for_openmp for_openmp.c

clean:
	rm $(EXE)
