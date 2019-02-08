#!/bin/bash
#SBATCH --job-name=pileup  # Job name
#SBATCH --mail-type=END,FAIL           # notifications for job done & fail
#SBATCH --mail-user=tphung3@asu.edu # send-to address
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -t 48:00:00
module load python/3.5.1
snakemake --snakefile pileup.snakefile -j 6 --cluster "sbatch --mem=24000 -c 4 -t 48:00:00"
