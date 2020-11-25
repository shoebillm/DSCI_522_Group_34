# author: UBC MDS Group 34
# date: 2020-11-25
# Example: Rscript src/eda_graffiti.R --input="data/processed/processed.csv" --output="results/graffiti_eda.png"

"This script downloads the dataset and stores it in the designated location.
Usage: eda_graffiti.R --input=<input_file> --output=<output_file>
Options:
--input=<input_file>    Takes a local relative filename path to read input data
--output=<output_file>  Takes a local relative filename path to store eda figure
" -> doc

library(docopt)
library(tidyverse)
library(ggplot2)

opt <- docopt(doc)

main <- function(opt) {
    # join relative file paths to absolute file paths
    input_file <- file.path(getwd(), opt$input)
    output_file <- file.path(getwd(), opt$output)

    # eda data
    graffiti <- read_delim(input_file, delim = ";")
    violin_plot <- graffiti %>%
        ggplot(aes(x = geo_local_area, y = count)) +
        geom_violin(trim = FALSE) +
        stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "blue") +
        ggtitle("Distribution of graffiti count by Vancouver region") +
        ylab("graffiti count") +
        xlab("Vancouver region")

    # save eda figure
    ggsave(output_file, violin_plot)
    paste("ead data figure saved as", output_file)
}

main(opt)
