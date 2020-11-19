# DSCI_522_Group_34

# Topic

  - contributors: Kangbo Lu, Siqi Zhou, Mitchie Zhao, Mengyuan Zhu

Milestone 1 of group 34 of a data analysis project for DSCI 522 (Data Science workflows); a
course in the Master of Data Science program at the University of
British Columbia.

## About

xxx

xxx

## Report

The final report can be found
[here](xxx).

## Usage

There are two suggested ways to run this analysis:

#### 1\. Using Docker

*note - the instructions in this section also depends on running this in
a unix shell (e.g., terminal or Git Bash)*

To replicate the analysis, install
[Docker](https://www.docker.com/get-started). Then clone this GitHub
repository and run the following command at the command line/terminal
from the root directory of this project:

    docker run --rm -v /$(pwd):/home/rstudio/breast_cancer_predictor ttimbers/bc_predictor:v4.0 make -C /home/rstudio/breast_cancer_predictor all

To reset the repo to a clean state, with no intermediate or results
files, run the following command at the command line/terminal from the
root directory of this project:

    docker run --rm -v /$(pwd):/home/rstudio/breast_cancer_predictor ttimbers/bc_predictor:v4.0 make -C /home/rstudio/breast_cancer_predictor clean

#### 2\. Without using Docker

To replicate the analysis, clone this GitHub repository, install the
[dependencies](#dependencies) listed below, and run the following
command at the command line/terminal from the root directory of this
project:

    make all

To reset the repo to a clean state, with no intermediate or results
files, run the following command at the command line/terminal from the
root directory of this project:

    make clean

## Dependencies

  - Python 3.7.4 and Python packages:
      - docopt=0.6.2
      - requests=2.22.0
      - pandas=0.25.1R
      - feather-format=0.4.0
  - R version 3.6.1 and R packages:
      - knitr=1.26
      - feather=0.3.5
      - tidyverse=1.3.0
      - caret=6.0-85
      - ggridges=0.5.2
      - ggthemes=4.2.0
  - GNU make 4.2.1

## License

xxx

# References

<div id="refs" class="references hanging-indent">

<div id="ref-Dua2019">

xxx <http://archive.ics.uci.edu/ml>.

</div>

<div id="ref-Streetetal">

xxx <https://doi.org/10.1117/12.148698>.

</div>

</div>
