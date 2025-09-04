#!/bin/sh
#SBATCH --error err_quast
#SBATCH --output out_quast
#SBATCH --job-name quast_Brett
#SBATCH -p Background,Priority
#SBATCH -N 1
#SBATCH --cpus-per-task=10
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=ana.sorianolerma@teagasc.ie

module load quast/5.2.0
quast.py \
  /data/Food/analysis/R2341_shenab/Brettanomyces_assembly/QUAST/assembly_uni.fasta \
  /data/Food/analysis/R2341_shenab/Brettanomyces_assembly/QUAST/assembly_flye.fasta \
  --nanopore /data/Food/analysis/R2341_shenab/Brettanomyces_assembly/Brettanomyces_filtered.fastq \
  -o /data/Food/analysis/R2341_shenab/Brettanomyces_assembly/QUAST/
module unload quast/5.2.0
