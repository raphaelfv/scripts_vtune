#!/bin/sh

if [ $# -ne 2 ]
  then
    echo "Uso do programa: $0 numero_mic_card nome_arquivo_saida"
    echo "Salva o output no arquivo nome_arquivo_saida.txt"
    exit 1
fi


while : ; do
  # Build the Timestamp string
    STR=`echo $(date +%N) | sed 's/^0*//'`
    STR=`printf "%03d" $(($STR/1000000))`
    STR=`echo $(date +%H:%M:%S)"."$STR`
    TIME="Timestamp: $STR"
    
    # Format the power and thermal data string as desired
    #DATA="$({ micsmc -f mic$1; micsmc -t mic$1; sleep .1; } | grep -e Cpu -e temp -e Total -e freq | paste -d ' ' - -  | awk '{print $1,$4,"\n",$6,$7 }')"
    power="$( micsmc -f mic$1 | grep Total )"
    power=${power:30:6}
    cputemp="$( micsmc -t mic$1 | grep Cpu )"
    cputemp=${cputemp:30:5}
    echo "$STR,$power,$cputemp"
    echo "$STR,$power,$cputemp" >> $2.txt #time,power(Watts),temperature(deg Celsius) csv
    sleep .1
    clear

done
