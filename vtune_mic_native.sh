#!/bin/sh
#nome_exec=rtm_acust_2D
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

#export OMP_NUM_THREADS=16 #MODIFICAR COM O NUMERO DE THREADS
#export KMP_AFFINITY="granularity=thread,proclist=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],explicit" 

COMPILER_LIBS=$TBBROOT/../compiler/lib/mic

COMP_LIBS_SEARCH="--search-dir all:rp=$COMPILER_LIBS"
uOS_SEARCH="--search-dir all:rp=/opt/mpss/3.3/sysroots/k1om-mpss-linux/boot --search-dir all:rp=/opt/mpss/3.3/sysroots/k1om-mpss-linux/lib64"

#com duracao
#echo "amplxe-cl -collect $1 -target-system=mic-host-launch:mic$whichcard -r $resultado/$analise --start-paused --resume-after 2000 --duration 4 --search-dir /opt/mpss/3.4.3/sysroots/k1om-mpss-linux/boot -- $PROJ_DIR/mic_native_nacad.sh"
#amplxe-cl -collect $1 -target-system=mic-host-launch:mic$whichcard -r $resultado/$analise --start-paused --resume-after 2000 --duration 4 --search-dir /opt/mpss/3.4.3/sysroots/k1om-mpss-linux/boot -- $PROJ_DIR/mic_native_nacad.sh 0 $nome_exec

#sem duracao
amplxe-cl -target-duration-type=veryshort -collect $1 -target-system=mic-native:mic$whichcard -r $resultado/$analise --search-dir /opt/mpss/3.4.3/sysroots/k1om-mpss-linux/boot -- $PROJ_DIR/mic_native_nacad.sh 0 $nome_exec
#amplxe-cl -collect $1 -target-system=mic-host-launch:mic$whichcard -r $resultado/$analise --search-dir /opt/mpss/3.4.3/sysroots/k1om-mpss-linux/boot -- $PROJ_DIR/mic_native_nacad.sh 0 $nome_exec

#para intensidade aritmetica
#amplxe-cl -target-duration-type=veryshort -collect-with runsa -knob event-config=VPU_ELEMENTS_ACTIVE,CPU_CLK_UNHALTED -target-system=mic-host-launch:mic$whichcard -r $resultado/intensidade-aritmetica --search-dir /opt/mpss/3.4.3/sysroots/k1om-mpss-linux/boot -- $PROJ_DIR/mic_native_nacad.sh 0 $nome_exec

cp $meu_local/$nome_pasta/$nome_arquivo.f90 $resultado
cp $meu_local/$nome_exec $resultado
