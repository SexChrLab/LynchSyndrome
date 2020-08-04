colorectal_1_variants = set()
colorectal_2_variants = set()

with open("c://Users/tuyen/Documents/postdoc_asu/projects/LynchSyndrome/02_neoepitope/colorectal_1.VarScan_variants_filter.pass.filtered_by_af_50", "r") as f:
    for line in f:
        colorectal_1_variants.add(line.rstrip('\n').split('\t')[23])

with open("c://Users/tuyen/Documents/postdoc_asu/projects/LynchSyndrome/02_neoepitope/colorectal_2.VarScan_variants_filter.pass.filtered_by_af_50", "r") as f:
    for line in f:
        colorectal_2_variants.add(line.rstrip('\n').split('\t')[23])

common_variants = colorectal_1_variants.intersection(colorectal_2_variants)
# print (len(common_variants))
# for i in common_variants:
#     print (i)

outfile_1 = open("c://Users/tuyen/Documents/postdoc_asu/projects/LynchSyndrome/02_neoepitope/colorectal_cancer_sampels_common_variants_af_50_colorectal_1_vep.tsv", "w")
with open("c://Users/tuyen/Documents/postdoc_asu/projects/LynchSyndrome/02_neoepitope/colorectal_1.VarScan_vep.vcf", "r") as f:
    for line in f:
        if not line.startswith("#"):
            items = line.rstrip("\n").split("\t")
            if items[0] + "_" + items[1] in common_variants:
                print (line, file=outfile_1)

outfile_2 = open("c://Users/tuyen/Documents/postdoc_asu/projects/LynchSyndrome/02_neoepitope/colorectal_cancer_sampels_common_variants_af_50_colorectal_2_vep.tsv", "w")
with open("c://Users/tuyen/Documents/postdoc_asu/projects/LynchSyndrome/02_neoepitope/colorectal_2.VarScan_vep.vcf", "r") as f:
    for line in f:
        if not line.startswith("#"):
            items = line.rstrip("\n").split("\t")
            if items[0] + "_" + items[1] in common_variants:
                print (line, file=outfile_2)
