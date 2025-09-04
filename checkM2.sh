#!/bin/sh
#SBATCH --error err_checkM2
#SBATCH --output out_checkM2
#SBATCH --job-name checkM2
#SBATCH -p Background,Priority
#SBATCH -N 1
#SBATCH --cpus-per-task=8
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=ana.sorianolerma@teagasc.ie


source activate checkm2

export CHECKM2DB="/data/Food/primary/R2341_shenab/databases/CheckM2_database/uniref100.KO.1.dmnd"


checkm2 predict --threads 10 --input /data/Food/analysis/R2341_shenab/Final_assemblies/*.fasta --output-directory /data/Food/analysis/R2341_shenab/Final_assemblies/checkM 

conda deactivate 
