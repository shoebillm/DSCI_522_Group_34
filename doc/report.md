Hypothesis testing for the counts of graffiti in two areas of Vancouver
================
Kangbo Lu, Siqi Zhou, Mitchie Zhao, Mengyuan Zhu </br>
2020/11/26 (updated: 2020-12-05)

-   [Summary](#summary)
-   [Introduction](#introduction)
-   [Methods](#methods)
    -   [Exploratory Data Analysis](#exploratory-data-analysis)
    -   [Statistical Analysis](#statistical-analysis)
    -   [Results & Discussion](#results-discussion)
-   [References](#references)

# Summary

In this research project, we tried to answer the research question of
whether the number of graffiti of Vancouver’s Downtown area is the same
as the number of graffiti of Vancouver’s Strathcona area.

Due to the skewness of our sample distribution, we used the median as
the test statistics and set the *α* = 0.05 with the two-tailed
permutation test method to study the difference in the median.

For statistical analysis, we conducted a simulation with 10000
permutation replicates, plotted the confidence interval of the simulated
null-distribution with the test statistics, and calculated the p-value
to draw the conclusion.

# Introduction

Here we attempted to conduct a hypothesis test with a suitable test
flavor to answer a statistical research question, that is, whether the
number of graffiti of Vancouver’s downtown area differs from the number
of graffiti of the Vancouver Strathcona area (City of Vancouver 2020).

We proposed to sequentially do exploratory data analysis, determine what
features and columns to be retrieved to support our hypothesis testing,
and attach with a suitable test flavor to verify whether the median
number of graffiti per location of Vancouver’s downtown area differs
from the median number of graffiti per location of Vancouver’s
Strathcona area (Ismay and Kim 2019).

According to the data visualizations, a suitable estimator for our
research question is the median since we are interested in the most
common number of graffiti in the two regions and the median is not as
sensitive to extreme values as it is mathematically defined by the the
50th percentile of a distribution (Bzik 2014).

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
sites with graffiti as identified by City staff. It was sourced from the
Vancouver Open Data Portal, specifically [this
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
right. The long right tail of the distributions also makes the median a
suitable test flavor, since the median is not as sensitive to extreme
values as it is mathematically defined by the 50th percentile of a
distribution.

## Statistical Analysis

To estimate the sampling distribution of the test statistic we need many
samples generated under the null hypothesis. If the null hypothesis is
true, changing the exposure would have no effect on the outcome. By
randomly shuffling the exposures we can make up as many ‘null’ data sets
as we like. If the null hypothesis is true, the shuffled data sets
should look similar to the real data. Otherwise, they should look
different from the real data. Comparing the shuffled test statistics to
the real test statistics gives a p-value. Then, we compared the p-value
with our defined threshold *α* = 0.05 to draw the conclusion for our
research question.

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
We used delta to represent the difference between the median counts of
graffiti in each area.

## Results & Discussion

First we calculated the median values of the counts of the 2 areas of
our interest. The medians of the count of graffiti per location of the
two areas are listed below:

<div class="figure">

<img src="../results/table1.png" alt="Table 1. Results of computed median values of the 2 classes" width="50%" />
<p class="caption">
Table 1. Results of computed median values of the 2 classes
</p>

</div>

To look at whether our null hypothesis is valid, we conducted a
simulation with 10000 permutation replicates with the differences in
medians. The figure below visualizes the simulated null distribution
with the test statistics.

<div class="figure">

<img src="../results/analysis.png" alt="Figure 2. The simulation-based distribution of the null hypothesis" width="50%" />
<p class="caption">
Figure 2. The simulation-based distribution of the null hypothesis
</p>

</div>

Then, we calculated the corresponding p-value of the null distribution
for drawing the conclusion:

<div class="figure">

<img src="../results/table2.png" alt="Table 2. The corresponding p-value of the null hypothesis" width="50%" />
<p class="caption">
Table 2. The corresponding p-value of the null hypothesis
</p>

</div>

The test statistics is 0 for the sample. The calculated p-value is 1,
which is larger than 0.05. It indicated that there is no statistically
significant difference between the median of counts of graffiti per
recorded location in the 2 areas in Vancouver. We don’t have enough
confidence to reject the null hypothesis that the median number of
graffiti per recorded location of Vancouver Downtown area is the same as
the median number of graffiti per recorded location of Vancouver
Strathcona area.

Future work includes further exploratory data analysis to take full
advantage of the coordinate data on the map to understand the
distribution of graffiti in different areas of Vancouver. To analyze the
Downtown and Strathcona area is a bit segmentary to represent the whole
regional situation of Vancouver. We would study and observe the graffiti
situation and differences in other areas based on a more macroscopic
perspective. Another hypothesis testing might be conducted as a
statistical analysis comparison of our current permutation test.
Meanwhile, we also might improve the preprocessing to eliminate
redundant and unrepresentative data points since there are many zero
values in terms of Downtown and Strathcona areas, leading to a very
centralized distribution.

# References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-infer" class="csl-entry">

Bray, Andrew, Chester Ismay, Evgeni Chasnovski, Ben Baumer, and Mine
Cetinkaya-Rundel. 2020. *Infer: Tidy Statistical Inference*.
<https://CRAN.R-project.org/package=infer>.

</div>

<div id="ref-quantile" class="csl-entry">

Bzik, Thomas J. 2014. *Quantile Estimation*. ASTM Standardization.
<https://www.astm.org/SNEWS/images/ja14_dp.pdf>.

</div>

<div id="ref-graffiti" class="csl-entry">

City of Vancouver. 2020. *Graffiti*.
<https://opendata.vancouver.ca/explore/dataset/graffiti/information/>.

</div>

<div id="ref-docopt" class="csl-entry">

de Jonge, Edwin. 2018. *Docopt: Command-Line Interface Specification
Language*. <https://CRAN.R-project.org/package=docopt>.

</div>

<div id="ref-moderndive" class="csl-entry">

Ismay, Chester, and Albert Y. Kim. 2019. *Statistical Inference via Data
Science: A ModernDive into r and the Tidyverse*. New York: Chapman;
Hall/CRC.

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
