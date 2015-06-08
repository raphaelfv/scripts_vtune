#!/bin/sh
if [ $# -ne 2 ]
  then
    echo "Uso do programa: $0 <nome_pasta> <nome_executavel>"
    echo "Exemplo: $0 1tiro vs08_mic"
    exit 1
fi

nome_pasta=$1
nome_arquivo=$2
nome_exec=${nome_arquivo}_$nome_pasta
meu_local=$PWD/../src_local
resultado=$PWD/../vtune/$nome_exec
COLLECT_DIR=$resultado/$analise/
PROJ_DIR=$PWD
whichcard=0
#echo "0"|sudo tee /proc/sys/kernel/yama/ptrace_scope #MODIFICAR CASO ESTEJA RODANDO HS

ulimit -s unlimited
export OMP_NUM_THREADS=16 #MODIFICAR COM O NUMERO DE THREADS
export KMP_AFFINITY="granularity=thread,proclist=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],explicit" 

$meu_local/$nome_arquivo
