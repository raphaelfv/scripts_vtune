#!/bin/sh
if [ $# -ne 2 ]
  then
    echo "Uso do programa: $0 <nome_analise> <nome_executavel>"
    echo "Exemplo: $0 bandwidth 1tiro vs08_mic"
    echo "Tipos de analise disponiveis: hotspots, advanced-hotspots, general-exploration, concurrency, locksandwaits, bandwidth"
    exit 1
fi

analise=$1
nome_arquivo=$2
nome_exec=$nome_arquivo
meu_local=$PWD
resultado=$PWD/../raphael/vtune/$nome_exec
COLLECT_DIR=$resultado/$analise/
PROJ_DIR=$PWD
whichcard=0
#echo "0"|sudo tee /proc/sys/kernel/yama/ptrace_scope #MODIFICAR CASO ESTEJA RODANDO HS

export OMP_NUM_THREADS=16 #MODIFICAR COM O NUMERO DE THREADS
#export KMP_AFFINITY="granularity=thread,proclist=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],explicit" 
export KMP_AFFINITY="verbose,granularity=core,scatter"
export KMP_FOR_TPROFILE=1
ulimit -s unlimited

#amplxe-cl -collect $analise -result-dir $resultado/$analise/ --start-paused --resume-after 4000 --duration 30 $meu_local/$nome_exec
amplxe-cl -collect $analise -result-dir $COLLECT_DIR -- numactl --interleave=0,1 ./$nome_arquivo

#intensidade aritmetica
#amplxe-cl -target-duration-type=veryshort -collect-with runsa -knob event-config=FP_COMP_OPS_EXE.SSE_PACKED_SINGLE -result-dir $resultado/intensidade-aritmetica/ $meu_local/$nome_exec
#amplxe-cl -target-duration-type=veryshort -collect-with runsa -knob event-config=FP_ASSIST.X87_OUTPUT,FP_ASSIST.X87_INPUT,FP_ASSIST.SIMD_OUTPUT,FP_ASSIST.SIMD_INPUT,FP_COMP_OPS_EXE.X87,FP_COMP_OPS_EXE.SSE_PACKED_DOUBLE,FP_COMP_OPS_EXE.SSE_SCALAR_SINGLE,FP_COMP_OPS_EXE.SSE_PACKED_SINGLE,FP_COMP_OPS_EXE.SSE_SCALAR_DOUBLE,SIMD_FP_256.PACKED_SINGLE,SIMD_FP_256.PACKED_DOUBLE,FP_ASSIST.ANY -result-dir $resultado/intensidade-aritmetica/ $meu_local/$nome_exec

cp $PROJ_DIR/$nome_arquivo.cpp $resultado
cp $PROJ_DIR/$nome_arquivo $resultado
