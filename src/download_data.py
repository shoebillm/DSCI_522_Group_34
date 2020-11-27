# download data with python 
# author: UBC MDS Group 34
# date: 2020-11-27

"""Downloads csv data from the web to a local filepath as a csv file format.
Usage: src/download_data.py  --url=<url> --output_path=<output_path>

Options:
--url=<url>                    URL from where to download the data (must be in standard csv format)
--output_path=<output_path>    File path including file name of where to store the file
"""
  
from docopt import docopt
import requests
import os
import pandas as pd

opt = docopt(__doc__)

def main(url, output_path):
	# check if the URL is valid
    try: 
        request = requests.get(url)
        request.status_code == 200
    except Exception as req:
        print("The URL provided is not valid.")
        print(req)
    
    data = pd.read_csv(url, sep=";", header=None)
    
    # save requested file to CSV locally
    try:
        data.to_csv(output_path, index=False)
    except:
        os.makedirs(os.path.dirname(output_path))
        data.to_csv(output_path, index = False)
    print("File saved as", output_path)

main(opt["--url"], opt["--output_path"])