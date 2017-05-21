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
'Research Question: Are HDI and GDP significant to total ecological footprint?'
;

title2
'Rationale: This will help see which variables would make good predictors for the
regression model (ecological_footprint = HDI + GDP_per_Capita HDI*GDP_per_Capita).'
;

footnote1
"HDI, GDP_per_Capita, and HDI*GDP_per_Capita have small p-values, so they are all significant to the model."
;

footnote2
"The contour plot depicts the regression model as exponential."
;

footnote3
"This means that the more developed a country is, the greater the value of output each person can produce
for the country."
;

*
Note: This looks at the merged data set, but only uses columns from 'Countries_Edited'.

Methodology: Use Proc glm to get the regression model ecological_footprint = HDI + GDP_per_Capita HDI*GDP_per_Capita
from the data set country_analytic_file. Use region as the class, HDI and GDP_per_Capita as predictors, and HDI*GDP_per_Capita
as the interaction term.

Limitations: Does not incorporate the happiness data set.

Followup Steps: Could try to use happiness as the response variable with the same explanatory variables.
;

proc GLM data=country_analytic_file;
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
"Looking at both Type I and Type III output, only urban land appears to significantly impact happiness."
;

footnote2
"The reason for this could be humans spend the most time in urban space, so the quality of 
urban space could have a significant impact on their happiness."
;

footnote3
"It is possible that all the other resource lands provide the basis to sustain society, so urban space
is the 'extra' factor."
;

*
Note: This compares the columns of all the different resources in the 'Countries-Edited' data set
with the happiness_score from 'Ranked2016_Edited'.

Methodology: Use Proc glm to get the regression model Happiness_Score = Cropland+Grazing_Land+Forest_Land+Fishing_Water+Urban_Land
from the merged data set country_analytic_file. Happiness is the response variable, while the rest are explanatory variables.

Limitations: There is no interation element in this regression model.

Followup Steps: Could use region as a group factor to be used as an interaction model to see if there are any
changes to the results.
;

Proc GLM data = country_analytic_file;
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
"There is a positive correlation between Happiness in 2015 to Happiness in 2016."
;

footnote2
"This means Happiness in most countries did increase."
;

footnote3
"There appear to be 4 outliers, removing these should improve the correlation strength."
;

*
Note: This will compare the column Happiness_Score_2015 from data set 'Rank2015-Edited' and Happiness_Score
from data set 'Rank2016-Edited' .

Methodology: Use proc reg to run the regression model with Happiness_score as the response
variable and happiness_score_2015 as the explanatory variable. This function will generate
several plots in order to analyze the relationship.

Limitations: The function points out the outliers, but they will have to be manually removed
from the data set.

Followup Steps: Could look at the countries that decreased in happiness and see what could
have lead to their unhappiness.
;

proc reg 
    data=country_analytic_file
    ;
    model 
		happiness_score=happiness_score_2015
    ;
run;

title;
footnote;
