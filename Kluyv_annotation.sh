#!/bin/sh
#SBATCH --error err_Kluyann
#SBATCH --output out_Kluyann
#SBATCH --job-name Kluy_annotation
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
emapper.py -i "/data/Food/analysis/R2341_shenab/Annotation_yeasts/Kluy/predict_results/kluyveromyces_lactis_isolate_42.proteins.fa" --data_dir "$EGGNOG_DB" --sensmode fast  -o emap_Kluy --cpu 24
module unload eggnog-mapper/2.1.12

module load interproscan/5.68-100.0
funannotate iprscan -i "/data/Food/analysis/R2341_shenab/Annotation_yeasts/Kluy/predict_results/kluyveromyces_lactis_isolate_42.proteins.fa" -m local -o Kluy_interpro --iprscan_path /install/software/2024/base/interproscan-5.68-100.0/interproscan.sh -c 24
module unload interproscan/5.68-100.0

#funannotate annotate
funannotate annotate -i /data/Food/analysis/R2341_shenab/Annotation_yeasts/Kluy/predict_results/ --eggnog emap_Kluy.emapper.annotations --iprscan Kluy_interpro --isolate "isolate_42" --cpus 24
conda deactivate
