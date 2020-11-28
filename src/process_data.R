# process_data.R
# author: Kangbo Lu, Mengyuan Zhu, Mitchie Zhao, Siqi Zhou
# date: 2020-11-28
# usage example: Rscript src/process_data.R --input="data/dataset.csv" --output="data/processed/processed.csv"

"Clean, split, and process the raw gratiffi dataset for eda and analysis.

Usage: process_data.R --input=<input_file> --output=<output_file>
Options:
--input=<input_file>    Takes a local relative path includes filename path to read input csv data
--output=<output_file>  Takes a local relative path includes filename to store processed csv data
" -> doc

# import libraries
library(docopt)
library(tidyverse)
opt <- docopt(doc)

# define main function
main <- function(opt) {
    # join relative file paths to absolute file paths
    input_file <- file.path(getwd(), opt$input)
    output_file <- file.path(getwd(), opt$output)
    
    # readin data, tidy columns and select wanted columns
    graffiti <- read_delim(input_file, delim = ";") %>%
        rename_with( ~ tolower(gsub(" ", "_", .x, fixed = TRUE))) %>%
        select(count, geo_local_area) %>%
        filter(geo_local_area == "Downtown" | geo_local_area == "Strathcona") %>%
        drop_na()
    
    # save processed data with the given file path includes filename
    write_delim(graffiti, output_file, delim = ";")
    paste("Processed data saved as", output_file)
}

# call the main function when script is executed
main(opt)