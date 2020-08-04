# In this script, we want to find the overlap in mutations (all variants) across four cancers: renal, colorectal 1, colorectal 2, and tnbc
# Combine all of the breast biopsies
tnbc_set = set()
with open('/data/kander22/LynchSyndrome/02_neoepitope/intermediate_files/breast_biopsy_1.VarScan_vep.vcf', 'r') as f:
    for line in f:
        if not line.startswith('#'):
            items = line.rstrip('\n').split('\t')
            tnbc_set.add(items[0] + '_' + items[1])
with open('/data/kander22/LynchSyndrome/02_neoepitope/intermediate_files/breast_biopsy_2.VarScan_vep.vcf', 'r') as f:
    for line in f:
        if not line.startswith('#'):
            items = line.rstrip('\n').split('\t')
            tnbc_set.add(items[0] + '_' + items[1])
with open('/data/kander22/LynchSyndrome/02_neoepitope/intermediate_files/breast_biopsy_3.VarScan_vep.vcf', 'r') as f:
    for line in f:
        if not line.startswith('#'):
            items = line.rstrip('\n').split('\t')
            tnbc_set.add(items[0] + '_' + items[1])

# Generate set for renal
renal_set = set()
with open('/data/kander22/LynchSyndrome/02_neoepitope/intermediate_files/renal.VarScan_vep.vcf', 'r') as f:
    for line in f:
        if not line.startswith('#'):
            items = line.rstrip('\n').split('\t')
            renal_set.add(items[0] + '_' + items[1])

# Generate set for coloretal 1
colorectal_1_set = set()
with open('/data/kander22/LynchSyndrome/02_neoepitope/intermediate_files/colorectal_1.VarScan_vep.vcf', 'r') as f:
    for line in f:
        if not line.startswith('#'):
            items = line.rstrip('\n').split('\t')
            colorectal_1_set.add(items[0] + '_' + items[1])

# Generate set for coloretal 2
colorectal_2_set = set()
with open('/data/kander22/LynchSyndrome/02_neoepitope/intermediate_files/colorectal_2.VarScan_vep.vcf', 'r') as f:
    for line in f:
        if not line.startswith('#'):
            items = line.rstrip('\n').split('\t')
            colorectal_2_set.add(items[0] + '_' + items[1])

outfile = open('/data/kander22/LynchSyndrome/07_mutation_landscape/results/common_variants_four_cancers_allVariants.txt', 'w')
common_variants = tnbc_set.intersection(renal_set, colorectal_1_set, colorectal_2_set)
print (len(common_variants))
for i in common_variants:
    print (i, file=outfile)

tnbc_variant_position_out = open('/data/kander22/LynchSyndrome/07_mutation_landscape/results/tnbc_snp_positions_allVariants.txt', 'w')
for i in tnbc_set:
    print (i, file=tnbc_variant_position_out)

renal_variant_position_out = open('/data/kander22/LynchSyndrome/07_mutation_landscape/results/renal_snp_positions_allVariants.txt', 'w')
for i in renal_set:
    print (i, file=renal_variant_position_out)

colorectal_1_variant_position_out = open('/data/kander22/LynchSyndrome/07_mutation_landscape/results/colorectal_1_snp_positions_allVariants.txt', 'w')
for i in colorectal_1_set:
    print (i, file=colorectal_1_variant_position_out)

colorectal_2_variant_position_out = open('/data/kander22/LynchSyndrome/07_mutation_landscape/results/colorectal_2_snp_positions_allVariants.txt', 'w')
for i in colorectal_2_set:
    print (i, file=colorectal_2_variant_position_out)