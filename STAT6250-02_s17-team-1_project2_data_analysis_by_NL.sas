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

title1
'Research Question: Are HDIand GDP significant to total ecological footprint?'
;

title2
'Rationale: This will help see which variables would make good predictors for the
regression model (ecological_footprint = HDI + GDP_per_Capita HDI*GDP_per_Capita).'
;

footnote1
;

*
Note: This looks only at the ecological data set 'countries'.

Methodology: Use Proc glm to get the regression model from the data set. Use region
as region as the class.

Limitations: Does not incorporate the happiness data set.
Followup Steps: Could try to incorporate happiness data set in new regression
model.
;

proc GLM data=countries;
    class 
		region
    ;
	MODEL 
		Total_Ecological_Footprint = 
			HDI 
			GDP_per_Capita 
			HDI*GDP_per_Capita
    ;
run;

title;
footnote;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: Which resource consumptions contribute the most to a country’s happiness?'
;

title2
'Rationale: Rationale: This should help identify why type of consumption has the most 
positive effect on happiness.'
;

footnote1
;

*
Note: This compares the column all the different resources in the ecological data set
with the happiness score from 2016.

Methodology: Use the merged data set to run proc glm to see if the resource variables
have are significant to the result of happiness.

Limitations: 

Followup Steps: 
;

Proc GLM data = merged_data;
    class 
		region
    ;
	MODEL 
		Happiness_Score = 
			Cropland	
			Grazing_Land	
			Forest_Land	
			Fishing_Water	
			Urban_Land
	;
run;

title;
footnote;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Reserach Question: Did happiness score change from 2015 to 2016?'
;

title2
'Rationale: This will allow us to which countries increased or decreased in 
happiness.'
;

footnote1
;

*
Note: This will compare the column Happiness_Score from data set '2015' and data 
set '2016'.

Methodology: Can either run regression with '2015' as x adn '2016' as y, or 
find the difference between them.

Limitations: 

Followup Steps: 
;


title;
footnote;
