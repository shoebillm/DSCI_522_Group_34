# download_data.R
#
# author: UBC MDS Group 34, Mitchie Zhao
#
# date: 2020-11-20
#
#
# This script downloads the dataset, stores it in the designated location, and handles errors if the input url is not valid
#
# This script takes 2 arguments: the url and the output file path.
#
# Usage: src/download_data.R --url=<url> --output=<output_file>
#
"This script downloads the dataset and stores it in the designated location.
Usage: src/download_data.R --url=<url> --output=<output_file>
Options:
--url=<url>               Takes a url from where to download the data as csv
--output=<output_file>    Takes a local file path to store data
" -> doc

# import libraries/packages

library(docopt)
library(RCurl)
opt <- docopt(doc)

# define main function

main <- function(opt) {
    
## Generate error message if the input url is not valid
    
    if (!url.exists(opt$url)) {
        print("The url is not valid. Please input a valid url for csv data.")
    } else {
          
## Download data and store in designated file when file path is valid
        
        if (file.exists(opt$output)) {
            download.file(opt$url, opt$output)
            cat("Dataset successfully saved in", opt$output)
        } else {
            
## Generate error message if the designated file path does not exist!
            
            print("The file path does not exist. Please input a valid file path.")
        }
    }
}

# call the main function

main(opt)