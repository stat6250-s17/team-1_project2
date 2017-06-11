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
'Research Question: What are the three lowest happiness raking countries?'
;

title2
'Rationale: This would help us find the countries that are less happy.'
;

footnote1
" From the table above, we found out what the three lowest happiness raking countries are. "
;
 
footnote2
" The result may not be applicabe since some other factors were not taken into account. However, it gives us a holistic idea." 
;

footnote3
'It could be noticed that countries that are less advanced have the potential to increase their happiness score. '
;

*
Note: This draws comparison between the happiness rank of each country.

Methodology: We would use the merged dataset"Happiness_Rank" and create the Rank_change_2015_to_2016 variable 
to run the "proc sort"  to  sort the data in a descending order and find out 
what countries have the lowest happiness raningk are.

Limitations:  We may end up with some countries with the same happiness rank.

Followup Steps: We could look at another variable to determine the answer of the research question.
;

proc print
     data=country_analytic_file;
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
'Research Question: what is the average happiness rate among the countries ?'
;

title2
'Rationale: This will show us the average score of the happiness rate among the countries.'
;

footnote1
" From the table above, we can figure out the average of the countris' happiness rate "
;
 
 
footnote2
" The variance of the happiness rate among countries seems large. Therefore, the average might not be accurate."
;

footnote3
'It is possible to say the mean calculated here does not take other field and variables of the countries into account.'
;

*
Note: This sets a threshold of what the average rate of  happiness among the dataset.

Methodology: By applying the "proc means" statement on the "Happiness_Rank", we can 
calcualte the averagerate of happiness in the dataset.

Limitations:  Since we use the mean to find out the average, we may come across countries that have either low or high rate of happiness
so these countries may impact the result.

Followup Steps: Try to divide the happiness rate into three subsets with minimum variance in each subset and caluculte the average of 
each subset.
;


proc print
     data=country_analytic_file;
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
'Research Question: Is there a relationship between the population and freedom?'
;

title2
'Rationale: This should help us see whether the population have the freedom to do and say what they want and express that .'
;

footnote1
" Here, we can say that countries with lagrer population tend to fail to provide enough freedom and not vice versa.  "

;
 
footnote2
" Although the dataset does not help us extrapolate the relationship, yet, we can say that the less population, the more more freedom space  counries can give "
;

footnote3
'More than half of the population have about 25%. It seems there peple are not satisfied with their freedom space they are given.'
;
*
Note: This shows a comparison between the population of  happiness and the "Freedom from the 2016. ".

Methodology: One way to think abouth this is to apply  "proc means" then "proc format" in order to bin
the two columns w.r.t o the proc means.

Limitations:  We need to add more variables to make the relation more accurate.

Followup Steps: Try to add the Trust(Government Corruption) variable. Or, we can apply the "proc glm" to do regression analysis.
;

proc freq
        data=country_analytic_file
    ;
    table
        Population*Freedom
    ;
        where
            not(missing(Freedom))
    ;
    format
        Population Population_bins.
        Freedom Freedom_bins.
    ;
run;

title;
footnote;
