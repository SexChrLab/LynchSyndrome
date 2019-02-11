# LynchSyndrome

#### Mutational signature

```
python get_genename_varianteffect.py MIL582_A2_NL_Renal_P4_VarScan_vep.tsv > Renal_genename_varianteffect.txt

grep -E 'missense|synonymous' Renal_genename_varianteffect.txt > Renal_genename_varianteffect_missense.sn.txt

uniq Renal_genename_varianteffect_missense.sn.txt > Renal_genename_varianteffect_missense.sn_uniq.txt
```

* Find a list of genes

```
cat B1_genename_varianteffect_missense.sn_uniq.txt B5_genename_varianteffect_missense.sn_uniq.txt B6_genename_varianteffect_missense.sn_uniq.txt Renal_genename_varianteffect_missense.sn_uniq.txt > B1_B5_B6_Renal_genename_varianteffect_missense.sn_uniq.txt

awk '{print$1}' B1_B5_B6_Renal_genename_varianteffect_missense.sn_uniq.txt > B1_B5_B6_Renal_genename_varianteffect_missense.sn_uniq_genes.txt

uniq B1_B5_B6_Renal_genename_varianteffect_missense.sn_uniq_genes.txt > B1_B5_B6_Renal_genename_varianteffect_missense.sn_uniq_genes_uniq.txt

```

