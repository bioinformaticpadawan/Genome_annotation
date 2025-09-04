#!/bin/sh
#SBATCH --error err_Pichia_training
#SBATCH --output out_Pichia_training
#SBATCH --job-name Pichia_training
#SBATCH --mail-user ana.sorianolerma@teagasc.ie
#SBATCH --mail-type END,FAIL
#SBATCH -p Priority,Background
#SBATCH -N 1
#SBATCH --cpus-per-task=24

source activate funannotate-1.8.17
#VARIABLES - export after activation of conda env
export FUNANNOTATE_DB=/data/databases_food/funannotate/
export EGGNOG_DB=/data/databases/eggnog_mapper_2.1.7/
i=Pichia
#need iso to be all lower case
iso=isolate_41
#mkdir -p Pichia_training
#cd Pichia_training

#funannotate "clean" - remove duplicated contigs (Mummer) - avoid if suspect polyploid yeast
#funannotate clean -i "$i"_pilon.fasta -o "$i"_pilon_clean.fasta --minlen 1000 --exhaustive
#drop tiny contigs, rename 
#funannotate sort -i "$i"_pilon_clean.fasta -o "$i"_pilon_clean_sort.fasta -b scaffold --minlen 10
#mask repeats
#funannotate mask -i "$i"_pilon_clean_sort.fasta -o "$i"_pilon_clean_sort_mask.fasta

#train using m_pulcherrima model
#funannotate train -i "/data/Food/analysis/R2341_shenab/Annotation_yeasts/Pichia_pilon_clean_sort_mask.fasta" -o funannotate_train -s "/data/Food/primary/R2341_shenab/NCBI_genomes/p_kudriavzevii/SRR6966973.fastq" --species "Pichia kudriavzevii" --isolate "$iso" --trinity "/data/Food/primary/R2341_shenab/NCBI_genomes/p_kudriavzevii/SRR6966973.Trinity.fasta"
#predict proteins
#funannotate predict -i "/data/Food/analysis/R2341_shenab/Annotation_yeasts/Pichia_pilon_clean_sort_mask.fasta" -o funannotate_train -s "Pichia kudriavzevii" --isolate "$iso" --cpus 24 --GENEMARK_PATH /data/Food/primary/R2341_shenab/GeneMark-ETP/bin/gmes -d /data/databases_food/funannotate/
#add species parameters to database
#funannotate species -s Pichia_kudriatxevii -a "/data/Food/analysis/R2341_shenab/Annotation_yeasts/Pichia_training/funannotate_train/predict_results/pichia_kudriavzevii_isolate_41.parameters.json" -d /data/databases_food/funannotate/ 

#annotation 
#run eggnog mapper separately
module load eggnog-mapper/2.1.12
emapper.py -i "/data/Food/analysis/R2341_shenab/Annotation_yeasts/Pichia_training/funannotate_train/predict_results/Pichia_kudriavzevii_isolate_41.proteins.fa" --data_dir "$EGGNOG_DB" --sensmode fast  -o emap_Pichia --cpu 24
module unload eggnog-mapper/2.1.12
#run interproscan separately
module load interproscan/5.68-100.0
funannotate iprscan -i "/data/Food/analysis/R2341_shenab/Annotation_yeasts/Pichia_training/funannotate_train/predict_results/Pichia_kudriavzevii_isolate_41.proteins.fa" -m local -o Pichia_interpro --iprscan_path /install/software/2024/base/interproscan-5.68-100.0/interproscan.sh -c 24
module unload interproscan/5.68-100.0
#funannotate annotate
funannotate annotate -i "/data/Food/analysis/R2341_shenab/Annotation_yeasts/Pichia_training/funannotate_train/predict_results/" --eggnog emap_Pichia.emapper.annotations --iprscan Pichia_interpro --isolate "$iso" --cpus 24


conda deactivate
