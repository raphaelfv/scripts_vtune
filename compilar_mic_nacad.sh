#bin/bash
if [ $# -ne 2 ]
  then
    echo "Uso do programa: $0 <nome_pasta> <nome_fonte>"
    echo "Procura o arquivo <nome_fonte>.f90 na pasta src_local/<nome_pasta> e gera o executavel <nome_fonte>exec_<nome_pasta> em src_local"
    exit 1
fi
clear

whichcard=0
nome_pasta=$1
nome_exec=$2
export COMPILER_ROOT=$TBBROOT/../compiler

echo "Procura o arquivo $nome_exec.f90 na pasta src_local/$nome_pasta e gera o executavel ${nome_exec}_$nome_pasta em src_local"

meu_local=$PWD/../src_local
sub=$meu_local/$nome_pasta
main=$sub/$nome_exec.f90 
objp=$meu_local/$nome_exec.o
  
                          
#lagm="-module ./"
flag="-O3 -mmic -opt-assume-safe-padding -align array64byte -vec-report=6 -g"
#flag="-ipo -O3 -xAVX -align array64byte -opt-assume-safe-padding -g -vec-report=6"
flagsonp="-openmp -openmp-simd"
ifort=ifort
# /opt/intel/composer_xe_2013_sp1.2.144/bin/intel64/ifort
ulimit -s unlimited 
rm -f $nome_exec

set -x
$ifort $flag $flagm $flagsonp -o $nome_exec $main 
#ifort -ipo -O3 -xAVX -qopenmp-simd -align array64byte -opt-assume-safe-padding -g -module ./ -qopenmp -o mod_tti_cpml3D_vs08 ./mod_tti_cpml3D_vs08.f90
set +x

#cd $meu_local
#rm *.o
#rm *.mod
echo "===================compilacao terminou==================="

time ./mic_native_nacad.sh $whichcard $nome_exec
exit 
