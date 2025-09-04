#!/bin/sh
#SBATCH --error err_predict_Pichia
#SBATCH --output out_predict_Pichia
#SBATCH --job-name Predict_pichia
#SBATCH --mail-user ana.sorianolerma@teagasc.ie
#SBATCH --mail-type END,FAIL
#SBATCH -p Priority,Background
#SBATCH -N 1
#SBATCH --cpus-per-task=24

source activate funannotate-1.8.17
#VARIABLES - export after activation of conda env
export FUNANNOTATE_DB=/data/databases_food/funannotate/
export EGGNOG_DB=/data/databases/eggnog_mapper_2.1.7/

#funannotate "clean" - remove duplicated contigs (Mummer) - avoid if suspect polyploid yeast
funannotate clean -i "/data/Food/analysis/R2341_shenab/Final_assemblies_yeasts/polished_Pichia.fasta" -o Pichia_pilon_clean.fasta --minlen 1000 --exhaustive
#drop tiny contigs, rename 
funannotate sort -i Pichia_pilon_clean.fasta -o Pichia_pilon_clean_sort.fasta -b scaffold --minlen 10
#mask repeats
funannotate mask -i Pichia_pilon_clean_sort.fasta -o Pichia_pilon_clean_sort_mask.fasta
#predict
mkdir -p "Pichia"
funannotate predict -i Pichia_pilon_clean_sort_mask.fasta -o "Pichia" -s "pichia_stipitis" --isolate "isolate_41" --cpus 24 --GENEMARK_PATH /data/Food/primary/R2341_shenab/GeneMark-ETP/bin/gmes -d /data/databases_food/funannotate/
conda deactivate
