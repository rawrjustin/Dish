import xlrd
import csv
import re
import os, sys, os.path

OUTPUT_EXTENSION = 'csv'

def xlsx_to_csv(infilename):
  # Remove file extension from infilename
  dot_pos = infilename.find('.')
  slash_pos = infilename.find('/')
  current_dir = infilename[0:slash_pos]
  name_only = infilename[slash_pos+1:dot_pos]
  csv_filename = OUTPUT_EXTENSION + '/' + name_only + '_GEN' + '.' + OUTPUT_EXTENSION

  with xlrd.open_workbook(infilename) as inputFile:
    sh = inputFile.sheet_by_index(0)
    with open(csv_filename, 'wb') as output:
      c = csv.writer(output)
      for r in range(sh.nrows):
        c.writerow(sh.row_values(r))
             
  print "Finished!"
  print "Output written to " + csv_filename
  
#
# Process files listed on command line, or all .csv files in current dir if no
# args given
#
re_excelfilename = re.compile(r'(\.xlsx)$')
try:    args = sys.argv[1:]
except: args = []
if len(args) < 1:
  infilenames = filter(re_excelfilename.search, os.listdir("."))
  infilenames.sort()
else:
  infilenames = args
  
for infilename in infilenames:
  xlsx_to_csv(infilename)
        