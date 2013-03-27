#!/usr/bin/env python 

import  re
import  os, sys, os.path
import  yaml

# Assumptions
# - Input file extension is '.csv'

# Constants
OUTPUT_EXTENSION = 'csv'
DELIM = ','
DASH = '-   '
INDENT = '    '
QUOTE = '"'
LINE_BREAK = '\n'

def yaml_to_csv(infilename):
  # We figure out wrap length at runtime
  WRAPLEN = 0

  # Remove file extension from infilename
  dot_pos = infilename.find('.')
  slash_pos = infilename.find('/')
  name_only = infilename[slash_pos+1:dot_pos]
  csv_filename = OUTPUT_EXTENSION + '/' + name_only + '.' + OUTPUT_EXTENSION
  
  newline_regex = re.compile(r'(\n)')
  table_regex = re.compile(r'\w+:')
  header_regex = re.compile(r'\s\w+:')
  val_regex = re.compile(r'"(.*?)"')
  
  # Create output file
  with open(csv_filename, 'w') as output:
  
    with open(infilename, 'rb') as f:
      # First line (its the table name)
      s = f.readline()
      
      table_name = re.findall(table_regex, s)
      table_name = table_name[0][0:-1] #first entry (we assume only 1 name). And strip the colon.
      #print table_name # I don't think we need to use this actually. But useful to have.
      
      # Next line
      indx = 1
      
      # First entry (we have to figure out how big an entry is)
      # Size of the entry is stored in WRAPLEN
      next_line = f.readline()
      s = next_line
      while(len(next_line) != 2):
        next_line = f.readline()
        s += next_line
        WRAPLEN += 1
      
      # Parse headers
      headers = re.findall(header_regex, s)
      if (headers != []):
        headers = map(lambda x: x[1:-1], headers)
        
      # Format headers
      header_line = ""
      for h in headers:
        header_line += h + ','
      header_line = header_line[0:-1] + LINE_BREAK
      
      # Write headers
      output.write(header_line)
      
      # Parse values
      values = re.findall(val_regex, s)
      
      # Format values
      value_line = ""
      for v in values:
        value_line += v + ','
      value_line = value_line[0:-1] + LINE_BREAK
      
      # Write values
      output.write(value_line)
      
      # Rest of entries, we can do in a speedy fashion
      # Now that we know WRAPLEN!
      s = f.readline()
      while(s):
        v = re.findall(val_regex, s)
        if (v == []):
          s = f.readline()
          continue
        else:
          v = v[0] # we assume only 1 value per field
        
        output.write(v)
        
        # After entry
        if (indx % WRAPLEN == 0):
          output.write(LINE_BREAK)
        else:
          output.write(DELIM)
        
        indx += 1
        s = f.readline()
          
  print "DONE"
      
#
# Process files listed on command line, or all .csv files in current dir if no
# args given
#
re_excelfilename = re.compile(r'(\.yml)$')
try:    args = sys.argv[1:]
except: args = []
if len(args) < 1:
  infilenames = filter(re_excelfilename.search, os.listdir("."))
  infilenames.sort()
else:
  infilenames = args
  
for infilename in infilenames:
  yaml_to_csv(infilename)
        