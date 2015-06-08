#!/bin/sh

if [ $# -ne 2 ]
  then
    echo "Uso do programa: $0 <Xeon Phi card number> <nome_executavel>"
    exit 1
fi

whichcard=$1
nome_exec=$2
PROJ_DIR=$PWD/../src_local

export COMPILER_ROOT=$TBBROOT/../compiler
export MIC_AFFINITY="balanced,granularity=fine"
#export MIC_PLACEMENT=61Cx4T
export MIC_OMP_LIBRARY=throughput  ####### VERIFICAR O QUE EH
export MIC_NUM_THREADS=114
export MIC_STACKSIZE=1M
#export factor_speed_xphi=16  ####### VERIFICAR O QUE EH
export MIC_KMP_FOR_TPROFILE=1

set -x
ssh mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_STACKSIZE=$MIC_STACKSIZE; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=1; export KMP_FOR_TPROFILE=$MIC_KMP_FOR_TPROFILE; $PROJ_DIR/$nome_exec"
set +x
