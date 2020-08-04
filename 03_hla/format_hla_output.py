# This script formats hla output from HLA-lA to be compatible with the run_mhc.py script.

from optparse import OptionParser
import os

# # Parsing arguments from command line
# parser = OptionParser(usage='python format_hla_output.py <options>')
# parser.add_option('--hlala_output', dest='hlala_output', action='store')
# parser.add_option('--hla_format_out', dest='hla_format_out', action='store')
# (options, args) = parser.parse_args()
#
# hlala_output = options.hlala_output
# hla_format_out = open(options.hla_format_out, 'w')
#
# with open(hlala_output, 'r') as f:
#     for line in f:
#         if line.startswith('A') or line.startswith('B') or line.startswith('C'):
#             items = line.rstrip('\n').split('\t')[2].split('*')
#             hla_type = items[0]
#             digits = items[1].split(':')
#             out = ['HLA-' + str(hla_type), 'hla_' + str(hla_type).lower() + '_' + str(digits[0]) + '_' + str(digits[1]) + '_' + str(digits[2][:2])]
#             print ('\t'.join(out), file=hla_format_out)

# Parsing arguments from command line
parser = OptionParser(usage='python format_hla_output.py <options>')
parser.add_option('--hlala_output', dest='hlala_output', action='store')
parser.add_option('--hla_directory', dest='hla_directory', action='store')
(options, args) = parser.parse_args()

hlala_output = options.hlala_output
hla_directory = options.hla_directory

with open(hlala_output, 'r') as f:
    for line in f:
        if line.startswith('A') or line.startswith('B') or line.startswith('C'):
            items = line.rstrip('\n').split('\t')[2].split('*')
            hla_type = items[0]
            digits = items[1].split(':')
            if len(digits) == 3:
                outfile = open(os.path.join(hla_directory, "hla_" + str(hla_type).lower() + '_' + str(digits[0]) + '_' + str(digits[1]) + '_' + str(digits[2][:2]) + '.txt'), 'w')
                out = ['HLA-' + str(hla_type), 'hla_' + str(hla_type).lower() + '_' + str(digits[0]) + '_' + str(digits[1]) + '_' + str(digits[2][:2])]
                print ('\t'.join(out), file=outfile)
            else:
                outfile = open(os.path.join(hla_directory, "hla_" + str(hla_type).lower() + '_' + str(digits[0]) + '_' + str(digits[1]) + '.txt'), 'w')
                out = ['HLA-' + str(hla_type), 'hla_' + str(hla_type).lower() + '_' + str(digits[0]) + '_' + str(digits[1])]
                print ('\t'.join(out), file=outfile)

