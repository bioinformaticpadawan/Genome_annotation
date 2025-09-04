#!/bin/sh
#SBATCH --error err_BUSCO
#SBATCH --output out_BUSCO
#SBATCH --job-name BUSCO
#SBATCH -p Background,Priority
#SBATCH -N 1
#SBATCH --cpus-per-task=10
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=ana.sorianolerma@teagasc.ie


# Submit from folder where you want the output to be saved, BUSCO will create a new folder named as you indicate in --out
# Choose of lineage according to what I used in the non-polished genomes to be able to compare
source activate busco5.3.2

busco -i "/data/Food/analysis/R2341_shenab/Final_assemblies_yeasts/polished_Pichia.fasta" -m genome -l pichiaceae_odb12 -c 10 --out BUSCO_Pichia 

busco -i "/data/Food/analysis/R2341_shenab/Final_assemblies_yeasts/polished_Kluy.fasta" -m genome -l saccharomycetaceae_odb12 -c 10 -o BUSCO_Kluy

busco -i "/data/Food/analysis/R2341_shenab/Final_assemblies_yeasts/Brett_consensus.fasta" -m genome -l saccharomycetes_odb12 -c 10 -o BUSCO_Brett2

busco -i "/data/Food/analysis/R2341_shenab/Final_assemblies_yeasts/polished_Sacch.fasta" -m genome -l saccharomycetes_odb12  -c 10 -o BUSCO_Sacch2


conda deactivate
