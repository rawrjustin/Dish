#!/usr/bin/env python 

import re
import os, sys, os.path
import xlsx_to_csv
import csv_to_yml

#
# Process files listed on command line, or all files in current dir if no
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
  xlsx_to_csv.xlsx_to_csv(infilename)
  slash_pos = infilename.find('/')
  dot_pos = infilename.find('.')
  name_only = infilename[slash_pos+1:dot_pos] + '.csv'
  csv_to_yml.csv_to_yml('csv/' + name_only)