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
export MIC_NUM_THREADS=228
#export factor_speed_xphi=16  ####### VERIFICAR O QUE EH

#ssh $HOSTNAME-mic$whichcard "export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; $PROJ_DIR/$nome_exec"
echo "ssh mic$whichcard ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; $PROJ_DIR/$nome_exec"
ssh mic$whichcard "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; $PROJ_DIR/$nome_exec"
