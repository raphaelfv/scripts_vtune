#!/bin/sh
if [ $# -ne 1 ]
  then
    echo "Uso do programa: $0 <nome_executavel>"
    exit 1
fi

whichcard=0
nome_exec=$1
PROJ_DIR=$PWD/../codigos

export COMPILER_ROOT=$TBBROOT/../compiler
export MIC_AFFINITY="balanced,granularity=fine"
export MIC_OMP_LIBRARY=throughput  ####### VERIFICAR O QUE EH
export MIC_NUM_THREADS=228
export MIC_STACKSIZE=2M
export MIC_KMP_FOR_TPROFILE=1

export MIC_NUM_THREADS=228
export MIC_STACKSIZE=2M
echo "threads: $MIC_NUM_THREADS"
echo "stacksize: $MIC_STACKSIZE"
ssh mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"
#ssh $HOSTNAME-mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"

export MIC_NUM_THREADS=228
export MIC_STACKSIZE=1M
echo "threads: $MIC_NUM_THREADS"
echo "stacksize: $MIC_STACKSIZE"
ssh mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"
#ssh $HOSTNAME-mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"

export MIC_NUM_THREADS=228
export MIC_STACKSIZE=4M
echo "threads: $MIC_NUM_THREADS"
echo "stacksize: $MIC_STACKSIZE"
ssh mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"
#ssh $HOSTNAME-mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"

export MIC_NUM_THREADS=171
export MIC_STACKSIZE=2M
echo "threads: $MIC_NUM_THREADS"
echo "stacksize: $MIC_STACKSIZE"
ssh mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"
#ssh $HOSTNAME-mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"

export MIC_NUM_THREADS=171
export MIC_STACKSIZE=1M
echo "threads: $MIC_NUM_THREADS"
echo "stacksize: $MIC_STACKSIZE"
ssh mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"
#ssh $HOSTNAME-mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"

export MIC_NUM_THREADS=171
export MIC_STACKSIZE=4M
echo "threads: $MIC_NUM_THREADS"
echo "stacksize: $MIC_STACKSIZE"
ssh mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"
#ssh $HOSTNAME-mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"

export MIC_NUM_THREADS=114
export MIC_STACKSIZE=2M
echo "threads: $MIC_NUM_THREADS"
echo "stacksize: $MIC_STACKSIZE"
ssh mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"
#ssh $HOSTNAME-mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"

export MIC_NUM_THREADS=114
export MIC_STACKSIZE=1M
echo "threads: $MIC_NUM_THREADS"
echo "stacksize: $MIC_STACKSIZE"
ssh mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"
#ssh $HOSTNAME-mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"

export MIC_NUM_THREADS=114
export MIC_STACKSIZE=4M
echo "threads: $MIC_NUM_THREADS"
echo "stacksize: $MIC_STACKSIZE"
ssh mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"
#ssh $HOSTNAME-mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"

export MIC_NUM_THREADS=57
export MIC_STACKSIZE=2M
echo "threads: $MIC_NUM_THREADS"
echo "stacksize: $MIC_STACKSIZE"
ssh mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"
#ssh $HOSTNAME-mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"

export MIC_NUM_THREADS=57
export MIC_STACKSIZE=1M
echo "threads: $MIC_NUM_THREADS"
echo "stacksize: $MIC_STACKSIZE"
ssh mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"
#ssh $HOSTNAME-mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"

export MIC_NUM_THREADS=57
export MIC_STACKSIZE=4M
echo "threads: $MIC_NUM_THREADS"
echo "stacksize: $MIC_STACKSIZE"
ssh mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"
#ssh $HOSTNAME-mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; time $PROJ_DIR/$nome_exec"

