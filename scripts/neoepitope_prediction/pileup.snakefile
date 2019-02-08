# This is a snakemake pipeline to do the pileup step for 6 bam files for Lynch syndrome data set.
# The reason why I'm running the pileup step separately here is because while there are 5 tumor files, there is only 1 normal file. So it is faster to run these files in parallel.

# Setting up filesnames here:
file_names = ["MIL582_A2_NL.FCHK5NFBBXX_L1_IATTACTCG-TATAGCCT", "MIL582_B1-AN_P4.FCHK5NFBBXX_L1_ITCCGGAGA-ATAGAGGC", "MIL582_B5-AN_P4.FCHK5NFBBXX_L1_ICGCTCATT-CCTATCCT", "MIL582_B6-AN_P4.FCHK5NFBBXX_L1_IGAGATTCC-GGCTCTGA", "MIL582_CRC-Q_P4.FCHN5MNBBXX_L4_IACCTCCAA", "MIL582_Renal_P4.FCHLFV7BBXX_L2"]

SAMPLES = ["MIL582_A2_NL", "MIL582_B1-AN_P4", "MIL582_B5-AN_P4", "MIL582_B6-AN_P4", "MIL582_CRC-Q_P4", "MIL582_Renal_P4"]

# path to where bams are
bams_path = "/home/tphung3/mike_barret_data"

rule all:
    # input:
    #     expand("bams/{sample}.bam", sample=SAMPLES)
    input:
        expand("pileups/{sample}.pileup", sample=SAMPLES)

rule mk_symlink_for_bam:
    # params:
    #     bams_loc = bams_path
    input:
        expand("/home/tphung3/mike_barret_data/{file_name}.bam", zip, file_name=file_names)
    output:
        expand("bams/{sample}.bam", sample=SAMPLES)
    run:
        for i in range(0,len(file_names)):
            bam = input[i]
            bam_symlink = output[i]

            shell("ln -s {bam} {bam_symlink}")

rule bam_pileup:
    input:
        fa = "fasta/ucsc.hg19.fasta",
        bam = "bams/{sample}.bam"
    output:
        pileup = "pileups/{sample}.pileup"
    threads: 4
    shell:
        """
        samtools mpileup -f {input.fa} {input.bam} > {output.pileup}
        """
