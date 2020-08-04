import os

# In this snakemake file,

# Use neoepitope conda environment
configfile: "neoepitope_config.json"

# Path to packages not in conda
VarScan_path = "external_scripts/VarScan.v2.3.9.jar"
bamreadcount_path = "external_scripts/bam-readcount"
perl_filter_path = "external_scripts/fpfilter-2.pl"
vep_path = "external_scripts/ensembl-tools-release-86/scripts/variant_effect_predictor/variant_effect_predictor.pl"
plugin_path = "/home/tphung3/.vep/Plugins"
perl5lib_path = "/home/tphung3/softwares/miniconda3/envs/epitopepipeline/lib/site_perl/5.26.2/"

rule all:
    input:
        expand("intermediate_files/{sample}.VarScan.indel.Somatic.hc.noheader.vep.vcf", sample=config["tumor_ids"])

rule isolate_indel_calls_by_type_and_confidence:
    input:
        VarScan_indel = "intermediate_files/{sample}.VarScan.indel"
    output:
        VarScan_indel = "intermediate_files/{sample}.VarScan.indel.Somatic.hc"
    params:
        VarScan = VarScan_path
    shell:
        """
        java -jar {params.VarScan} processSomatic {input.VarScan_indel}
        """

rule convert_to_vcf_indel:
    input:
        "intermediate_files/{sample}.VarScan.indel.Somatic.hc"
    output:
        "intermediate_files/{sample}.VarScan.indel.Somatic.hc.vcf"
    shell:
        """
        python external_scripts/VarScan2_format_converter.py {input} > {output}
        """

rule rm_header_from_vcf_indel:
    input:
        "intermediate_files/{sample}.VarScan.indel.Somatic.hc.vcf"
    output:
        "intermediate_files/{sample}.VarScan.indel.Somatic.hc.noheader.vcf"
    shell:
        """
        egrep -v "^#" {input} > {output}
        """

rule run_vep_indel:
    input:
        "intermediate_files/{sample}.VarScan.indel.Somatic.hc.noheader.vcf"
    output:
        "intermediate_files/{sample}.VarScan.indel.Somatic.hc.noheader.vep.vcf"
    params:
        vep = vep_path,
        plugins = plugin_path,
        perl5lib = perl5lib_path
    shell:
        """
        PERL5LIB={params.perl5lib} perl {params.vep} -i {input} --format vcf --cache --assembly GRCh38 --offline --vcf -o {output}  --force_overwrite --plugin Wildtype --dir_plugins {params.plugins} --symbol --terms SO --plugin Downstream
        """
