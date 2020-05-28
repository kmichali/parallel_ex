       program calc_pi

       implicit none

       integer(KIND=8)          :: n, i, ticks_sec, ini, fin
       double precision :: w, x, sum, pi, a
       double precision :: duration, timef
 

       !n=10000000000
       n=1E10

       CALL SYSTEM_CLOCK(COUNT_RATE=ticks_sec)
       CALL SYSTEM_CLOCK(COUNT=ini)

       w=1.0/n
       sum=0.0

       do i=1,n
          x=w*(i-0.5)
          sum=sum+4.0/(1.0+x*x)
       end do

       pi=w*sum

       CALL SYSTEM_CLOCK(COUNT=fin)
       duration=REAL(fin-ini)/ticks_sec

       print*,"pi_serial",n,pi,duration

       end
