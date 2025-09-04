#!/bin/sh
#SBATCH --error err_bakta
#SBATCH --output out_bakta
#SBATCH --job-name bakta
#SBATCH -p Background,Priority
#SBATCH -N 1
#SBATCH --cpus-per-task=8
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=ana.sorianolerma@teagasc.ie


conda activate bakta1.9.3


#bakta --db "/data/Food/primary/R2341_shenab/databases/db_bakta/" --verbose --output /data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/bakta/Lrhamnosus --prefix Lrhamnosus --threads 8 "/data/Food/analysis/R2341#_shenab/Final_assemblies_bacteria/Lrhamnosus_final_consensus.fasta" --genus Lacticaseibacillus  --species rhamnosus --strain GG

bakta --db "/data/Food/primary/R2341_shenab/databases/db_bakta/" --verbose --output /data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/bakta/Ccrustorum --prefix Ccrustorum --threads 8 "/data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/Ccrustorum_final_consensus.fasta" --genus Companilactobacillus  --species crustorum --strain isolate_71

bakta --db "/data/Food/primary/R2341_shenab/databases/db_bakta/" --verbose --output /data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/bakta/Lpontis --prefix Lpontis --threads 8 "/data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/Lpontis2_consensus.fasta" --genus Limosilactobacillus  --species pontis --strain isolate_78

bakta --db "/data/Food/primary/R2341_shenab/databases/db_bakta/" --verbose --output /data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/bakta/Lplantarum --prefix Lplantarum --threads 8 "/data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/Lplantarum_consensus.fasta" --genus Lactiplantibacillus  --species plantarum --strain isolate_69

bakta --db "/data/Food/primary/R2341_shenab/databases/db_bakta/" --verbose --output /data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/bakta/Lparacasei --prefix Lparacasei --threads 8 "/data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/Lparacasei_final_consensus.fasta" --genus Lacticaseibacillus --species paracasei --strain isolate_73

bakta --db "/data/Food/primary/R2341_shenab/databases/db_bakta/" --verbose --output /data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/bakta/Lhelveticus --prefix Lhelveticus --threads 8 "/data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/Lhelveticus_final_consensus.fasta" --genus Lactobacillus --species helveticus --strain isolate_85

bakta --db "/data/Food/primary/R2341_shenab/databases/db_bakta/" --verbose --output /data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/bakta/Leuconostoc --prefix Leuconostoc --threads 8 "/data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/Leuconostoc_final_consensus.fasta" --genus Leuconostoc --species lactis --strain isolate_2

bakta --db "/data/Food/primary/R2341_shenab/databases/db_bakta/" --verbose --output /data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/bakta/Bsubtilis --prefix Bsubtilis --threads 8 "/data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/Bsubtilis_final_consensus.fasta" --genus Bacillus --species subtilis --strain isolate_92

bakta --db "/data/Food/primary/R2341_shenab/databases/db_bakta/" --verbose --output /data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/bakta/Aoryzoeni --prefix Aoryzoeni --threads 8 "/data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/Aoryzoeni_final_consensus_chr.fasta" --genus Acetobacter --species oryzoeni --strain isolate_75

bakta --db "/data/Food/primary/R2341_shenab/databases/db_bakta/" --verbose --output /data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/bakta/Aindonesiensis --prefix Aindonesiensis --threads 8 "/data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/Aindonesiensis_final_consensus.fasta" --genus Acetobacter --species indonesiensis --strain isolate_39

bakta --db "/data/Food/primary/R2341_shenab/databases/db_bakta/" --verbose --output /data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/bakta/Pdamnosus --prefix Pdamnosus --threads 8 "/data/Food/analysis/R2341_shenab/Final_assemblies_bacteria/Pdamnosus_final_consensus.fasta" --genus Pediococcus --species damnosus --strain DSM_20331

conda deactivate
