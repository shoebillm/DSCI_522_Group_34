# author: UBC MDS Group 34
# date: 2020-11-25
# Example: Rscript src/analysis.R --input="data/processed/processed.csv" --output="results/analysis.png"

"This script downloads the dataset and stores it in the designated location.
Usage: analysis.R --input=<input_file> --output=<output_file>
Options:
--input=<input_file>    Takes a local relative filename path to read input data
--output=<output_file>  Takes a local relative filename path to store analysis figure
" -> doc

library(docopt)
library(tidyverse)
library(ggplot2)
library(infer)

opt <- docopt(doc)

main <- function(opt) {
  # join relative file paths to absolute file paths
  input_file <- file.path(getwd(), opt$input)
  output_file <- file.path(getwd(), opt$output)
  
  # read data
  graffiti <- read_delim(input_file, delim = ";")
  
  # test statistics
  # the difference of the medians
  median_count_estimates <- graffiti %>% 
    group_by(geo_local_area) %>% 
    summarize(median_count = median(count))
  
  # get diff of sample median
  delta_sample <- diff(median_count_estimates$median_count)

  set.seed(1)
  null_distribution <- graffiti %>% 
    specify(formula = count ~ geo_local_area)  %>% 
    hypothesize(null = "independence") %>% 
    generate(reps = 10000, type = "permute")  %>% 
    calculate(stat = "diff in medians", 
              order = c("Downtown", "Strathcona"))
  
  h0_dist <- null_distribution %>% 
    visualize(bins = 20) +
    theme(text = element_text(size=20))
  
  # visualize alpha and delta on H0 distribution
  threshold <- quantile(null_distribution$stat, c(0.025, 0.975))
  analysis_dist <- h0_dist + 
    geom_vline(xintercept = c(threshold[[1]], threshold[[2]]), 
               color = "blue",
               lty = 2) +
    geom_vline(xintercept = delta_sample, color = "red")
  
  # calculate p-value with infer
  p_value <- null_distribution %>% 
    get_pvalue(obs_stat = delta_sample, direction = "both")
  
  analysis_table <- cbind(delta_sample=delta_sample, p_value=p_value)
  
  # save analysis figure
  ggsave(output_file, analysis_dist)
  paste("analysis figure saved as", output_file)
}

main(opt)

