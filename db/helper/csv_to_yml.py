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
EXTERNAL_FILE_TAG = 'FILE:'

def csv_to_yml(infilename):
  # Remove file extension from infilename
  dot_pos = infilename.find('.')
  slash_pos = infilename.find('/')
  current_dir = infilename[0:slash_pos]
  name_only = infilename[slash_pos+1:dot_pos]
  yaml_filename = OUTPUT_EXTENSION + '/' + name_only + '.' + OUTPUT_EXTENSION
  
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
        
        # Assume that we can identify this entry by its first value
        this_entry_id = el
      
        # Extra fields
        for i in range(0,len(row)):
          el = row[i]
          extra_field = extra_fields[i]
          
          # Nested entry
          if (el[0:len(EXTERNAL_FILE_TAG)] == EXTERNAL_FILE_TAG):
            sub_file = current_dir + '/' + el[len(EXTERNAL_FILE_TAG):]
            output.write(extra_field + DELIM + LINE_BREAK)
            
            print "Found nested entry for " + this_entry_id + "!"
            print "--> Opening file: " + sub_file            
            with open(sub_file, 'rb') as sub:
              
              # Reader
              sub_reader = csv.reader(sub)

              # Process headers
              sub_column_headers = sub_reader.next()
              sub_column_headers = sub_column_headers[1:]
              
              #sub_reader.next()
              
              for sub_row in sub_reader:
                owner = sub_row[0] # We identify entries by the first value
                values = sub_row[1:]
                
                # process all rows owned by this entry
                if (owner == this_entry_id):
                  for i in range(0, len(sub_column_headers)):
                    sub_extra_field = sub_column_headers[i]
                    sub_el = values[i]
                    
                    # First entry
                    if (i == 0):
                      tmp = 3*INDENT + DASH
                      tmp += sub_extra_field + DELIM_SPACE + QUOTE + sub_el + QUOTE + LINE_BREAK
                      output.write(tmp)
                      
                    # Extra entries
                    else:
                      tmp = 4*INDENT
                      tmp += sub_extra_field + DELIM_SPACE + QUOTE + sub_el + QUOTE + LINE_BREAK
                      output.write(tmp)
                else:  # Skip since owner != this_entry_id
                  pass
          
          else: # A simple, non nested entry
            output.write(extra_field + DELIM_SPACE + QUOTE + el + QUOTE + LINE_BREAK)
        
        # After entry
        output.write(LINE_BREAK)
          
  print "Finished!"
  print "Output written to " + yaml_filename
      
#
# Process files listed on command line, or all .csv files in current dir if no
# args given
#
#re_excelfilename = re.compile(r'(\.csv)$')
#try:    args = sys.argv[1:]
#except: args = []
#if len(args) < 1:
  #infilenames = filter(re_excelfilename.search, os.listdir("."))
  #infilenames.sort()
#else:
  #infilenames = args
  #
#for infilename in infilenames:
#  csv_to_yml(infilename)
