# This script finds the overlap in neoepitopes between the three biopsies of breast cancers
import sys
breast_1_neoepitopes_fn = sys.argv[1]
breast_2_neoepitopes_fn = sys.argv[2]
breast_3_neoepitopes_fn = sys.argv[3]

breast_1_neoepitopes = set()
breast_2_neoepitopes = set()
breast_3_neoepitopes = set()

with open(breast_1_neoepitopes_fn, 'r') as f:
    for line in f:
        breast_1_neoepitopes.add(line.rstrip('\n').split('\t')[1])

with open(breast_2_neoepitopes_fn, 'r') as f:
    for line in f:
        breast_2_neoepitopes.add(line.rstrip('\n').split('\t')[1])

with open(breast_3_neoepitopes_fn, 'r') as f:
    for line in f:
        breast_3_neoepitopes.add(line.rstrip('\n').split('\t')[1])

print (breast_1_neoepitopes.intersection(breast_2_neoepitopes, breast_3_neoepitopes))
print (len(breast_1_neoepitopes.intersection(breast_2_neoepitopes, breast_3_neoepitopes)))