# eda_graffiti.R
#
# author: UBC MDS Group 34,author: Kangbo Lu, Siqi Zhou, Mitchie Zhao, Mengyuan Zhu
#
# date: 2020-11-25
#
## this script deploys the violin plot to show the distribution of the count of graffiti per area in 2 regions of Vancouver.
#
# this script takes 2 arguments: a relative filename path to read input data and a relative filename path to store eda figure
#
## input_file here refers to the pre-precessed data after running process_data.R
#
## output_file refers to a .png figure contains the distribution of samples
#
#
# Usage: Rscript src/eda_graffiti.R --input="data/processed/processed.csv" --output="results/graffiti_eda.png"
#
"This script downloads the dataset and stores it in the designated location.
Usage: eda_graffiti.R --input=<input_file> --output=<output_file>
Options:
--input=<input_file>    Takes a local relative filename path to read input data
--output=<output_file>  Takes a local relative filename path to store eda figure
" -> doc

# import libraries/packages

library(docopt)
library(tidyverse)
library(ggplot2)

opt <- docopt(doc)

#define the main function

main <- function(opt) {
    
## join relative file paths to absolute file paths
    
    input_file <- file.path(getwd(), opt$input)
    output_file <- file.path(getwd(), opt$output)

# exploratory data analysis pipeline
#    
## read-in the pre-processed file after process_data.R
    
    graffiti <- read_delim(input_file, delim = ";")
    
## Use ggplot in R to draw the distribution figure:
## Distribution of graffiti count by Vancouver region    
#    
    violin_plot <- graffiti %>%
        ggplot(aes(x = geo_local_area, y = count)) +
        geom_violin(trim = FALSE) +
        stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "blue") +
        ggtitle("Distribution of graffiti count by Vancouver region") +
        ylab("graffiti count") +
        xlab("Vancouver region")

## save eda figure into the designated output_file path
    ggsave(output_file, violin_plot)
    paste("ead data figure saved as", output_file)
}
# call the main function

main(opt)
