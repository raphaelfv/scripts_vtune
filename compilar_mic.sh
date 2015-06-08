#bi/bash
if [ $# -ne 2 ]
  then
    echo "Uso do programa: $0 <nome_pasta> <nome_fonte>"
    echo "Procura o arquivo <nome_fonte>.f90 na pasta src_local/<nome_pasta> e gera o executavel <nome_fonte_<nome_pasta> em src_local"
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
exe=$meu_local/${nome_exec}_$nome_pasta
  
                          
flagm="-module ./"
flag="-O3 -mmic -opt-assume-safe-padding -g"
#flag="-ipo -O3 -xAVX -align array64byte -opt-assume-safe-padding -g"
flagsonp="-openmp -openmp-simd"
ifort=ifort
# /opt/intel/composer_xe_2013_sp1.2.144/bin/intel64/ifort
ulimit -s unlimited 
rm -f $exe
 
set -x
$ifort $flag $flagm $flagsonp -o $exe $main 
#ifort -ipo -O3 -xAVX -qopenmp-simd -align array64byte -opt-assume-safe-padding -g -module ./ -qopenmp -o mod_tti_cpml3D_vs08 ./mod_tti_cpml3D_vs08.f90
set +x

#cd $meu_local
#rm *.o
#rm *.mod
echo "===================compilacao terminou==================="

set -x
time ./mic_native.sh $whichcard ${nome_exec}_$nome_pasta
set +x
exit 
