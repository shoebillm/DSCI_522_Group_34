# author: UBC MDS Group 34
# date: 2020-11-20

"This script downloads the dataset and stores it in the designated location.
Usage: src/download_data.R --url=<url> --output=<output_file>
Options:
--url=<url>               Takes a url from where to download the data as csv
--output=<output_file>    Takes a local file path to store data
" -> doc

library(docopt)
library(RCurl)
opt <- docopt(doc)

main <- function(opt) {
# Generate error message if the input url is not valid
    if (!url.exists(opt$url)) {
      print("The url is not valid. Please input a valid url for csv data.")
    } else {
# Download data and store in designated file when file path is valid
    if (file.exists(opt$output)) {
      download.file(opt$url, opt$output)
      cat("Dataset successfully saved in", opt$output)
    } else {
      print("The file path does not exist. Please input a valid file path.")
    }
    }
}
    
main(opt)