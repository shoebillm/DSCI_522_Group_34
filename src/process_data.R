# author: UBC MDS Group 34
# date: 2020-11-25

"This script downloads the dataset and stores it in the designated location.
Usage: process_data.R --input=<input_file> --output=<output_file>
Options:
--input=<input_file>    Takes a local relative file path to read input data
--output=<output_file>  Takes a local relative file path to store processed data
" -> doc

library(docopt)
library(tidyverse)

opt <- docopt(doc)

main <- function(opt) {
    # join relative file paths to absolute file paths
    input_file <- file.path(getwd(), opt$input)
    output_file <- file.path(getwd(), opt$output)

    # process data
    graffiti <- read_delim(input_file, delim = ";") %>%
        rename_with(~ tolower(gsub(" ", "_", .x, fixed = TRUE))) %>%
        select(count, geo_local_area) %>%
        filter(geo_local_area == "Downtown" | geo_local_area == "Strathcona") %>%
        drop_na()

    # save processed data
    write_delim(graffiti, output_file, delim = ";")
    paste("Processed data saved as", output_file)
}

main(opt)
