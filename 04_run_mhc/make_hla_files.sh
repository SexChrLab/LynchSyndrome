#!/bin/bash

# In this script, we are manually created the hla file. This is because we are using the same hlas for all 6 cancers

for directory in breast_biopsy_1 breast_biopsy_2 breast_biopsy_3 renal colorectal_1 colorectal_2
do

touch /agavescratch/tphung3/LynchSyndrome/04_run_mhc/$directory/hla/hla_a_24_02_01.txt
touch /agavescratch/tphung3/LynchSyndrome/04_run_mhc/$directory/hla/hla_b_38_01_01.txt
touch /agavescratch/tphung3/LynchSyndrome/04_run_mhc/$directory/hla/hla_b_27_05_02.txt
touch /agavescratch/tphung3/LynchSyndrome/04_run_mhc/$directory/hla/hla_c_12_03_01.txt
touch /agavescratch/tphung3/LynchSyndrome/04_run_mhc/$directory/hla/hla_c_07_04_01.txt

echo -e "HLA-A\thla_a_24_02_01" > /agavescratch/tphung3/LynchSyndrome/04_run_mhc/$directory/hla/hla_a_24_02_01.txt
echo -e "HLA-B\thla_b_38_01_01" > /agavescratch/tphung3/LynchSyndrome/04_run_mhc/$directory/hla/hla_b_38_01_01.txt
echo -e "HLA-B\thla_b_27_05_02" > /agavescratch/tphung3/LynchSyndrome/04_run_mhc/$directory/hla/hla_b_27_05_02.txt
echo -e "HLA-C\thla_c_12_03_01" > /agavescratch/tphung3/LynchSyndrome/04_run_mhc/$directory/hla/hla_c_12_03_01.txt
echo -e "HLA-C\thla_c_07_04_01" > /agavescratch/tphung3/LynchSyndrome/04_run_mhc/$directory/hla/hla_c_07_04_01.txt

done
