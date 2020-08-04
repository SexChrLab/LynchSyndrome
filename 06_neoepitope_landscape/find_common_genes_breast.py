# This script finds the overlap in genes containing neoepitopes between the three biopsies of breast cancer
import sys
breast_1_genes_fn = sys.argv[1]
breast_2_genes_fn = sys.argv[2]
breast_3_genes_fn = sys.argv[3]

breast_1_genes = set()
breast_2_genes = set()
breast_3_genes = set()

with open(breast_1_genes_fn, 'r') as f:
    for line in f:
        breast_1_genes.add(line.rstrip('\n').split('\t')[0])

with open(breast_2_genes_fn, 'r') as f:
    for line in f:
        breast_2_genes.add(line.rstrip('\n').split('\t')[0])

with open(breast_3_genes_fn, 'r') as f:
    for line in f:
        breast_3_genes.add(line.rstrip('\n').split('\t')[0])

print (breast_1_genes.intersection(breast_2_genes, breast_3_genes))
print (len(breast_1_genes.intersection(breast_2_genes, breast_3_genes)))