# This script merges genes that contain neoepitopes from the same cancer.
# For example, we have 3 breast cancer biopsies, and we want to merge the neoepitopes to represent all of the genes for the breast cancer

import argparse

parser = argparse.ArgumentParser(description='Merge neoepitopes from the same cancer.')
parser.add_argument('--file_list_filepath',required=True,help='REQUIRED. Input a file where the path of each of the breast cancer biopsy is stored.')
parser.add_argument('--output_filename',required=True,help='REQUIRED. Input the path of the output file. '
                                                           'This output file has one column which is the union of the '
                                                           'genes containing neoepitopes from different biopsies of the same cancer.')
args = parser.parse_args()

union_genes = set()
with open(args.file_list_filepath, 'r') as f:
    for l in f:
        with open(l.rstrip('\n'), 'r') as neoepitope_file:
            for line in neoepitope_file:
                union_genes.add(line.rstrip('\n').split('\t')[0])

outfile = open(args.output_filename, 'w')
for i in union_genes:
    print (i, file=outfile)