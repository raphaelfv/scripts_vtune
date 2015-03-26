#!/bin/sh

PROJ_DIR=$PWD/../src_local
nome_exec=vs08-1_mic_lixo

export COMPILER_ROOT=$TBBROOT/../compiler
export MIC_AFFINITY="balanced,granularity=fine"
#export MIC_PLACEMENT=61Cx4T
export MIC_OMP_LIBRARY=throughput  ####### VERIFICAR O QUE EH
export MIC_NUM_THREADS=171
#export factor_speed_xphi=16  ####### VERIFICAR O QUE EH

set -x
ssh mic0 "ulimit -s unlimited; export LD_LIBRARY_PATH=$COMPILER_ROOT/lib/mic/; export OMP_NUM_THREADS=$MIC_NUM_THREADS; export KMP_AFFINITY=$MIC_AFFINITY; export KMP_LIBRARY=$MIC_OMP_LIBRARY; export KMP_FORKJOIN_FRAMES_MODE=3; $PROJ_DIR/$nome_exec"
set +x
