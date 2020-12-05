# download_data.R
# author: Kangbo Lu, Mengyuan Zhu, Mitchie Zhao, Siqi Zhou
# date: 2020-11-28

"This script downloads the dataset and stores it in the designated location.

Usage: src/download_data.R --url=<url> --output=<output_file>
Options:
--url=<url>               Takes a url from where to download the data as a csv file
--output=<output_file>    Takes a local file path to store csv data
" -> doc

# import libraries
library(docopt)
library(RCurl)
opt <- docopt(doc)

# define main function
main <- function(opt) {
    # generate error message if the input url is not valid
    if (!url.exists(opt$url)) {
        print("The url is not valid. Please input a valid url for csv data.")
    } else {
        # download data and store in designated file when file path is valid
        if (file.exists(opt$output)) {
            download.file(opt$url, opt$output)
            cat("Dataset successfully saved in", opt$output)
        } else {
            # generate error message if the designated file path does not exist!
            print("The file path does not exist. Please input a valid file path.")
        }
    }
}

# call the main function when script is executed
main(opt)