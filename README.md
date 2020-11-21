# DSCI_522_Group_34

- Contributors: Kangbo Lu, Siqi Zhou, Mitchie Zhao, Mengyuan Zhu

Milestone 1 of group 34 of a data analysis project for DSCI 522 (Data Science workflows); a
course in the Master of Data Science program at the University of
British Columbia.

## About

Here we attempt to conduct a Hypothesis testing with a suitable test flavour
to answer a statistical research question, that is, whether 
the number of graffiti per location of Vancouver's downtown area 
differs from the number of graffiti per location of the Vancouver 
Strathcona area. We proposed to sequentially do exploratory data 
analysis, determine what features and columns to be retrieved to support 
our Hypothesis testing, and attach with a suitable test flavour 
to verify whether the median/mean number of graffiti per location 
of Vancouver's downtown area differs from the median/mean number of 
graffiti per location of Vancouver's Strathcona area. 

The data set that was used in this milestone 1 project is of information 
on the location of sites with graffiti as identified by City staff. 
This data in City systems is updated in the normal course of business, 
however, priorities and resources determine how fast a change, in reality, 
is reflected in the database. The extract on this web site is updated weekly. 
Locations are identified by address and therefore locations are approximate.
And it can be found 
[here](https://opendata.vancouver.ca/pages/home/),
specifically [this
file](https://opendata.vancouver.ca/explore/dataset/graffiti/information/?sort=count&dataChart=eyJxdWVyaWVzIjpbeyJjaGFydHMiOlt7InR5cGUiOiJib3hwbG90IiwiZnVuYyI6IkNPVU5UIiwieUF4aXMiOiJjb3VudCIsInNjaWVudGlmaWNEaXNwbGF5Ijp0cnVlLCJjb2xvciI6IiMwMjc5QjEiLCJjaGFydHMiOlt7ImZ1bmMiOiJNSU4iLCJ5QXhpcyI6ImNvdW50In0seyJmdW5jIjoiUVVBTlRJTEVTIiwieUF4aXMiOiJjb3VudCIsInN1YnNldHMiOjI1fSx7ImZ1bmMiOiJRVUFOVElMRVMiLCJ5QXhpcyI6ImNvdW50Iiwic3Vic2V0cyI6NTB9LHsiZnVuYyI6IlFVQU5USUxFUyIsInlBeGlzIjoiY291bnQiLCJzdWJzZXRzIjo3NX0seyJmdW5jIjoiTUFYIiwieUF4aXMiOiJjb3VudCJ9XX1dLCJ4QXhpcyI6Imdlb19sb2NhbF9hcmVhIiwibWF4cG9pbnRzIjo1MCwic29ydCI6IiIsImNvbmZpZyI6eyJkYXRhc2V0IjoiZ3JhZmZpdGkiLCJvcHRpb25zIjp7InNvcnQiOiJjb3VudCJ9fX1dLCJ0aW1lc2NhbGUiOiIiLCJkaXNwbGF5TGVnZW5kIjp0cnVlLCJhbGlnbk1vbnRoIjp0cnVlfQ%3D%3D&location=14,49.28084,-123.09806).
As for the data schema, mainly there are 3 columns related to 
our proposal. They are "COUNT", "GEO LOCAL AREA" and "GEOM". 
We utilized the "COUNT" and "GEO LOCAL AREA" columns to do permutation 
for our hypothesis testing.

## Report

The final report can be found
[here](https://github.com/UBC-MDS/DSCI_522_Group_34).

## License

The DSCI_522_Group_34 materials here are licensed under 
the MIT License Copyright (c) 2020 DSCI_522_Group_34. 
If re-using/re-mixing please provide attribution and link to this webpage.

# References

<div id="refs" class="references hanging-indent">

<div id="moderndive">

Modern Dive: An Introduction to Statistical and Data Sciences via R 
by Chester Ismay and Albert Y. Kim. <https://moderndive.com/index.html>.

</div>

<div id="quantile">

Quantile estimation by Thomas Bzik. 
<https://www.astm.org/SNEWS/images/ja14_dp.pdf>.

</div>

<div id="sml">

The missing question in supervised learning blog 
post by Vincenzo Coia. <https://github.com/vincenzocoia/vincenzocoia.github.io/blob/b9a5b5023e7d3dc0b135c032c7b1aa67376240db/_posts/2018-02-18-mean.md>.

</div>

</div>