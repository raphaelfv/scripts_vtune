#bin/bash
nome_exec=mod_tti_cpml3D_vs08_1toque
nome_pasta=tti3d
#if [ $# -ne 1 ]
#  then
    echo "Uso do programa: $0"
    echo "Procura o arquivo $nome_exec na pasta src_local/$nome_pasta e gera o executavel ${nome_exec}_$nome_pasta em src_local"
#    exit 1
#fi
#clear

meu_local=$PWD/../src_local
sub=$meu_local/$nome_pasta
main=$sub/$nome_exec.f90 
objp=$meu_local/$nome_exec.o
exe=$meu_local/${nome_exec}_$nome_pasta
  
                          
flagm="-module ./"
flag="-ipo -O3 -xAVX -qopenmp-simd -align array64byte -opt-assume-safe-padding -g"
flagsonp="-qopenmp"
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
echo "===================compilacao terminou============="
exit 
