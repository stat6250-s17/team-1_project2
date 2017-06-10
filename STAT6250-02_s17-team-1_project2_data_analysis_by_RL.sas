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
'Research Question: What are top five countries that have the biggest ranking increasing from 2015 to 2016?'
;

title2
'Rationale: This helps us understand that which countries are doing their best to potentially improve the happiness rankings.'
;

footnote1
''
;

footnote2
''
;

footnote3
''
;

*
Note: This compares the column "Happiness Rank" from 2015 dataset to the column 
of the same name from 2016 dataset.

Methodology: When combining Rank2015 and Rank2016 during data preparation, take 
the difference of values of "Happiness_Rank" for each contry and create a new 
variable called Rank_change_2015_to_2016. Then, use proc sort to create a temporary
sorted table in descending by Rank_change_2015_to_2016. At last, use proc print to 
display the first five rows of the sorted dataset.

Limitations: This medthod does not account for countries with missing data.

Followup Steps: More clean values are needed to filter.
;
proc print
        data=country_analytic_file_sorted_RL(obs=5)
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

title1
'Research Question: Can the "Urban Land" in the dataset countries be used to predict the "Happiness score" in the 2016 World Happiness Report?'
;

title2
'Rationale: This helps us understand what kind of impact does the urban land has on the happiness score.'
;

footnote1
''
;

footnote2
''
;

footnote3
''
;

*
Note: This compares the column "Urban Land" from countires to the column 
"Happiness Score" from 2016.

Methodology: Use proc means to compute 5-number summaries of "Urban_Land" 
and "Happiness_Score". Then use proc format to create formats that bin both 
columns with respect to the proc means output.

Limitations: This method still needs manual associating the variables.

Followup Steps: Linear regression is a good approach for this problem.
;
proc freq
        data=country_analytic_file
    ;
    table
        Urban_Land*Happiness_score
    ;
        where
            not(missing(Happiness_Score))
    ;
    format
        Urban_Land Urban_Land_bins.
        Happiness_Score Happiness_Score_bins.
    ;
run;

title;
footnote;

*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: Does the population have relationship with the trust(Government Corruption)?'
;

title2
'Rationale: More population usually means hard to manage the county, so this helps us understand the relationship between government trust and population.'
;

footnote1
''
;

footnote2
''
;

footnote3
''
;

*
Note: This will compare “Population” from data set countires to the column 
"Trust(Government Corruption) from the 2016."

Methodology: Use proc means to compute 5-number summaries of "Population" 
and "Trust". Then use proc format to create formats that bin both 
columns with respect to the proc means output.

Limitations: This method still needs manual associating the variables.

Followup Steps: Linear regression is a good approach for this problem.
;
proc freq
        data=country_analytic_file
    ;
    table
        Population*Trust
    ;
        where
            not(missing(Trust))
    ;
    format
        Population Population_bins.
        Trust Trust_bins.
    ;
run;

title;
footnote;
