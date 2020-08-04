import os

# conda environment: hlala

configfile: "hla_config.json"

# Tool paths:
bwa_path = "bwa"
samtools_path = "samtools"

rule all:
    input:
        expand("{sample_name}/hla/R1_bestguess_G.txt", sample_name=config["sample_ids"])

rule run_hlala:
    input:
        os.path.join(config["reprocessed_bams_directory"], "{sample_name}.GRCh38.full.analysis.set.plus.decoy.hla.mkdup.sorted.bam")
    output:
        "{sample_name}/hla/R1_bestguess_G.txt"
    params:
        dir = "{sample_name}"
    shell:
        "PERL5LIB=/home/tphung3/softwares/miniconda3/envs/polysolver/lib/site_perl/5.26.2/ ~/softwares/miniconda3/envs/hlala/bin/HLA-LA.pl --BAM {input} --graph PRG_MHC_GRCh38_withIMGT --sampleID {params.dir} --maxThreads 7"
