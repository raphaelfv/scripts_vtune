#bin/bash
#nome_exec=rtm_acust_2D
if [ $# -ne 2 ]
  then
    echo "Uso do programa: ./vtune_host <nome_analise> <nome_executavel>"
    echo "Exemplo: ./vtune_host bandwidth rtm_acust_2D"
    echo "Tipos de analise disponiveis: hotspots, advanced-hotspots, general-exploration, concurrency, locksandwaits, bandwidth"
    exit 1
fi

nome_exec=$2
analise=$1
meu_local=$PWD/../src_local
resultado=$PWD/../vtune/$2
#echo "0"|sudo tee /proc/sys/kernel/yama/ptrace_scope #MODIFICAR CASO ESTEJA RODANDO HS

export OMP_NUM_THREADS=28 #MODIFICAR COM O NUMERO DE THREADS
export KMP_AFFINITY="granularity=thread,proclist=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27],explicit" 

#amplxe-cl -collect $analise -result-dir $resultado/$analise/ --start-paused --resume-after 2000 --duration 4 $meu_local/$nome_exec
#amplxe-cl -collect $analise -result-dir $resultado/$analise/ $meu_local/$nome_exec
amplxe-cl -collect-with runsa -knob event-config=CPU_CLK_THREAD_UNHALTED.REF_XCLK:sa=2000003,CPU_CLK_UNHALTED.REF_TSC:sa=2000003,CPU_CLK_UNHALTED.THREAD:sa=2000003,CPU_CLK_UNHALTED.THREAD_P:sa=2000003,FP_ASSIST.SIMD_INPUT:sa=100003,FP_COMP_OPS_EXE.SSE_PACKED_SINGLE:sa=2000003,FP_COMP_OPS_EXE.SSE_SCALAR_SINGLE:sa=2000003,FP_COMP_OPS_EXE.X87:sa=2000003,INST_RETIRED.ANY:sa=2000003,SIMD_FP_256.PACKED_SINGLE:sa=2000003 -result-dir $resultado/intensidade-artimetica/ $meu_local/$nome_exec
