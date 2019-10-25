       program calc_pi

       implicit none

       integer(KIND=8)          :: n, i, ticks_sec, ini, fin
       double precision :: w, x, sum, pi , a
       double precision :: duration, timef

       n=1E10

       CALL SYSTEM_CLOCK(COUNT_RATE=ticks_sec)
       CALL SYSTEM_CLOCK(COUNT=ini)

       w=1.0/n
       sum=0.0

       !$OMP PARALLEL DEFAULT(NONE) PRIVATE(x,i), SHARED(w,n), &
       !$OMP REDUCTION(+:sum)
       !$OMP DO
       do i=1,n
          x=w*(i-0.5)
          sum=sum+4.0/(1.0+x*x)
       end do
       !$OMP END DO
       !$OMP END PARALLEL

       pi=w*sum

       CALL SYSTEM_CLOCK(COUNT=fin)
       duration=REAL(fin-ini)/ticks_sec

       print*,n,"  ",pi,"  ",duration

       end
