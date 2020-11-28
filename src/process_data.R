# process_data.R
# author: Kangbo Lu, Siqi Zhou, Mitchie Zhao, Mengyuan Zhu
#
# date: 2020-11-25
#
# This script downloads the dataset, precesses it and store the processed data in the designated location
# This script takes 2 arguments:path of input_file,and path of output_file.
#
# Usage: Rscript src/process_data.R --input="data/dataset.csv" --output="data/processed/processed.csv"

"This script downloads the dataset, processes and stores it in the designated location.
Usage: process_data.R --input=<input_file> --output=<output_file>
Options:
--input=<input_file>    Takes a local relative relative filename path to read input data
--output=<output_file>  Takes a local relative relative filename path to store processed data
" -> doc

# import libraries/packages

library(docopt)
library(tidyverse)

opt <- docopt(doc)

# define main function

main <- function(opt) {
    
## join relative file paths to absolute file paths
    
    input_file <- file.path(getwd(), opt$input)
    output_file <- file.path(getwd(), opt$output)

## process data
    
    graffiti <- read_delim(input_file, delim = ";") %>%
    
### pre-process the .csv file, transfer the text into lower case and tidy up the spaces
    
        rename_with(~ tolower(gsub(" ", "_", .x, fixed = TRUE))) %>%
    
### select relevant data in 2 areas of our interest
    
        select(count, geo_local_area) %>%
        filter(geo_local_area == "Downtown" | geo_local_area == "Strathcona") %>%
    
### drop null values
    
        drop_na()

## save processed data
    write_delim(graffiti, output_file, delim = ";")
    paste("Processed data saved as", output_file)
}

# call main function

main(opt)
