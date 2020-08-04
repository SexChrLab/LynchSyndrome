import os

# Use conda environment 2019July_cayo
# This snakefile extracts read groups from the bam file
configfile: "strip_remap_config.json"

rule all:
    input:
        expand("read_groups/{sample}_RG.txt", sample=config["new_ids"])

rule extract_readgroups_dna:
    input:
        BAM = "bams/{sample}.bam"
    output:
        "read_groups/{sample}_RG.txt"
    shell:
        """
        samtools view -H {input.BAM} | grep "^@RG" > {output}
        """
