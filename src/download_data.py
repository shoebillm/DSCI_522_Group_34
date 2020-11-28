# download_data.py
# author: Kangbo Lu, Mengyuan Zhu, Mitchie Zhao, Siqi Zhou
# date: 2020-11-27

"""
This script downloads the dataset and stores it in the designated location.

Usage: src/download_data.py  --url=<url> --output_path=<output_path>

Options:
--url=<url>                    Takes a url from where to download the data (must be in standard csv format)
--output_path=<output_path>    Takes a url file path including filename of where to store the csv file
"""

# import libraries
from docopt import docopt
import requests
import os
import pandas as pd
opt = docopt(__doc__)

# define main function
def main(url, output_path):
    # check if the URL is valid
    # handle exception if the URL is not valid
    try: 
        request = requests.get(url)
        request.status_code == 200
    except Exception as req:
        print("The URL provided is not valid.")
        print(req)

    # save requested file to csv locally
    # handle exception if the file path doesn't exist
    data = pd.read_csv(url, sep=";", header=None)
    try:
        data.to_csv(output_path, index=False)    
    except:
        os.makedirs(os.path.dirname(output_path))
        data.to_csv(output_path, index = False)
        
    # console output when file-saving is successful
    print("File saved as", output_path)

# call the main function when script is executed
main(opt["--url"], opt["--output_path"])