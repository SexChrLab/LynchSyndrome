import os

configfile: "strip_remap_config.json"

rule all:
    # Date: 02/03/2020
    # strip reads and map to ucsc hg19 for colorectal_1 but remove the samblaster step
    input: #sort and index
        "/data/kander22/LynchSyndrome/01_strip_remap/processed_bams/colorectal_1.ucsc.hg19.sorted.bam.bai"
    input: #map with bwa without marking dups
        expand("processed_bams/{sample}.ucsc.hg19.bam", sample=config["rerun_colorectal_1"])
    input: #strip reads
        expand("strip_reads/{sample}/{sample}_xyalign.log", sample=config["rerun_colorectal_1"])
    # End date 02/03/2020
    input: #map to ucsc hg19 (from Pooja)
        expand("processed_bams/{sample}.ucsc.hg19.mkdup.sorted.bam", sample=config["new_ids"])
    input: #map to GRCh38_full_analysis_set_plus_decoy_hla.fa
        expand("processed_bams/{sample}.GRCh38.full.analysis.set.plus.decoy.hla.mkdup.sorted.bam", sample=config["new_ids"])
    input: #strip reads from orginal bam
        expand("strip_reads/{sample}/{sample}_xyalign.log", sample=config["new_ids"])
    input: #Make symlink for bam files
        expand("bams/{sample}.bam", sample=config["new_ids"])


rule mk_sy_ln_for_bams:
    input:
        lambda wildcards: os.path.join(config["bams_directory"], config[wildcards.sample]["bam_filename"])
    output:
        "bams/{sample}.bam"
    shell:
        """
        ln -s {input} {output}
        """

rule strip_reads:
    input:
        BAM = "bams/{sample}.bam"
    output:
        LOG = "strip_reads/{sample}/{sample}_xyalign.log"
    conda:
        "/scratch/tphung3/Cayo_x_inactivation/envs/xyalign.yml"
    params:
        DIR = "strip_reads/{sample}",
        SAMPLE_ID = "{sample}",
        cpus="4",
        xmx="4g",
        compression="3"
    shell:
        "xyalign --STRIP_READS --ref null --bam {input.BAM} --cpus {params.cpus} --xmx {params.xmx} --sample_id {params.SAMPLE_ID} --output_dir {params.DIR} --chromosomes ALL"

# 1000G version of GRCh38
rule map_and_process_stripped_reads:
    input:
        fq_1 = lambda wildcards: os.path.join(config[wildcards.sample]["fq_path"], config[wildcards.sample]["fq_1"]),
        fq_2 = lambda wildcards: os.path.join(config[wildcards.sample]["fq_path"], config[wildcards.sample]["fq_2"]),
        fai = config["ref_index"],
        ref = config["ref"]
    output:
        "processed_bams/{sample}.GRCh38.full.analysis.set.plus.decoy.hla.mkdup.sorted.bam"
    params:
        id = lambda wildcards: config[wildcards.sample]["ID"],
        sm = lambda wildcards: config[wildcards.sample]["SM"],
        lb = lambda wildcards: config[wildcards.sample]["LB"],
        pu = lambda wildcards: config[wildcards.sample]["PU"],
        pl = lambda wildcards: config[wildcards.sample]["PL"]
    threads:
        4
    shell:
        "bwa mem -t {threads} -R "
        "'@RG\\tID:{params.id}\\tSM:{params.sm}\\tLB:{params.lb}\\tPU:{params.pu}\\tPL:{params.pl}' "
        "{input.ref} {input.fq_1} {input.fq_2} "
        "| samblaster "
        "| samtools fixmate -O bam - - | samtools sort "
        "-O bam -o {output}"
