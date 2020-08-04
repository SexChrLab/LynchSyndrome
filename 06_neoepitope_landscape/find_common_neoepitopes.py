# This script finds the overlap in neoepitopes between different cancers
import sys
renal_neoepitopes_fn = sys.argv[1]
colorectal_1_neoepitopes_fn = sys.argv[2]
colorectal_2_neoepitopes_fn = sys.argv[3]
breast_neoepitopes_fn = sys.argv[4]

renal_neoepitopes = set()
colorectal_1_neoepitopes = set()
colorectal_2_neoepitopes = set()
breast_neoepitopes = set()

with open(renal_neoepitopes_fn, 'r') as f:
    for line in f:
        renal_neoepitopes.add(line.rstrip('\n').split('\t')[1])

with open(colorectal_1_neoepitopes_fn, 'r') as f:
    for line in f:
        colorectal_1_neoepitopes.add(line.rstrip('\n').split('\t')[1])

with open(colorectal_2_neoepitopes_fn, 'r') as f:
    for line in f:
        colorectal_2_neoepitopes.add(line.rstrip('\n').split('\t')[1])

with open(breast_neoepitopes_fn, 'r') as f:
    for line in f:
        breast_neoepitopes.add(line.rstrip('\n').split('\t')[0])

print (renal_neoepitopes.intersection(colorectal_1_neoepitopes, colorectal_2_neoepitopes, breast_neoepitopes))