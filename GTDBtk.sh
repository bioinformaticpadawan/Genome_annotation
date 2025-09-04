#!/bin/sh
#SBATCH --error err_GDTBtK
#SBATCH --output out_GTDBtk
#SBATCH --job-name GTDBTK
#SBATCH -p GPU
#SBATCH -N 1
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=ana.sorianolerma@teagasc.ie

module load gtdbtk/2.4.0
source activate gtdbtk-2.4.0


export GTDBTK_DATA_PATH=/data/databases_food/GTDB/release226/

gtdbtk classify_wf --genome_dir /data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/ --out_dir /data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/GTDBtk_pplacer/ --skip_ani_screen -f --pplacer_cpus 1 --cpus 1 --extension .fasta

