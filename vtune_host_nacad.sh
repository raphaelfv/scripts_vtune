#!/bin/sh
if [ $# -ne 3 ]
  then
    echo "Uso do programa: $0 <nome_analise> <nome_pasta> <nome_executavel>"
    echo "Exemplo: $0 bandwidth 1tiro vs08_mic"
    echo "Tipos de analise disponiveis: hotspots, advanced-hotspots, general-exploration, concurrency, locksandwaits, bandwidth"
    exit 1
fi

analise=$1
nome_pasta=$2
nome_arquivo=$3
nome_exec=${nome_arquivo}_$nome_pasta
meu_local=$PWD/../src_local
resultado=$PWD/../vtune/$nome_exec
COLLECT_DIR=$resultado/$analise/
PROJ_DIR=$PWD
whichcard=0
#echo "0"|sudo tee /proc/sys/kernel/yama/ptrace_scope #MODIFICAR CASO ESTEJA RODANDO HS

export OMP_NUM_THREADS=16 #MODIFICAR COM O NUMERO DE THREADS
export KMP_AFFINITY="granularity=thread,proclist=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],explicit" 
export KMP_FOR_TPROFILE=1

#amplxe-cl -collect $analise -result-dir $resultado/$analise/ --start-paused --resume-after 4000 --duration 30 $meu_local/$nome_exec
amplxe-cl -target-duration-type=veryshort -collect $analise -result-dir $resultado/$analise/ $meu_local/$nome_exec

#intensidade aritmetica
#amplxe-cl -target-duration-type=veryshort -collect-with runsa -knob event-config=FP_COMP_OPS_EXE.SSE_PACKED_SINGLE -result-dir $resultado/intensidade-aritmetica/ $meu_local/$nome_exec
#amplxe-cl -target-duration-type=veryshort -collect-with runsa -knob event-config=FP_ASSIST.X87_OUTPUT,FP_ASSIST.X87_INPUT,FP_ASSIST.SIMD_OUTPUT,FP_ASSIST.SIMD_INPUT,FP_COMP_OPS_EXE.X87,FP_COMP_OPS_EXE.SSE_PACKED_DOUBLE,FP_COMP_OPS_EXE.SSE_SCALAR_SINGLE,FP_COMP_OPS_EXE.SSE_PACKED_SINGLE,FP_COMP_OPS_EXE.SSE_SCALAR_DOUBLE,SIMD_FP_256.PACKED_SINGLE,SIMD_FP_256.PACKED_DOUBLE,FP_ASSIST.ANY -result-dir $resultado/intensidade-aritmetica/ $meu_local/$nome_exec

cp $meu_local/$nome_pasta/$nome_arquivo.f90 $resultado
cp $meu_local/$nome_exec $resultado
