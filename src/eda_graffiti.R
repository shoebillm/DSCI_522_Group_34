# eda_graffiti.R
# author: Kangbo Lu, Mengyuan Zhu, Mitchie Zhao, Siqi Zhou
# date: 2020-11-28
# usage example: Rscript src/eda_graffiti.R --input="data/processed/processed.csv" --output="results/graffiti_eda.png"

"This script creates eda figure and stores the figure into specified path with filename.

Usage: eda_graffiti.R --input=<input_file> --output=<output_file>

Options:
--input=<input_file>    Takes a local relative path includes filename to read processed csv data
--output=<output_file>  Takes a local relative path includes filename to store eda figure
" -> doc

# import libraries
library(docopt)
library(tidyverse)
library(ggplot2)
opt <- docopt(doc)

# define the main function
main <- function(opt) {  
    # join relative file paths to absolute file paths
    input_file <- file.path(getwd(), opt$input)
    output_file <- file.path(getwd(), opt$output)

    # read the pre-processed file after process_data.R
    graffiti <- read_delim(input_file, delim = ";")
    
    # draw distribution of graffiti count by Vancouver region
    violin_plot <- graffiti %>%
        ggplot(aes(x = geo_local_area, y = count)) +
        geom_violin(trim = FALSE) +
        stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "blue") +
        ggtitle("Distribution of graffiti count by Vancouver region") +
        ylab("graffiti count") +
        xlab("Vancouver region")

    # save eda figure into the designated output_file path
    ggsave(output_file, violin_plot)
    paste("ead data figure saved as", output_file)
}

# call the main function when script is executed
main(opt)