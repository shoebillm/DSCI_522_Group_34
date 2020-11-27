Hypothesis testing for the counts of graffiti in two areas of Vancouver
================
Kangbo Lu, Siqi Zhou, Mitchie Zhao, Mengyuan Zhu </br>
2020/11/26 (updated: 2020-11-27)

-   [Summary](#summary)
-   [Introduction](#introduction)
-   [Methods](#methods)
    -   [Exploratory Data Analysis](#exploratory-data-analysis)
    -   [Statistical Analysis](#statistical-analysis)
    -   [Results & Discussion](#results-discussion)
-   [References](#references)

# Summary

In this research project, we try to answer the research question of
whether the number of graffiti of Vancouver’s Downtown area is the same
as the number of graffiti of Vancouver’s Strathcona area.

Due to the skewness of our sample distribution, we used the median as
the test statistics and set the *α* = 0.05 with the two-tailed
permutation test method to study the difference in the median.

For statistical analysis, we conducted a simulation with 10000
permutations, plotted the confidence interval of the simulated
null-distribution with the test statistics, and calculated the p-value
to draw conclusion.

# Introduction

Here we attempt to conduct a hypothesis testing with a suitable test
flavor to answer a statistical research question, that is, whether the
number of graffiti of Vancouver’s downtown area differs from the number
of graffiti of the Vancouver Strathcona area.

We proposed to sequentially do exploratory data analysis, determine what
features and columns to be retrieved to support our hypothesis testing,
and attach with a suitable test flavor to verify whether the median
number of graffiti per location of Vancouver’s downtown area differs
from the median number of graffiti per location of Vancouver’s
Strathcona area.

According to the data visualizations, a suitable estimator for our
research question is the median since we are interested in the most
common number of graffiti in the two regions and the median is not as
sensitive to extreme values as it is mathematically defined by the the
middle value of a distribution.

The R and Python programming languages (R Core Team 2020; Van Rossum and
Drake 2009) and the following R and Python packages were used to perform
the analysis: docopt (de Jonge 2018), knitr (Xie 2020), tidyverse
(Wickham et al. 2019), ggplot2 (Wickham 2016), infer (Bray et al. 2020).
The code used to perform the analysis and create this report can be
found here:
<a href="https://github.com/UBC-MDS/DSCI_522_Group_34/blob/main/src/analysis.R" class="uri">https://github.com/UBC-MDS/DSCI_522_Group_34/blob/main/src/analysis.R</a>.

# Methods

## Exploratory Data Analysis

The dataset used in this project provides information on the location of
sites with graffiti as identified by City staff. It is sourced from the
Vancouver Open Data Portal, specifically specifically [this
file](https://opendata.vancouver.ca/explore/dataset/graffiti/information).
The license of data can be found
[here](https://opendata.vancouver.ca/pages/home/).

<div class="figure">

<img src="../src/eda_files/figure-gfm/eda-1.png" alt="Figure 1. Distribution of graffiti count by Vancouver region: downtown and Strathcona area" width="60%" />
<p class="caption">
Figure 1. Distribution of graffiti count by Vancouver region: downtown
and Strathcona area
</p>

</div>

After conducting exploratory data analysis, we chose the median as the
estimator. From the above violin plot of the distributions of two
classes, we can observe the sample distributions are skewed to the
right. The long right tail of the distributions also make the median the
suitable test flavor because median is not as sensitive to extreme
values as it is mathematically defined by the middle value of a
distribution.

## Statistical Analysis

To estimate the sampling distribution of the test statistic we need many
samples generated under the strong null hypothesis. If the null
hypothesis is true, changing the exposure would have no effect on the
outcome. By randomly shuffling the exposures we can make up as many
‘null’ data sets as we like. If the null hypothesis is true, the
shuffled data sets should look like the real data. Otherwise, they
should look different from the real data. Comparing the shuffled test
statistics to the real test statistic gives a p-value. Then, we compare
the p-value with our defined threshold *α* = 0.05 to draw conclusion for
our research question.

**Estimator:**  
median number of graffiti per recorded location

**Hypothesis**  
*H*<sub>0</sub>: the median number of graffiti per recorded location of
Vancouver Downtown area is the same as the median number of graffiti per
recorded location of Vancouver Strathcona area

*H*<sub>*a*</sub>: the median number of graffiti per recorded location
of Vancouver Downtown area is not the same as the median number of
graffiti per recorded location of Vancouver Strathcona area

**Test Flavor**  
Two tailed permutation test for the median.

**Test Statistics**  
We use delta represent the difference of the median values of the counts
of graffiti in each area.

## Results & Discussion

First we calculated the median values of the counts of the 2 areas of
our interest. The medians of the count of graffiti per location of the
two areas are listed below:

<div class="figure">

<img src="../results/table1.png" alt="Figure 1. Results of computed median values of the 2 classes" width="40%" />
<p class="caption">
Figure 1. Results of computed median values of the 2 classes
</p>

</div>

To look at whether our null hypothesis is valid, we conducted a
simulation with 10000 permutations with the differences in medians. The
figure below visualize the simulated null distribution with the test
statistics.

<div class="figure">

<img src="../results/analysis.png" alt="Figure 1. The simulation-based distribution of the null hypothesis" width="40%" />
<p class="caption">
Figure 1. The simulation-based distribution of the null hypothesis
</p>

</div>

Then, we calculated the corresponding p-value of the null distribution
for drawing conclusion:

<div class="figure">

<img src="../results/table2.png" alt="Figure 2. The corresponding p-value of the null hypothesis" width="40%" />
<p class="caption">
Figure 2. The corresponding p-value of the null hypothesis
</p>

</div>

The test statistics is 0 for the sample. Calculating p-value from null
distribution, we got p-value is 1, which is larger than 0.05. It
indicated that there is no statistically significant difference between
the median of counts of graffiti per recorded location in the 2 areas in
Vancouver. We don’t have enough confidence to reject the null hypothesis
that the median number of graffiti per recorded location of Vancouver
Downtown area is the same as the median number of graffiti per recorded
location of Vancouver Strathcona area.

# References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-infer" class="csl-entry">

Bray, Andrew, Chester Ismay, Evgeni Chasnovski, Ben Baumer, and Mine
Cetinkaya-Rundel. 2020. *Infer: Tidy Statistical Inference*.
<https://CRAN.R-project.org/package=infer>.

</div>

<div id="ref-docopt" class="csl-entry">

de Jonge, Edwin. 2018. *Docopt: Command-Line Interface Specification
Language*. <https://CRAN.R-project.org/package=docopt>.

</div>

<div id="ref-R" class="csl-entry">

R Core Team. 2020. *R: A Language and Environment for Statistical
Computing*. Vienna, Austria: R Foundation for Statistical Computing.
<https://www.R-project.org/>.

</div>

<div id="ref-Python" class="csl-entry">

Van Rossum, Guido, and Fred L. Drake. 2009. *Python 3 Reference Manual*.
Scotts Valley, CA: CreateSpace.

</div>

<div id="ref-ggplot2" class="csl-entry">

Wickham, Hadley. 2016. *Ggplot2: Elegant Graphics for Data Analysis*.
Springer-Verlag New York. <https://ggplot2.tidyverse.org>.

</div>

<div id="ref-tidyverse" class="csl-entry">

Wickham, Hadley, Mara Averick, Jennifer Bryan, Winston Chang, Lucy
D’Agostino McGowan, Romain François, Garrett Grolemund, et al. 2019.
“Welcome to the <span class="nocase">tidyverse</span>.” *Journal of Open
Source Software* 4 (43): 1686. <https://doi.org/10.21105/joss.01686>.

</div>

<div id="ref-knitr" class="csl-entry">

Xie, Yihui. 2020. *Knitr: A General-Purpose Package for Dynamic Report
Generation in r*. <https://yihui.org/knitr/>.

</div>

</div>
