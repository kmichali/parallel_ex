program calc_pi_mpi_version
       use iso_fortran_env
       use mpi
       implicit none



       integer :: myrank, nproc, ierr
       double precision, dimension(:), allocatable :: duration,tduration

       integer(kind=int64)          :: n, i
       double precision :: w, x, sum, pi, a, start, finish, total_duration

       call MPI_INIT(ierr)

       call MPI_COMM_RANK(MPI_COMM_WORLD,myrank,ierr)
       call MPI_COMM_SIZE(MPI_COMM_WORLD,nproc,ierr)

       allocate(duration(0:nproc-1))
       allocate(tduration(0:nproc-1))
       duration(0:nproc-1)=0.0d0

       n=10000000000

       call cpu_time(start)

       w=1.0/n
       sum=0.0

       do i=1+myrank*(n/nproc),(myrank+1)*(n/nproc)
          x=w*(i-0.5)
          sum=sum+4.0/(1.0+x*x)
       end do

       call MPI_Reduce(sum,pi,1,MPI_double_precision,MPI_sum,0,MPI_COMM_WORLD,ierr)

       pi=w*pi

       call cpu_time(finish)
       duration(myrank)=finish-start
 
       call MPI_Reduce(duration(0),tduration(0),nproc,MPI_double_precision, &
       MPI_sum,0,MPI_COMM_WORLD,ierr)

       if ( myrank == 0 ) then
          total_duration=tduration(0)
          do i=1,nproc-1
             if( tduration(i) > total_duration ) total_duration=tduration(i)
          end do

          print*,"pi_mpi",n,pi,total_duration
       endif

       deallocate(duration)

       call MPI_FINALIZE(ierr)

       end

