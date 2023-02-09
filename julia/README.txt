Running Julia on Imperial HPC cluster:

Julia is managed using anaconda. As with R or Python, set up your module dependencies on the command line on the login nodes. When it comes to running a job, you have to load the anaconda environment in your script.

 

Setting up your conda environment and installing dependencies:

$module load anaconda3/personal 

$conda create -n julia_test 

$source activate julia_test 

$conda install -c conda-forge julia 

$julia 

julia> using Pkg

julia> Pkg.add("DataFrames") 

 

julia> using DataFrames 

julia> df = DataFrame(A=1:4, B=["M", "F", "F", "M"]) 

4×2 DataFrame 

Row │ A      B       

     │ Int64  String  

─────┼─────────────── 

   1 │     1  M 

   2 │     2  F 

   3 │     3  F 

   4 │     4  M 


 


Running a job:

 

-- test code-- 

$ cat test.jl  

using DataFrames 

df = DataFrame(A=1:4, B=["M", "F", "F", "M"]) 

println(df) 


 

-- script-- 

$ cat runjulia.pbs 

#PBS -l walltime=00:10:00 

#PBS -l select=1:ncpus=1:mem=1gb 

 

module load anaconda3/personal 

source activate julia_test 

 

cd $PBS_O_WORKDIR 

julia test.jl

 

-- run the job -- 

$ qsub runjulia.pbs  

5800133.pbs 

$ qstat 

   Job ID           Class            Job Name        Status     Comment    

-------------- --------------- -------------------- -------- ------------- 

5800133        Short           runjulia.pbs         Queued   no start time estimate yet 


 

$ ll 

total 2 

-rw-r--r--. 1 kmichali hpc-kmichali 153 Jul  6 12:00 runjulia.pbs 

-rw-------. 1 kmichali hpc-kmichali   0 Jul  6 12:01 runjulia.pbs.e5800133 

-rw-------. 1 kmichali hpc-kmichali 192 Jul  6 12:01 runjulia.pbs.o5800133 

-rw-r--r--. 1 kmichali hpc-kmichali  77 Jul  6 11:57 test.jl 


 

-- see the printout from the test job-- 

$ cat runjulia.pbs.o5800133 

4×2 DataFrame 

Row │ A      B 

     │ Int64  String 

─────┼─────────────── 

   1 │     1  M 

   2 │     2  F 

   3 │     3  F 

   4 │     4  M
