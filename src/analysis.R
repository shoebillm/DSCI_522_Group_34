# analysis.R
# author: Kangbo Lu, Mengyuan Zhu, Mitchie Zhao, Siqi Zhou
# date: 2020-11-28
# usage example: Rscript src/analysis.R --input="data/processed/processed.csv" --output1="results/analysis.png" --output2="data/analysis/median_count_estimates.csv" --output3="data/analysis/analysis_table.csv"

"This script conducts a simulated null-hypothesis test to see whether the counts of graffiti of 2 areas are different.
Usage: analysis.R --input=<input_file> --output1=<output_file1> --output2=<output_file2> --output3=<output_file3>
Options:
--input=<input_file>    Takes a local relative path including filename to read processed csv data
--output1=<output_file1>  Takes a local relative path including filename to store analysis figure
--output2=<output_file2>  Takes a local relative path including filename to store median count estimates table
--output3=<output_file3>  Takes a local relative path including filename to store analysis result table
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
    output_file1 <- file.path(getwd(), opt$output1)
    output_file2 <- file.path(getwd(), opt$output2)
    output_file3 <- file.path(getwd(), opt$output3)

    # read data with delimiter of ';'
    graffiti <- read_delim(input_file, delim = ";")

    # choose test statistics as medians
    # calculate the test statistics, store it into a variable "delta_sample"
    median_count_estimates <- graffiti %>%
        group_by(geo_local_area) %>%
        summarize(median_count = median(count))
    delta_sample <- diff(median_count_estimates$median_count)
    
    # save median_count_estimates data with the given file path includes filename
    write_csv(median_count_estimates, output_file2)
    paste("Median count estimates data saved as", output_file2)

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
        geom_vline(
            xintercept = c(threshold[[1]], threshold[[2]]),
            color = "blue",
            lty = 2
        ) +
        geom_vline(xintercept = delta_sample, color = "red") +
        labs(title = 'The simulation-based distribution of the null hypothesis',
             x = "Diff of sample medians",
             y = "Graffiti count") +
        theme(
            plot.title = element_text(face = "bold", size = 14, hjust = 0.5),
            axis.title = element_text(face = "bold", size = 12)
        )

    # calculate p-value for the simulated null distribution
    p_value <- null_distribution %>%
        get_pvalue(obs_stat = delta_sample, direction = "both")

    # generate a table contains the 2 important parameters
    analysis_table <- cbind(delta_sample = delta_sample, p_value = p_value)
    
    # save analysis result data with the given file path includes filename
    write_csv(analysis_table, output_file3)
    paste("Analysis result data saved as", output_file3)

    # save the analysis figure into output_file
    ggsave(output_file1, analysis_dist)
    paste("analysis figure saved as", output_file1)
}

# call the main function when script is executed
main(opt)
