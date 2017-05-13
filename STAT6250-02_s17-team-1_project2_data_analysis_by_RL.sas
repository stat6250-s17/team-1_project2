*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic dataset to address several research
questions regarding world happiness rankings and national ecological footprint

Dataset Name: country_analytic_file created in external file
STAT6250-02_s17-team-1_project2_data_preparation.sas, which is assumed to be
in the same directory as this file

See included file for dataset properties
;

* environmental setup;

* set relative file import path to current directory (using standard SAS trick);
X "cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILENAME))))""";


* load external file that generates analytic dataset country_analytic_file;
%include '.\STAT6250-02_s17-team-1_project2_data_preparation.sas';


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;
*
Question: What are top five countries that have the biggest ranking increasing 
from 2015 to 2016?

Rationale: This helps us understand that which countries are doing their best 
to potentially improve the happiness rankings.

Note: This compares the column "Happiness Rank" from 2015 dataset to the column 
of the same name from 2016 dataset.

Methodology: 

Limitations: 

Followup Steps: 
;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;
*
Question: Does the "Urban Land" in the dataset countries be used to predict the 
"Happiness score" in the 2016 World Happiness Report?

Rationale: This helps us understand what kind of impact does the urban land has 
on the happiness score.

Note: This compares the column "Urban Land" from countires to the column 
"Happiness Score" from 2016.

Methodology: 

Limitations: 

Followup Steps: 
;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;
*
Question: Does the population have relationship with the trust(Government 
Corruption)?

Rationale: More population usually means hard to manage the county, so this 
helps us understand the relationship between government trust and population.

Note: This will compare “Population” from data set countires to the column 
"Trust(Government Corruption) from the 2016."

Methodology: 

Limitations: 

Followup Steps: 
;
