#!/bin/sh

if [ $# -ne 1 ]
  then
    echo "Uso do programa: $0 <nome_executavel>"
    exit 1
fi

whichcard=0
nome_exec=$1
PROJ_DIR=$PWD

export COMPILER_ROOT=$TBBROOT/../compiler
export MIC_AFFINITY="compact,granularity=fine"
export MIC_OMP_LIBRARY=throughput  
export MIC_NUM_THREADS=228
export MIC_STACKSIZE=2M

set -x
ssh mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; $PROJ_DIR/$nome_exec"
set +x
