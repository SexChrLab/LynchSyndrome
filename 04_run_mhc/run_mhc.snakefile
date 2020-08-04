import os

configfile: "run_mhc_config.json"

rule all:
    input: #run_mhc
        expand("{sample_name}/IEDB_out/hla_a_1/output_IEDB.15.txt", sample_name=config["sample_ids"]),
        expand("{sample_name}/IEDB_out/hla_b_1/output_IEDB.15.txt", sample_name=config["sample_ids"]),
        expand("{sample_name}/IEDB_out/hla_b_2/output_IEDB.15.txt", sample_name=config["sample_ids"]),
        expand("{sample_name}/IEDB_out/hla_c_1/output_IEDB.15.txt", sample_name=config["sample_ids"]),
        expand("{sample_name}/IEDB_out/hla_c_2/output_IEDB.15.txt", sample_name=config["sample_ids"])
        
    input: #remove bad peptides
        expand("{sample_name}/peptides/{sample_name}.{len}_rmbadpeptides.txt", sample_name=config["sample_ids"], len=config["peptide_length"])

    input: #configuration
        expand(os.path.join("{sample_name}", "peptides", "{sample_name}" + ".15.txt"), sample_name=config["sample_ids"])

rule configuration:
    input:
    output:
        os.path.join("{sample_name}", "peptides", "{sample_name}" + ".15.txt")
    params:
        script = config["configuration_script"],
        directory_to_create = "{sample_name}",
        peptides_directory = config["peptides_directory"],
        patientID = "{sample_name}"
    shell:
        """
        python {params.script} --directory {params.directory_to_create} --peptides_directory {params.peptides_directory} --patientID {params.patientID}
        """

rule remove_bad_peptides:
    input:
        "{sample_name}/peptides/{sample_name}.{len}.txt"
    output:
        new_peptides_file = "{sample_name}/peptides/{sample_name}.{len}_rmbadpeptides.txt",
        log_file = "{sample_name}/peptides/{sample_name}.{len}_rmbadpeptides.log"
    params:
        script = config["remove_bad_peptides_script"]
    shell:
        """
        python {params.script} --peptide_filename {input} --out_filename {output.new_peptides_file} --log_filename {output.log_file}
        """

rule run_mhc:
    input:
        hla_a_1 = os.path.join("{sample_name}", "hla", "hla_a_24_02_01.txt"),
        hla_b_1 = os.path.join("{sample_name}", "hla", "hla_b_38_01_01.txt"),
        hla_b_2 = os.path.join("{sample_name}", "hla", "hla_b_27_05_02.txt"),
        hla_c_1 = os.path.join("{sample_name}", "hla", "hla_c_12_03_01.txt"),
        hla_c_2 = os.path.join("{sample_name}", "hla", "hla_c_07_04_01.txt")
    output:
        "{sample_name}/IEDB_out/hla_a_1/output_IEDB.15.txt",
        "{sample_name}/IEDB_out/hla_b_1/output_IEDB.15.txt",
        "{sample_name}/IEDB_out/hla_b_2/output_IEDB.15.txt",
        "{sample_name}/IEDB_out/hla_c_1/output_IEDB.15.txt",
        "{sample_name}/IEDB_out/hla_c_2/output_IEDB.15.txt"
    conda:
        "envs/py27.yml"
    params:
        script = config["run_mhc_script"],
        id = "{sample_name}",
        hla_a_1 = "hla_a_1",
        hla_b_1 = "hla_b_1",
        hla_b_2 = "hla_b_2",
        hla_c_1 = "hla_c_1",
        hla_c_2 = "hla_c_2"
    shell:
        """
        python {params.script} --hla {input.hla_a_1} --patientID {params.id} --hla_type {params.hla_a_1}
        python {params.script} --hla {input.hla_b_1} --patientID {params.id} --hla_type {params.hla_b_1}
        python {params.script} --hla {input.hla_b_2} --patientID {params.id} --hla_type {params.hla_b_2}
        python {params.script} --hla {input.hla_c_1} --patientID {params.id} --hla_type {params.hla_c_1}
        python {params.script} --hla {input.hla_c_2} --patientID {params.id} --hla_type {params.hla_c_2}
        """
