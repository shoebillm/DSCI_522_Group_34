Exploratory data analysis of the Geographic information of Graffati in Vancouver
================

# Summary of the data set

The data set that was used in this milestone 1 project is of information 
on the location of sites with graffiti, identified by Vancouver City staff on a weekly basis, and can be found
[here](https://opendata.vancouver.ca/pages/home/),
specifically [this file](https://opendata.vancouver.ca/explore/dataset/graffiti/information/?sort=count&dataChart=eyJxdWVyaWVzIjpbeyJjaGFydHMiOlt7InR5cGUiOiJib3hwbG90IiwiZnVuYyI6IkNPVU5UIiwieUF4aXMiOiJjb3VudCIsInNjaWVudGlmaWNEaXNwbGF5Ijp0cnVlLCJjb2xvciI6IiMwMjc5QjEiLCJjaGFydHMiOlt7ImZ1bmMiOiJNSU4iLCJ5QXhpcyI6ImNvdW50In0seyJmdW5jIjoiUVVBTlRJTEVTIiwieUF4aXMiOiJjb3VudCIsInN1YnNldHMiOjI1fSx7ImZ1bmMiOiJRVUFOVElMRVMiLCJ5QXhpcyI6ImNvdW50Iiwic3Vic2V0cyI6NTB9LHsiZnVuYyI6IlFVQU5USUxFUyIsInlBeGlzIjoiY291bnQiLCJzdWJzZXRzIjo3NX0seyJmdW5jIjoiTUFYIiwieUF4aXMiOiJjb3VudCJ9XX1dLCJ4QXhpcyI6Imdlb19sb2NhbF9hcmVhIiwibWF4cG9pbnRzIjo1MCwic29ydCI6IiIsImNvbmZpZyI6eyJkYXRhc2V0IjoiZ3JhZmZpdGkiLCJvcHRpb25zIjp7InNvcnQiOiJjb3VudCIsImxvY2F0aW9uIjoiMTQsNDkuMjgwODQsLTEyMy4wOTgwNiJ9fX1dLCJ0aW1lc2NhbGUiOiIiLCJkaXNwbGF5TGVnZW5kIjp0cnVlLCJhbGlnbk1vbnRoIjp0cnVlfQ%3D%3D&location=13,49.27564,-123.09724).
The license of data can be found [here](https://opendata.vancouver.ca/pages/licence/).
Each row in the data set represents summary statistics from measurements
of an image of a tumour sample, including the counts (The number of graffiti incidents at the location is shown.) 
,Geo Local Area(where the feature is found, derived from the feature's coordinates or address in the source system.There are 22 in total but we are only interested in 2 of them.) 
and the spatial representation of feature (represented in geo shape e.g.{"type":"Point","coordinates":[-123.036378723917,49.2399184707857]}). 
We are conducting investigate into 2 catogories in 'Geo Local Area', which is 'Downtown' and 'Strathcona'.
There are 8,028 observations in the whole data set, 2121 observations of our interest and 3 features.
There are 0 observation with missing values in the data set. Below we
show the number of each observations for the 2 catogories in Geo Local Area of our interest.

|   Downtown   |   Strathcona    |
| -----------: | --------------: |
|         1084 |           1037  |

Table 1. Counts of observation for the 2 Geo Local Areas.

# References

<div id="refs" class="references">

<div id="ref-Dua2019">

Dua, Dheeru, and Casey Graff. 2017. “UCI Machine Learning Repository.”
University of California, Irvine, School of Information; Computer
Sciences. <http://archive.ics.uci.edu/ml>.

</div>

<div id="ref-Streetetal">

Street, W. Nick, W. H. Wolberg, and O. L. Mangasarian. 1993. “Nuclear
feature extraction for breast tumor diagnosis.” In *Biomedical Image
Processing and Biomedical Visualization*, edited by Raj S. Acharya and
Dmitry B. Goldgof, 1905:861–70. International Society for Optics;
Photonics; SPIE. <https://doi.org/10.1117/12.148698>.

</div>

</div>