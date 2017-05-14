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
Research Question 1: What are the three lowest happiness raking countries? 

Rationale: This would help us find the countries that are less happy

Methodology: 

Limitations: 

Followup Steps: 
;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;
*
Research Question 2: what is the average happiness rate among the countries? 

Rationale: This will show us the average score among the countries.

Methodology: 

Limitations: 

Followup Steps: 
;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;
*
Research Question 3: Based on year 2015 data, can we say that the happiness rating of 2015 is higher than 2016? 

Rationale: This should help us see whether the counties increased or decreased in their happiness rate throughout the years.

Methodology: 

Limitations: 

Followup Steps: 
;
