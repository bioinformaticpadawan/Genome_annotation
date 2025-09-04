#!/bin/sh
#SBATCH --error err_funannotate_Sacch
#SBATCH --output out_funannotate_Sacch
#SBATCH --job-name funannotate
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
#funannotate clean -i "/data/Food/analysis/R2341_shenab/Final_assemblies_yeasts/polished_Sacch.fasta" -o Sacch_pilon_clean.fasta --minlen 1000 --exhaustive
#drop tiny contigs, rename 
#funannotate sort -i Sacch_pilon_clean.fasta -o Sacch_pilon_clean_sort.fasta -b scaffold --minlen 10
#mask repeats
#funannotate mask -i Sacch_pilon_clean_sort.fasta -o Sacch_pilon_clean_sort_mask.fasta
#predict
mkdir -p "Sacch_S288C"
funannotate predict -i Sacch_pilon_clean_sort_mask.fasta -o "Sacch_S288C" -s "saccharomyces_cerevisiae_S288C" --isolate "59_Y1.5" --cpus 24 --GENEMARK_PATH /data/Food/primary/R2341_shenab/GeneMark-ETP/bin/gmes -d /data/databases_food/funannotate/

conda deactivate
