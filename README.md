# LynchSyndrome

#### Get gene name & variant effect

```
python get_genename_varianteffect.py MIL582_A2_NL_Renal_P4_VarScan_vep.tsv > Renal_genename_varianteffect.txt
grep -E 'missense|synonymous' Renal_genename_varianteffect.txt > Renal_genename_varianteffect_missense.sn.txt
uniq Renal_genename_varianteffect_missense.sn.txt > Renal_genename_varianteffect_missense.sn_uniq.txt
```

