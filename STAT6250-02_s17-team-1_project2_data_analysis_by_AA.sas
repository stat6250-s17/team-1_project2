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
'Research Question: What are the three lowest happiness raking countries ?'
;

title2
'Rationale: This would help us find the countries that are less happy.'
;


*
Note: This drows comparison between the happiness rank of each country.
Methodology: We would use the merged dataset to run the "proc sort"  to  sort the data in a descending order and find out 
what countries have the lowest happiness rank are.
Limitations:  We may end up with some countries with the same happiness rank.
Followup Steps: We could look at another variable to determine the answer of the research question.
;

proc print
        data=Rank2016_raw_with_yoy_change_sorted
    ;
    id
        Country
    ;
    var
        Rank_change_2015_to_2016
    ;
run;

title;
footnote;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;
*
title1
'Research Question: what is the average happiness rate among the countries ?'
;

title2
'Rationale: This will show us the average score of the happiness rate among the countries.'
;

*
Note: This sets a threshold of what the average rate of  happiness among teh dataset.
Methodology: By applying the "proc means" statement then sorting the dataset to cakcualte the average rate of happiness in the dataset.
Limitations:  Since we use the mean to find out the average, we may come across countries that has either low or high rate of happiness
so these countries may impact the result.
Followup Steps: Try to divide the happiness rate into three subsets with minimum variance in each subset and caluculte the average of 
each subset.
;
proc print
        data=Rank2016_raw_with_yoy_change_sorted
    ;
    
    var
        Rank_change_2015_to_2016
    ;
run;

title;
footnote;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;
*
title1
'Research Question: Based on year 2015 data, can we say that the happiness rating of 2015 is higher than 2016?    ?'
;

title2
'Rationale: This should help us see whether the counties increased or decreased in their happiness rate throughout the years.'
;

*
Note: This shows a comparison between the rate of  happiness in  year 2015 and 2016.
Methodology: One way to think abouth this iss apply the regression analysis betweeen the two years.
Limitations:  Some variables may not make the result accurate.
Followup Steps: Try to apply the "proc glm" statement.
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
