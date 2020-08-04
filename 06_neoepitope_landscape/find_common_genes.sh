#!/bin/bash

python find_common_genes.py ../04_run_mhc/renal/IEDB_out/hla_a_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt ../04_run_mhc/all_colorectal/hlaa1_union_genes_scorefiltered.txt ../04_run_mhc/all_breast_biopsies/hlaa1_union_genes_scorefiltered.txt

python find_common_genes.py ../04_run_mhc/renal/IEDB_out/hla_b_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt ../04_run_mhc/all_colorectal/hlab1_union_genes_scorefiltered.txt ../04_run_mhc/all_breast_biopsies/hlab1_union_genes_scorefiltered.txt

python find_common_genes.py ../04_run_mhc/renal/IEDB_out/hla_b_2/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt ../04_run_mhc/all_colorectal/hlab2_union_genes_scorefiltered.txt ../04_run_mhc/all_breast_biopsies/hlab2_union_genes_scorefiltered.txt

python find_common_genes.py ../04_run_mhc/renal/IEDB_out/hla_c_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt ../04_run_mhc/all_colorectal/hlac1_union_genes_scorefiltered.txt ../04_run_mhc/all_breast_biopsies/hlac1_union_genes_scorefiltered.txt

python find_common_genes.py ../04_run_mhc/renal/IEDB_out/hla_c_2/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt ../04_run_mhc/all_colorectal/hlac2_union_genes_scorefiltered.txt ../04_run_mhc/all_breast_biopsies/hlac2_union_genes_scorefiltered.txt
