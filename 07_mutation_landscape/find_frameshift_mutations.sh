#!/bin/bash

for i in breast_biopsy_1 breast_biopsy_2 breast_biopsy_3 renal colorectal_1 colorectal_2;
do
python find_frameshift_mutations.py --input_fn ../02_neoepitope/intermediate_files/${i}.VarScan.indel.Somatic.hc.noheader.vep.vcf --output_fn results/${i}.VarScan.indel.Somatic.hc.frameshift
done
