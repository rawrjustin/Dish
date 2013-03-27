Working with CSV, YML, Excel...

NOTE: Currently you can only call directly XLSX to YML.
If you want to run the other scripts, just uncomment the bottom chunk & run.

---------------
- XLSX to YML -
---------------

EXAMPLE
python xlsx_to_yml xlsx/ingredients.xlsx

CALLING THE SCRIPT
* Make sure to call the script from with the /helper/ directory only.
  - The script makes assumptions that the folders /yml/ and /csv/ exist.

---------------
- XLSX to CSV -
---------------

In Excel, File >> Save as... >> CSV

--------------
- CSV TO YML -
--------------

EXAMPLE
python csv_to_yml csv/ingredients.csv

CALLING THE SCRIPT
* Make sure to call the script from with the /helper/ directory only.
  - The script makes assumptions that the folders /yml/ and /csv/ exist.
    
INPUT FORMAT    
* First row are headers, and following rows are values
* This means a new spreadsheet for every data type.
  - So ingredients have their own spreadsheet, meals have their own, ... etc.  
* Input CSV should be in the CSV folder

--------------
- YML TO CSV -
--------------

EXAMPLE
python yml_to_csv yml/ingredients.yml

CALLING THE SCRIPT
* Make sure to call the script from with the /helper/ directory only.
  - The script makes assumptions that the folders /yml/ and /csv/ exist.
  
INPUT FORMAT
* First row is the data type
* One data type per YML file only.
  - So ingredients have their own YML, meals have their own, ... etc.
* Input YML should be in the YML folder
