# This script finds the overlap in genes containing neoepitopes between different cancers
import sys
renal_genes_fn = sys.argv[1]
colorectal_genes_fn = sys.argv[2]
breast_genes_fn = sys.argv[3]

renal_genes = set()
colorectal_genes = set()
breast_genes = set()

with open(renal_genes_fn, 'r') as f:
    for line in f:
        renal_genes.add(line.rstrip('\n').split('\t')[0])

with open(colorectal_genes_fn, 'r') as f:
    for line in f:
        colorectal_genes.add(line.rstrip('\n').split('\t')[0])

with open(breast_genes_fn, 'r') as f:
    for line in f:
        breast_genes.add(line.rstrip('\n').split('\t')[0])

print (renal_genes.intersection(colorectal_genes, breast_genes))