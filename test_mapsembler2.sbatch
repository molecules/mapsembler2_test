#!/bin/env bash
#SBATCH -J test_mapsembler2.sbatch
#SBATCH -o test_mapsembler2.sbatch.o_%j
#SBATCH -e test_mapsembler2.sbatch.e_%j
#SBATCH --partition BioCompute
#SBATCH --mem 10G
#SBATCH --cpus-per-task 1
#SBATCH --ntasks 1
#SBATCH --nodes 1
#SBATCH --time 1-0:00:00

# list all loaded modules
module list

run_mapsembler2_pipeline.sh -s input/starters.fa -r input/sample.fq -t 1

md5sum res_coherent_k_31_c_5_t_1.fasta > test_checksum.txt

cd expected
md5sum -c ../test_checksum.txt > ../TEST_RESULT

cd ..

rm res_*
rm index_*
rm starter_extremities.fa
rm test_checksum.txt
