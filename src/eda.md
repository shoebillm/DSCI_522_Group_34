Exploratory data analysis of Vancouver Graffiti Data
================

# Summary of the dataset

The dataset used in this project provides information on the location of
sites with graffiti as identified by City staff. It is sourced from the
[Vancouver Open Data Portal](https://opendata.vancouver.ca/pages/home/),
specifically [this
file](https://opendata.vancouver.ca/explore/dataset/graffiti/information/).
The license of data can be found
[here](https://opendata.vancouver.ca/pages/licence/).

There are 8,028 rows and 3 columns in our dataset. Each row in the
dataset records the counts the number of graffiti incidents by the
geographic local area of Vancouver along with the spatial representation
of the location by coordinates stored as JSON format.

    ## # A tibble: 6 x 3
    ##   COUNT `Geo Local Area`   Geom                                                 
    ##   <dbl> <chr>              <chr>                                                
    ## 1     2 Fairview           "{\"type\": \"Point\", \"coordinates\": [-123.140194~
    ## 2     1 West End           "{\"type\": \"Point\", \"coordinates\": [-123.131390~
    ## 3     1 West End           "{\"type\": \"Point\", \"coordinates\": [-123.132078~
    ## 4     1 Marpole            "{\"type\": \"Point\", \"coordinates\": [-123.128122~
    ## 5     4 Mount Pleasant     "{\"type\": \"Point\", \"coordinates\": [-123.107106~
    ## 6     2 Grandview-Woodland "{\"type\": \"Point\", \"coordinates\": [-123.062764~

    ## Rows: 8,027
    ## Columns: 3
    ## $ COUNT            <dbl> 2, 1, 1, 1, 4, 2, 2, 3, 2, 1, 1, 1, 2, 2, 1, 2, 1,...
    ## $ `Geo Local Area` <chr> "Fairview", "West End", "West End", "Marpole", "Mo...
    ## $ Geom             <chr> "{\"type\": \"Point\", \"coordinates\": [-123.1401...

We are investigating into 2 local areas of Vancouver; they are the
‘Downtown’ and the ‘Strathcona’ regions. We attempt to conduct a
hypothesis testing with a suitable test flavor to answer a statistical
research question, that is, whether the number of graffiti per location
of Vancouver’s downtown area differs from the number of graffiti per
location of the Vancouver Strathcona area.

After selecting relevant columns, there are 2,121 observations related
our research interest and below we show the number of observations for
each interested Vancouver region and the first few line of the dataset .

    ## [1] "Number of rows: 2121"

    ## # A tibble: 6 x 2
    ##   count geo_local_area
    ##   <dbl> <chr>         
    ## 1     1 Strathcona    
    ## 2     1 Strathcona    
    ## 3    10 Downtown      
    ## 4     3 Downtown      
    ## 5     7 Strathcona    
    ## 6    13 Downtown

| Downtown | Strathcona |
|---------:|-----------:|
|     1084 |       1037 |

Table 1. Counts of observation for each class.

# Exploratory analysis on the dataset

From the below violin plot of the distributions of two classes, we can
observe the sample distributions are skewed to the right. Based on the
data visualizations, we can say a suitable estimator for our research
question is the median because we are interested in the most common
number of the graffiti in the two regions and the central tendency of
the distribution is most helpful for this given the shape of this sample
distribution is bell-shaped and skewed to the right. The long right tail
of the distributions also make the median the suitable test flavor
because median is not as sensitive to extreme values as it is
mathematically defined by the middle value of a distribution.

![](eda_files/figure-gfm/eda-1.png)<!-- -->

Figure 1. Distribution of graffiti count by Vancouver region

## Reference

“Graffiti.” City of Vancouver Open Data Portal, 3 Feb. 2020,
<https://opendata.vancouver.ca/explore/dataset/graffiti/information/>.
