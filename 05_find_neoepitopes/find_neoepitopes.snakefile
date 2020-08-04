import os

configfile: "find_neoepitopes_config.json"

rule all:
    input: #tabulate_neoepitopes
        expand(os.path.join(config["IEDB_output_dir"], "{sample_name}", "IEDB_out", "{hla_type}", "tabulate_num_neoepitopes.txt"), sample_name=config["sample_ids"], hla_type=config["hla_types"])
    input: #filter_neoepitopes
        expand(os.path.join(config["IEDB_output_dir"], "{sample_name}", "IEDB_out", "{hla_type}", "output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered_comparewithWT.txt"), sample_name=config["sample_ids"], hla_type=config["hla_types"])
    input: #find_neoepitopes_lowest_iedb_score
        expand(os.path.join(config["IEDB_output_dir"], "{sample_name}", "IEDB_out", "{hla_type}", "output_IEDB.15.17.19.21_WT_minscore_minpeptide.txt"), sample_name=config["sample_ids"], hla_type=config["hla_types"])

rule find_neoepitopes_lowest_iedb_score:
    input:
    output:
        os.path.join(config["IEDB_output_dir"], "{sample_name}", "IEDB_out", "{hla_type}", "output_IEDB.15.17.19.21_WT_minscore_minpeptide.txt")
    params:
        script = config["find_neoepitopes_lowest_iedb_score_script"],
        IEDB_output_dir = config["IEDB_output_dir"],
        patientID = "{sample_name}",
        hla_type = "{hla_type}"
    shell:
        """
        python {params.script} --IEDB_output_dir {params.IEDB_output_dir} --patientID {params.patientID} --hla_type {params.hla_type}
        """

rule filter_neoepitopes:
    input:
    output:
        os.path.join(config["IEDB_output_dir"], "{sample_name}", "IEDB_out", "{hla_type}", "output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered_comparewithWT.txt")
    params:
        script = config["filter_neoepitopes_script"],
        IEDB_output_dir = config["IEDB_output_dir"],
        patientID = "{sample_name}",
        hla_type = "{hla_type}"
    shell:
        """
        python {params.script} --IEDB_output_dir {params.IEDB_output_dir} --patientID {params.patientID} --hla_type {params.hla_type}
        """

rule tabulate_neoepitopes:
    input:
    output:
        os.path.join(config["IEDB_output_dir"], "{sample_name}", "IEDB_out", "{hla_type}", "tabulate_num_neoepitopes.txt")
    params:
        script = config["tabulate_neoepitopes_script"],
        IEDB_output_dir = config["IEDB_output_dir"],
        patientID = "{sample_name}",
        hla_type = "{hla_type}"
    shell:
        """
        python {params.script} --IEDB_output_dir {params.IEDB_output_dir} --patientID {params.patientID} --hla_type {params.hla_type}
        """
