# analysis.R
#
# author: UBC MDS Group 34,Kangbo Lu, Siqi Zhou, Mitchie Zhao, Mengyuan Zhu
#
# date: 2020-11-25
#
# this script takes 2 arguments: a relative filename path to read input data and a relative path to store analysis figure
#
# this script leads a simulated null-hypothesis test to see whether the counts of graffiti of 2 areas are different.
# we sequencially calculated the median, generated the null distribution,computed the p value and then made a visualization.
#
# Usage: Rscript src/analysis.R --input="data/processed/processed.csv" --output="results/analysis.png"

"This script downloads the dataset and stores it in the designated location.
Usage: analysis.R --input=<input_file> --output=<output_file>
Options:
--input=<input_file>    Takes a local relative filename path to read input data
--output=<output_file>  Takes a local relative filename path to store analysis figure
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
  
  # read data
  graffiti <- read_delim(input_file, delim = ";")
  
  # define the statistical analysis pipeline: 
    
  ## choose test statistics as medianS
  ## calculate the difference of the medians in each geo_local_area  
  median_count_estimates <- graffiti %>% 
    group_by(geo_local_area) %>% 
    summarize(median_count = median(count))
  
  ## calculate the difference of sample median, store it into a variable "delta_sample"
  delta_sample <- diff(median_count_estimates$median_count)
    
  # use permutation method to fulfill the simulation, 
  set.seed(1)
    
  ## simulate the null distribution
  null_distribution <- graffiti %>% 
    specify(formula = count ~ geo_local_area)  %>% 
    
    ## made the assumption that each observation is independent with others
    hypothesize(null = "independence") %>% 
    
    ## do 10000 times permutations to generate the null hypothesis distribution
    generate(reps = 10000, type = "permute")  %>% 
    calculate(stat = "diff in medians", 
              order = c("Downtown", "Strathcona"))
    
  # define the variable ho_dist to refer the null distribution
  h0_dist <- null_distribution %>% 
    visualize(bins = 20) +
    theme(text = element_text(size=20))
  
  # choose the threshold is 0.5 in two-side test
  threshold <- quantile(null_distribution$stat, c(0.025, 0.975))
    
  ## visualize the positions of the 2 quantiles and the variable delta_sample we defined previously
  analysis_dist <- h0_dist + 
    geom_vline(xintercept = c(threshold[[1]], threshold[[2]]), 
               color = "blue",
               lty = 2) +
    geom_vline(xintercept = delta_sample, color = "red")
  
  # calculate p-value of the null distribution we generated
  p_value <- null_distribution %>% 
    get_pvalue(obs_stat = delta_sample, direction = "both")
    
  ## generate a table contains the 2 important parametres
  analysis_table <- cbind(delta_sample=delta_sample, p_value=p_value)
  
  # save the analysis figure into output_file
  ggsave(output_file, analysis_dist)
  paste("analysis figure saved as", output_file)
}

# call the main function
main(opt)

