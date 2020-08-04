# In this script, I want to return the positions that are frameshift mutations
# Input file is: breast_biopsy_1.VarScan.indel.Somatic.hc.noheader.vep.vcf

import argparse
parser = argparse.ArgumentParser(description='Find frameshift mutations')
parser.add_argument("--input_fn",required=True,help="Input the path of the file. An example is: breast_biopsy_1.VarScan.indel.Somatic.hc.noheader.vep.vcf")
parser.add_argument("--output_fn",required=True,help="Input the path of the outfile")

args = parser.parse_args()

outfile = open(args.output_fn, "w")

with open(args.input_fn, "r") as f:
    for line in f:
        if not line.startswith("#"):
            items = line.rstrip('\n').split('\t')
            for i in items[7].split("|"):
                if i.startswith("frameshift_variant"):
                    out = [items[0], items[1], items[4]]
                    print ("\t".join(out), file=outfile)
                    break