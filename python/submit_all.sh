for i in *.pbs; do echo $i; qsub $i; done

