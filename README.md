# LynchSyndrome

This repository contains scripts for the article: *Unique genomic and neoepitope landscapes across tumors: a study across time, tissues, and space within a single lynch syndrome patient* (Phung et al. Scientific Reports 2020)
Link: https://www.nature.com/articles/s41598-020-68939-7

## 01_strip_remap
- We ontained the bam files from Mayo. Since the data from Mayo are in bam format and were mapped to different reference genome, we stripped the reads and remapped to GRCh38.
- For reference genome, we used 1000 Genome version of GRCh38 (ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/reference/GRCh38_reference_genome/)
- Config file: `strip_remap_config.json`
- Snakefile for stripping reads and remapping: `strip_remap.snakefile`

## 02_neoepitope
- Run the neoepitope pipeline
- Config file: `neoepitope_config.json`
- Snakefile for running the neoepitope pipeline: `neoepitope.snakefile`
- Snakefile for filtering indels: `filter_indels.snakefile`

## 03_hla
- HLA typing using the program HLA-LA (https://github.com/DiltheyLab/HLA-LA)
- Config file: `hla_config.json`
- Snakefile for HLA-typing: `hla.snakefile`

## 04_run_mhc
- Calculate binding affinity using the IEDB program
- Config file: `run_mhc_config.json`
- Snakefile: `run_mhc.snakefile`

## 05_find_neoepitopes
- Filtering to obtain potential neoepitopes
- Config file: `find_neoepitopes_config.json`
- Snakefile: `find_neoepitopes.snakefile`

## 06_neoepitope_landscape

## 07_mutation_landscape
