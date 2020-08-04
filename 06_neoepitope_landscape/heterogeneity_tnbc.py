import pandas as pd

breast_biopsy_1 = pd.read_csv('/agavescratch/tphung3/LynchSyndrome/04_run_mhc/breast_biopsy_1/IEDB_out/hla_c_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered_comparewithWT.txt', sep='\t', names=['Gene', 'Peptide', 'MT_binding_affinity', 'WT_binding_affinity'])

breast_biopsy_1_sorted = breast_biopsy_1.sort_values(by=['MT_binding_affinity'])
breast_biopsy_1_sorted_top_20 = set()
for i in breast_biopsy_1_sorted.head(n=20)['Peptide']:
    breast_biopsy_1_sorted_top_20.add(i)

breast_biopsy_2 = pd.read_csv('/agavescratch/tphung3/LynchSyndrome/04_run_mhc/breast_biopsy_2/IEDB_out/hla_a_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered_comparewithWT.txt', sep='\t', names=['Gene', 'Peptide', 'MT_binding_affinity', 'WT_binding_affinity'])

breast_biopsy_2_sorted = breast_biopsy_2.sort_values(by=['MT_binding_affinity'])
breast_biopsy_2_sorted_top_20 = set()
for i in breast_biopsy_2_sorted.head(n=20)['Peptide']:
    breast_biopsy_2_sorted_top_20.add(i)

breast_biopsy_3 = pd.read_csv('/agavescratch/tphung3/LynchSyndrome/04_run_mhc/breast_biopsy_3/IEDB_out/hla_a_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered_comparewithWT.txt', sep='\t', names=['Gene', 'Peptide', 'MT_binding_affinity', 'WT_binding_affinity'])

breast_biopsy_3_sorted = breast_biopsy_3.sort_values(by=['MT_binding_affinity'])
breast_biopsy_3_sorted_top_20 = set()
for i in breast_biopsy_3_sorted.head(n=20)['Peptide']:
    breast_biopsy_3_sorted_top_20.add(i)

print (breast_biopsy_1_sorted_top_20.intersection(breast_biopsy_2_sorted_top_20, breast_biopsy_3_sorted_top_20))
print (breast_biopsy_1_sorted.head(n=20))
print (breast_biopsy_2_sorted.head(n=20))
print (breast_biopsy_3_sorted.head(n=20))