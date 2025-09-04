#!/bin/sh
#SBATCH --error err_funannotate
#SBATCH --output out_funannotate
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
funannotate clean -i "/data/Food/analysis/R2341_shenab/Final_assemblies_yeasts/polished_Kluy.fasta" -o Kluy_pilon_clean.fasta --minlen 1000 --exhaustive
#drop tiny contigs, rename 
funannotate sort -i Kluy_pilon_clean.fasta -o Kluy_pilon_clean_sort.fasta -b scaffold --minlen 10
#mask repeats
funannotate mask -i Kluy_pilon_clean_sort.fasta -o Kluy_pilon_clean_sort_mask.fasta
#predict
mkdir -p "Kluy"
funannotate predict -i Kluy_pilon_clean_sort_mask.fasta -o "Kluy" -s "kluyveromyces_lactis" --isolate "isolate_42" --cpus 24 --GENEMARK_PATH /data/Food/primary/R2341_shenab/GeneMark-ETP/bin/gmes -d /data/databases_food/funannotate/

conda deactivate
