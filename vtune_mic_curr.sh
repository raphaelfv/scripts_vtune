#!/bin/sh
#nome_exec=rtm_acust_2D
if [ $# -ne 2 ]
  then
    echo "Uso do programa: $0 <nome_analise> <nome_executavel>"
    echo "Exemplo: ./vtune_host bandwidth eqonda2"
    echo "Tipos de analise disponiveis: hotspots, advanced-hotspots, general-exploration, concurrency, locksandwaits, bandwidth"
    exit 1
fi

analise=$1
nome_exec=$2
meu_local=$PWD/../src_local
resultado=$PWD/../vtune/mic/$2
COLLECT_DIR=$resultado/$analise/
PROJ_DIR=$PWD
WHICH_MIC_CARD=1
whichcard=1
#echo "0"|sudo tee /proc/sys/kernel/yama/ptrace_scope #MODIFICAR CASO ESTEJA RODANDO HS

#export OMP_NUM_THREADS=16 #MODIFICAR COM O NUMERO DE THREADS
#export KMP_AFFINITY="granularity=thread,proclist=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],explicit" 

COMPILER_LIBS=$TBBROOT/../compiler/lib/mic

COMP_LIBS_SEARCH="--search-dir all:rp=$COMPILER_LIBS"
uOS_SEARCH="--search-dir all:rp=/opt/mpss/3.3/sysroots/k1om-mpss-linux/boot --search-dir all:rp=/opt/mpss/3.3/sysroots/k1om-mpss-linux/lib64"


################################################################################################################################################
# here mic_native.sh has to be an script that uses ssh to run the program natively on MIC.
# the MIC device number (0, 1, ...) is passed as parameter

#if [ "$COLLECT" == "COLLECT_EVENTS" ]; then

# to collect using multiple runs add "-allow-multiple-runs"

 #   amplxe-cl -collect knc-general-exploration $PAUSED $PROFILE_WINDOW -r $COLLECT_DIR -knob target-cards=$WHICH_MIC_CARD -app-working-dir $PROJ_DIR --search-dir all:rp=$PROJ_DIR $COMP_LIBS_SEARCH $uOS_SEARCH -- $PROJ_DIR/mic_native.sh $WHICH_MIC_CARD


#wait
# generate results dir r00*  - this can be delated afterwards
#amplxe-cl -import $COLLECT_DIR/data.0/*.tb6 --search-dir all:rp=$PROJ_DIR $COMP_LIBS_SEARCH $uOS_SEARCH

#wait

# generate .csv report
#amplxe-cl -report hw-events -r $COLLECT_DIR -format=csv -show-as=samples --search-dir all:rp=$PROJ_DIR $COMP_LIBS_SEARCH $uOS_SEARCH -report-output=$COLLECT_DIR/vtune_collection.csv
################################################################################################################################################################################################

#amplxe-cl -collect $analise -result-dir $resultado/$analise/ --start-paused --resume-after 4000 --duration 30 $meu_local/$nome_exec



#amplxe-cl -collect $analise -result-dir $resultado/$analise/ -- $meu_local/$nome_exec
#amplxe-cl -collect-with runsa-knc $PAUSED $PROFILE_WINDOW -r $COLLECT_DIR -target-system=mic-native:$WHICH_MIC_CARD -knob event-config=CPU_CLK_UNHALTED:sa=10000000,INSTRUCTIONS_EXECUTED:sa=10000000,DATA_READ_MISS_OR_WRITE_MISS:sa=1000000,DATA_READ_OR_WRITE:sa=1000000,EXEC_STAGE_CYCLES:sa=10000000,L1_DATA_HIT_INFLIGHT_PF1:sa=50000,DATA_PAGE_WALK:sa=1000000,LONG_DATA_PAGE_WALK:sa=50000,VPU_INSTRUCTIONS_EXECUTED:sa=10000000,VPU_ELEMENTS_ACTIVE:sa=10000000,L2_DATA_READ_MISS_CACHE_FILL:sa=100000,L2_DATA_WRITE_MISS_CACHE_FILL:sa=100000,L2_DATA_READ_MISS_MEM_FILL:sa=100000,L2_DATA_WRITE_MISS_MEM_FILL:sa=100000 --search-dir all:rp=$PROJ_DIR $COMP_LIBS_SEARCH $uOS_SEARCH -- $PROJ_DIR/mic_native.sh $WHICH_MIC_CARD

echo "amplxe-cl -collect $1 -target-system=mic-host-launch:$HOSTNAME-mic$whichcard -r $resultado/$analise --start-paused --resume-after 2000 --duration 4 --search-dir /opt/mpss/3.3/sysroots/k1om-mpss-linux/boot -- /panfs/panfs3/users1/Xdlcost/raphael/execucao/mic_simples_native.sh"
#amplxe-cl -collect $1 -target-system=mic-host-launch:$HOSTNAME-mic$whichcard -r $resultado/$analise --search-dir /opt/mpss/3.3/sysroots/k1om-mpss-linux/boot -- /panfs/panfs3/users1/Xdlcost/raphael/execucao/mic_native.sh 0 $nome_exec

#$PROJ_DIR/mic_native.sh $WHICH_MIC_CARD $meu_local/$nome_exec 
#amplxe-cl -import $COLLECT_DIR/data.0/*.tb6 --search-dir all:rp=$PROJ_DIR $COMP_LIBS_SEARCH $uOS_SEARCH
#amplxe-cl -report hw-events -r $COLLECT_DIR -format=csv -show-as=samples --search-dir all:rp=$PROJ_DIR $COMP_LIBS_SEARCH $uOS_SEARCH -report-output=$COLLECT_DIR/vtune_collection.csv
