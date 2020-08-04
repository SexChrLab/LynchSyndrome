#!/bin/bash

for i in hlaa1 hlab1 hlab2 hlac1 hlac2
do

python merge_neoepitopes_from_same_cancer.py --file_list_filepath breast_cancer_file_paths_${i}.txt --output_filename ../04_run_mhc/all_breast_biopsies/${i}_union_neoepitopes_scorefiltered.txt
python merge_neoepitopes_from_same_cancer.py --file_list_filepath colorectal_cancer_file_paths_${i}.txt --output_filename ../04_run_mhc/all_colorectal/${i}_union_neoepitopes_scorefiltered.txt

done
