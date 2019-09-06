#PBS -S /bin/bash
#PBS -N j_spadesLeaf
#PBS -q wallace_q
#PBS -l nodes=1:ppn=8
#PBS -l walltime=240:00:00
#PBS -l mem=90gb

#PBS -M ac32082@uga.edu
#PBS -m ae
#PBS -j oe

cd /scratch/ac32082/RnaSeqTest/SpadesLeaf

module load Anaconda3/5.0.1
source activate snakemake-rnaseq

export LC_ALL=en_SG.utf8
export LANG=en_SG.utf8

snakemake --use-conda --cores 8 -s Snakefile