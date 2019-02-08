#!/bin/bash
#SBATCH --job-name=peptides  # Job name
#SBATCH --mail-type=END,FAIL           # notifications for job done & fail
#SBATCH --mail-user=tphung3@asu.edu # send-to address
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -t 48:00:00
module load python/3.5.1
snakemake --snakefile generate_peptides_B1.snakefile -j 1 --cluster "sbatch --mem=24000 -c 4 -t 32:00:00"
snakemake --snakefile generate_peptides_B5.snakefile -j 1 --cluster "sbatch --mem=24000 -c 4 -t 32:00:00"
snakemake --snakefile generate_peptides_B6.snakefile -j 1 --cluster "sbatch --mem=24000 -c 4 -t 32:00:00"
snakemake --snakefile generate_peptides_CRC.snakefile -j 1 --cluster "sbatch --mem=24000 -c 4 -t 32:00:00"
snakemake --snakefile generate_peptides_Renal.snakefile -j 1 --cluster "sbatch --mem=24000 -c 4 -t 32:00:00"
