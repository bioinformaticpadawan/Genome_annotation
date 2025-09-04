#!/bin/sh
#SBATCH --error err_Brett_ann
#SBATCH --output out_Brett_ann
#SBATCH --job-name Brett_annotation
#SBATCH --mail-user ana.sorianolerma@teagasc.ie
#SBATCH --mail-type END,FAIL
#SBATCH -p Priority,Background
#SBATCH -N 1
#SBATCH --cpus-per-task=24

source activate funannotate-1.8.17
#VARIABLES - export after activation of conda env
export FUNANNOTATE_DB=/data/databases_food/funannotate/
export EGGNOG_DB=/data/databases/eggnog_mapper_2.1.7/
#run eggnog mapper separately
module load eggnog-mapper/2.1.12
emapper.py -i "/data/Food/analysis/R2341_shenab/Annotation_yeasts/Brett/predict_results/pichia_stipitis_Sam.proteins.fa" --data_dir "$EGGNOG_DB" --sensmode fast  -o emap_Brett --cpu 24
module unload eggnog-mapper/2.1.12

module load interproscan/5.68-100.0
funannotate iprscan -i "/data/Food/analysis/R2341_shenab/Annotation_yeasts/Brett/predict_results/pichia_stipitis_Sam.proteins.fa" -m local -o Brett_interpro --iprscan_path /install/software/2024/base/interproscan-5.68-100.0/interproscan.sh -c 24
module unload interproscan/5.68-100.0

#funannotate annotate
funannotate annotate -i /data/Food/analysis/R2341_shenab/Annotation_yeasts/Brett/predict_results/ --eggnog emap_Brett.emapper.annotations --iprscan Brett_interpro --isolate "Samuel" --cpus 24
conda deactivate
