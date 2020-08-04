# This script finds the overlap in genes containing neoepitopes between the two colorectal cancers
import sys
colorectal_1_genes_fn = sys.argv[1]
colorectal_2_genes_fn = sys.argv[2]

colorectal_1_genes = set()
colorectal_2_genes = set()

with open(colorectal_1_genes_fn, 'r') as f:
    for line in f:
        colorectal_1_genes.add(line.rstrip('\n').split('\t')[0])

with open(colorectal_2_genes_fn, 'r') as f:
    for line in f:
        colorectal_2_genes.add(line.rstrip('\n').split('\t')[0])

print (colorectal_1_genes.intersection(colorectal_2_genes))
print (len(colorectal_1_genes.intersection(colorectal_2_genes)))