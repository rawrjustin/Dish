#!/usr/bin/env python 

import  re
import  os, sys, os.path
import  csv, yaml

# Assumptions
# - Input file extension is '.csv'

# Constants
OUTPUT_EXTENSION = 'yml'
DELIM = ':'
DELIM_SPACE = ': '
DASH = '-   '
INDENT = '    '
QUOTE = '"'
LINE_BREAK = '\n'

def csv_to_yaml(infilename):
  # Remove file extension from infilename
  dot_pos = infilename.find('.')
  slash_pos = infilename.find('/')
  name_only = infilename[slash_pos+1:dot_pos]
  yaml_filename = OUTPUT_EXTENSION + '/' + name_only + '_GEN' + '.' + OUTPUT_EXTENSION
  
  # Create output file
  with open(yaml_filename, 'w') as output:

    # Process table name (from file name)
    output.write(name_only + DELIM + LINE_BREAK)
  
    with open(infilename, 'rb') as f:
      # Reader
      reader = csv.reader(f)
      
      # Process headers
      column_headers = reader.next()
      
      # -- First field (from first entry in header)
      first_header = column_headers.pop(0)
      first_field = INDENT + DASH + first_header
      
      # -- Extra fields (from additional entries in header)
      extra_fields = []
      for header in column_headers:
        extra_fields.append(INDENT*2 + header)
        
      # Process entries
      for row in reader:
        # First field
        el = row.pop(0)
        output.write(first_field + DELIM_SPACE + QUOTE + el + QUOTE + LINE_BREAK)
      
        # Extra fields
        for i in range(0,len(row)):
          el = row[i]
          extra_field = extra_fields[i]
          output.write(extra_field + DELIM_SPACE + QUOTE + el + QUOTE + LINE_BREAK)
        
        # After entry
        output.write(LINE_BREAK)
          
  print "DONE"
      
#
# Process files listed on command line, or all .csv files in current dir if no
# args given
#
re_excelfilename = re.compile(r'(\.csv)$')
try:    args = sys.argv[1:]
except: args = []
if len(args) < 1:
  infilenames = filter(re_excelfilename.search, os.listdir("."))
  infilenames.sort()
else:
  infilenames = args
  
for infilename in infilenames:
  csv_to_yaml(infilename)
        