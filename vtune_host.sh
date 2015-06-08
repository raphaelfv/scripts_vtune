#bin/bash
if [ $# -ne 3 ]
  then
    echo "Uso do programa: $0 <nome_analise> <nome_pasta> <nome_fonte>"
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
#echo "0"|sudo tee /proc/sys/kernel/yama/ptrace_scope #MODIFICAR CASO ESTEJA RODANDO HS

export OMP_NUM_THREADS=28 #MODIFICAR COM O NUMERO DE THREADS
export KMP_AFFINITY="granularity=thread,proclist=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27],explicit" 

set -x
#com tempo
#amplxe-cl -collect $analise -result-dir $resultado/$analise/ --start-paused --resume-after 2000 --duration 4 $meu_local/$nome_exec

#sem tempo
#amplxe-cl -collect $analise -result-dir $resultado/$analise/ $meu_local/$nome_exec

#intensidade aritmetica
#amplxe-cl -collect-with runsa -knob event-config=CPU_CLK_THREAD_UNHALTED.REF_XCLK:sa=2000003,CPU_CLK_UNHALTED.REF_TSC:sa=2000003,CPU_CLK_UNHALTED.THREAD:sa=2000003,CPU_CLK_UNHALTED.THREAD_P:sa=2000003,FP_ASSIST.SIMD_INPUT:sa=100003,FP_COMP_OPS_EXE.SSE_PACKED_SINGLE:sa=2000003,FP_COMP_OPS_EXE.SSE_SCALAR_SINGLE:sa=2000003,FP_COMP_OPS_EXE.X87:sa=2000003,INST_RETIRED.ANY:sa=2000003,SIMD_FP_256.PACKED_SINGLE:sa=2000003 -result-dir $resultado/intensidade-artimetica/ $meu_local/$nome_exec
#amplxe-cl -collect-with runsa -knob event-config=FP_COMP_OPS_EXE.SSE_PACKED_SINGLE:sa=2000003,FP_COMP_OPS_EXE.SSE_SCALAR_SINGLE:sa=2000003,FP_COMP_OPS_EXE.X87:sa=2000003,SIMD_FP_256.PACKED_SINGLE:sa=2000003 -result-dir $resultado/intensidade-aritmetica/ $meu_local/$nome_exec
set +x

cp $meu_local/$nome_pasta/$nome_arquivo.f90 $resultado
