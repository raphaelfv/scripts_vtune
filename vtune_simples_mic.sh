#!/bin/sh

analise=advanced-hotspots
meu_local=$PWD/../src_local
COLLECT_DIR=$resultado/$analise/
PROJ_DIR=$PWD
#echo "0"|sudo tee /proc/sys/kernel/yama/ptrace_scope #MODIFICAR CASO ESTEJA RODANDO HS

set -x 
amplxe-cl -collect $analise -target-system=mic-host-launch:mic0 --search-dir /opt/mpss/3.4.3/sysroots/k1om-mpss-linux/boot -- $PROJ_DIR/mic_simples_nacad.sh
#amplxe-cl -collect $analise --start-paused  --resume-after 2000 --duration 4 --target-system=mic-host-launch:mic0 --search-dir /opt/mpss/3.4.3/sysroots/k1om-mpss-linux/boot -- $PROJ_DIR/mic_simples_native_nacad.sh
set +x
