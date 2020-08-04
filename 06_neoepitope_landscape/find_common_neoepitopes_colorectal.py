# This script finds the overlap in neoepitopes between the three biopsies of breast cancers
import sys
colorectal_1_neoepitopes_fn = sys.argv[1]
colorectal_2_neoepitopes_fn = sys.argv[2]

colorectal_1_neoepitopes = set()
colorectal_2_neoepitopes = set()

with open(colorectal_1_neoepitopes_fn, 'r') as f:
    for line in f:
        colorectal_1_neoepitopes.add(line.rstrip('\n').split('\t')[1])

with open(colorectal_2_neoepitopes_fn, 'r') as f:
    for line in f:
        colorectal_2_neoepitopes.add(line.rstrip('\n').split('\t')[1])

print (colorectal_1_neoepitopes.intersection(colorectal_2_neoepitopes))
print (len(colorectal_1_neoepitopes.intersection(colorectal_2_neoepitopes)))