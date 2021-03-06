#bin/bash
if [ $# -ne 2 ]
  then
    echo "Uso do programa: $0 <nome_pasta> <nome_fonte>"
    echo "Procura o arquivo <nome_fonte>.f90 na pasta codigos/<nome_pasta> e gera o executavel <nome_fonte>_<nome_pasta> em codigos"
    exit 1
fi
clear

nome_pasta=$1
nome_exec=$2

echo "Procura o arquivo $nome_exec.f90 na pasta codigos/$nome_pasta e gera o executavel ${nome_exec}_$nome_pasta em codigos"

meu_local=$PWD/../codigos
sub=$meu_local/$nome_pasta
main=$sub/$nome_exec.f90 
objp=$meu_local/$nome_exec.o
exe=$meu_local/${nome_exec}
  
                          
flagm="-module ./"
flag="-ipo -O3 -xAVX -align array64byte -opt-assume-safe-padding -g" #nacad
#flag="-ipo -O3 -xAVX -align array64byte -opt-assume-safe-padding -g" #local
flagsonp="-openmp -openmp-simd"
ifort=ifort
# /opt/intel/composer_xe_2013_sp1.2.144/bin/intel64/ifort
ulimit -s unlimited 
rm -f $exe
 
set -x
$ifort $flag $flagm $flagsonp -o $exe $main 
#ifort -ipo -O3 -xAVX -qopenmp-simd -align array64byte -opt-assume-safe-padding -g -module ./ -qopenmp -o mod_tti_cpml3D_vs08 ./mod_tti_cpml3D_vs08.f90
set +x

cd $meu_local
rm *.o
rm *.mod
echo "===================compilacao terminou==================="

export OMP_NUM_THREADS=16 #MODIFICAR COM O NUMERO DE THREADS
export KMP_AFFINITY="granularity=thread,proclist=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],explicit"
time $exe
exit 
