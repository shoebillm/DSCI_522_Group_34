# analysis.R
# author: Kangbo Lu, Mengyuan Zhu, Mitchie Zhao, Siqi Zhou
# date: 2020-11-28
# usage example: Rscript src/analysis.R --input="data/processed/processed.csv" --output="results/analysis.png"

"This script conducts a simulated null-hypothesis test to see whether the counts of graffiti of 2 areas are different.

Usage: analysis.R --input=<input_file> --output=<output_file>
Options:
--input=<input_file>    Takes a local relative path includes filename to read processed csv data
--output=<output_file>  Takes a local relative path includes filename to store analysis figure
" -> doc

# import libraries/packages
library(docopt)
library(tidyverse)
library(ggplot2)
library(infer)
opt <- docopt(doc)

# define the main function
main <- function(opt) {
    # join relative file paths to absolute file paths
    input_file <- file.path(getwd(), opt$input)
    output_file <- file.path(getwd(), opt$output)

    # read data with delimiter of ';'
    graffiti <- read_delim(input_file, delim = ";")

    # choose test statistics as medians
    # calculate the test statistics, store it into a variable "delta_sample"
    median_count_estimates <- graffiti %>%
        group_by(geo_local_area) %>%
        summarize(median_count = median(count))
    delta_sample <- diff(median_count_estimates$median_count)

    # simulate the null distribution with permutation for 10000 repetitions
    # and calculate the difference in medians for the two categories
    set.seed(1)
    null_distribution <- graffiti %>%
        specify(formula = count ~ geo_local_area)  %>%
        hypothesize(null = "independence") %>%
        generate(reps = 10000, type = "permute")  %>%
        calculate(stat = "diff in medians", 
                  order = c("Downtown", "Strathcona"))

    # define the variable ho_dist to refer the null distribution
    h0_dist <- null_distribution %>%
        visualize(bins = 20) +
        theme(text = element_text(size = 20))

    # choose the threshold alpha as 0.5 in two-sided test
    threshold <- quantile(null_distribution$stat, c(0.025, 0.975))

    # visualize the confidence interval and the test statistics we defined previously
    analysis_dist <- h0_dist +
        geom_vline(xintercept = c(threshold[[1]], threshold[[2]]),
                color = "blue",
                lty = 2) +
        geom_vline(xintercept = delta_sample, color = "red")

    # calculate p-value for the simulated null distribution
    p_value <- null_distribution %>%
        get_pvalue(obs_stat = delta_sample, direction = "both")

    # generate a table contains the 2 important parameters
    analysis_table <- cbind(delta_sample = delta_sample, p_value = p_value)

    # save the analysis figure into output_file
    ggsave(output_file, analysis_dist)
    paste("analysis figure saved as", output_file)
}

# call the main function when script is executed
main(opt)
