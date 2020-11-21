# download data with R placeholder
# author: UBC MDS Group 34
# date: 2020-11-20

"This script downloads the dataset and stores it in the designated location.
Usage: download_data.R --url=<url> --output=<output_file>
Options:
--url=<url>               Takes a url from where to download the data as csv
--output=<output_file>    Takes a local file path to store data
" -> doc

library(docopt)
opt <- docopt(doc)

main <- function(opt) {
    download.file(opt$url, opt$output)
    cat("Dataset successfully saved in", opt$output)
}
    
main(opt)    


