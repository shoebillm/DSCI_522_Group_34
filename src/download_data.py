# download_data.py
#
# author: UBC MDS Group 34
# date: 2020-11-27
#
# This script downloads the dataset, stores it in the designated location, and handles errors if the input url is not valid
#
# This script takes 2 arguments: the url and the output file path.
#
# Usage: Usage: src/download_data.py  --url=<url> --output_path=<output_path>

"""Downloads csv data from the web to a local filepath as a csv file format.
Usage: src/download_data.py  --url=<url> --output_path=<output_path>

Options:
--url=<url>                    URL from where to download the data (must be in standard csv format)
--output_path=<output_path>    File path including file name of where to store the file
"""

## import libraries/packages

from docopt import docopt
import requests
import os
import pandas as pd

opt = docopt(__doc__)

## define main function

def main(url, output_path):
    
# check if the URL is valid
    try: 
        request = requests.get(url)
        request.status_code == 200
        
# handle errors if the URL is not valid
    
    except Exception as req:
        print("The URL provided is not valid.")
        print(req)
    
    data = pd.read_csv(url, sep=";", header=None)
    
# save requested file to CSV locally
    
    try:
        data.to_csv(output_path, index=False)
        
# handle errors 
    
    except:
        os.makedirs(os.path.dirname(output_path))
        data.to_csv(output_path, index = False)
        
# interaction when storage is succeeded.
    
    print("File saved as", output_path)

# call the main function
    
main(opt["--url"], opt["--output_path"])