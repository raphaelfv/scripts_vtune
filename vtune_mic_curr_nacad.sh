#!/bin/sh
if [ $# -ne 2 ]
  then
    echo "Uso do programa: $0 <nome_analise> <nome_executavel>"
    echo "Tipos de analise disponiveis: hotspots, advanced-hotspots, general-exploration, concurrency, locksandwaits, bandwidth"
    exit 1
fi

analise=$1
nome_arquivo=$2
nome_exec=$2
meu_local=$PWD
resultado=/home/luciano/raphael/vtune/$nome_exec
COLLECT_DIR=$resultado/$analise/
PROJ_DIR=$PWD
whichcard=0
#echo "0"|sudo tee /proc/sys/kernel/yama/ptrace_scope #MODIFICAR CASO ESTEJA RODANDO HS

COMPILER_LIBS=$TBBROOT/../compiler/lib/mic

COMP_LIBS_SEARCH="--search-dir all:rp=$COMPILER_LIBS"
uOS_SEARCH="--search-dir all:rp=/opt/mpss/3.3/sysroots/k1om-mpss-linux/boot --search-dir all:rp=/opt/mpss/3.3/sysroots/k1om-mpss-linux/lib64"

set -x
duracao="veryshort" #veryshort
inicio="0"
duracao="1"

#com duracao
#amplxe-cl -collect $1 -target-system=mic-host-launch:mic$whichcard -r $resultado/$analise --start-paused --resume-after $inicio --duration $duracao -- $PROJ_DIR/mic_native_nacad.sh $nome_arquivo

#delimita o inicio mas nao marca o fim
#amplxe-cl -collect $1 -target-duration-type=veryshort -target-system=mic-host-launch:mic$whichcard -r $resultado/$analise --start-paused --resume-after $inicio --search-dir /opt/mpss/3.4.3/sysroots/k1om-mpss-linux/boot -- $PROJ_DIR/mic_native_nacad.sh 0 $nome_exec

#sem duracao
amplxe-cl -collect $1 -target-system=mic-host-launch:mic$whichcard -r $resultado/$analise -- $PROJ_DIR/mic_native_nacad.sh $nome_arquivo
#amplxe-cl -collect $1 -target-system=mic-host-launch:mic$whichcard -r $resultado/$analise --search-dir /opt/mpss/3.4.3/sysroots/k1om-mpss-linux/boot -- $PROJ_DIR/mic_native_nacad.sh 0 $nome_exec

#para intensidade aritmetica
#com VPU
#amplxe-cl -target-duration-type=$duracao -collect-with runsa-knc -knob event-config=VPU_ELEMENTS_ACTIVE,CPU_CLK_UNHALTED,INSTRUCTIONS_EXECUTED  --start-paused --resume-after 330 --duration 1 -target-system=mic-host-launch:mic$whichcard -r $resultado/intensidade-aritmetica_VPU --search-dir /opt/mpss/3.4.3/sysroots/k1om-mpss-linux/boot -- $PROJ_DIR/mic_native_nacad.sh 0 $nome_arquivo

#sem VPU
#amplxe-cl -target-duration-type=veryshort -collect-with runsa-knc -knob event-config=CPU_CLK_UNHALTED -target-system=mic-host-launch:mic$whichcard -r $resultado/intensidade-aritmetica_no_VPU --start-paused --resume-after 330 --duration 1 --search-dir /opt/mpss/3.4.3/sysroots/k1om-mpss-linux/boot -- $PROJ_DIR/mic_native_nacad.sh 0 $nome_arquivo


#cp $meu_local/$nome_pasta/$nome_arquivo.f90 $resultado
cp $meu_local/$nome_arquivo.cpp $resultado
cp $meu_local/$nome_exec $resultado

set +x