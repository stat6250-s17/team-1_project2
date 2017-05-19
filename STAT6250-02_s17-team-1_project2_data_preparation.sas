*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

* 
[Dataset 1 Name] 2015
[Dataset Description] The 2015 World Happiness Report is a survey from the 
Gallup World Poll. Lists rating and happiness of each country.
[Experimental Unit Description] countries in 2015
[Number of Observations] 158                    
[Number of Features] 12
[Data Source] https://www.kaggle.com/unsdsn/world-happiness/downloads/2015.csv
[Data Dictionary] https://www.kaggle.com/unsdsn/world-happiness
[Unique ID Schema] The column “country” is a primary key for data set 2015, 
2016, and countries.
--
[Dataset 2 Name] 2016
[Dataset Description] The 2016 World Happiness Report is a survey from the 
Gallup World Poll. Lists rating and happiness of each country.
[Experimental Unit Description] countries in 2016
[Number of Observations] 157                    
[Number of Features] 13
[Data Source] https://www.kaggle.com/unsdsn/world-happiness/downloads/2016.csv
[Data Dictionary] https://www.kaggle.com/unsdsn/world-happiness
[Unique ID Schema] The column “country” is a primary key for data set 2015, 
2016, and countries.
--
[Dataset 3 Name] countries
[Dataset Description] The 2016 Ecological Footprint data provided by the 
Global Footprint Network. Lists the amount and types of consumption for 
each country.
[Experimental Unit Description] countries in 2015
[Number of Observations] 188             
[Number of Features] 21
[Data Source] https://www.kaggle.com/footprintnetwork/ecological-footprint/downloads/countries.csv
[Data Dictionary] https://www.kaggle.com/footprintnetwork/ecological-footprint
[Unique ID Schema] The column “country” is a primary key for data set 2015, 
2016, and countries.
;

* setup environmental parameters;
%let inputDataset1URL =
https://github.com/stat6250/team-1_project2/blob/master/data/Rank2015-Edited.xlsx?raw=true
;
%let inputDataset1Type = XLSX;
%let inputDataset1DSN = Rank2015_raw;

%let inputDataset2URL =
https://github.com/stat6250/team-1_project2/blob/master/data/Rank2016-Edited.xlsx?raw=true
;
%let inputDataset2Type = XLSX;
%let inputDataset2DSN = Rank2016_raw;

%let inputDataset3URL =
https://github.com/stat6250/team-1_project2/blob/master/data/countries-Edited.xlsx?raw=true
;
%let inputDataset3Type = XLSX;
%let inputDataset3DSN = countries_raw;

* load raw datasets over the wire, if they doesn't already exist;
%macro loadDataIfNotAlreadyAvailable(dsn,url,filetype);
    %put &=dsn;
    %put &=url;
    %put &=filetype;
    %if
        %sysfunc(exist(&dsn.)) = 0
    %then
        %do;
            %put Loading dataset &dsn. over the wire now...;
            filename tempfile "%sysfunc(getoption(work))/tempfile.xlsx";
            proc http
                method="get"
                url="&url."
                out=tempfile
                ;
            run;
            proc import
                file=tempfile
                out=&dsn.
                dbms=&filetype.;
            run;
            filename tempfile clear;
        %end;
    %else
        %do;
            %put Dataset &dsn. already exists. Please delete and try again.;
        %end;
%mend;
%loadDataIfNotAlreadyAvailable(
    &inputDataset1DSN.,
    &inputDataset1URL.,
    &inputDataset1Type.
)
%loadDataIfNotAlreadyAvailable(
    &inputDataset2DSN.,
    &inputDataset2URL.,
    &inputDataset2Type.
)
%loadDataIfNotAlreadyAvailable(
    &inputDataset3DSN.,
    &inputDataset3URL.,
    &inputDataset3Type.
)

* sort and check raw datasets for duplicates with respect to their unique ids;
proc sort
        nodupkey
        data=Rank2015_raw
        dupout=Rank2015_raw_dups
        out=Rank2015_raw_sorted
    ;
    by
        Country
    ;
run;
proc sort
        nodupkey
        data=Rank2016_raw
        dupout=Rank2016_raw_dups
        out=Rank2016_raw_sorted
    ;
    by
        Country
    ;
run;
proc sort
        nodupkey
        data=countries_raw
        dupout=countries_raw_dups
        out=countries_raw_sorted
    ;
    by
        Country
    ;
run;

* combine 2015 and 2016 data vertically, and compute year-over-year change in 
Happiness Rank, retaining all C2015-2016 fields and y-o-y Happiness Rank change;
data 2016_raw_with_yoy_change;
    set
        Rank2016_raw_sorted(in=C2016_data_row)
        Rank2015_raw_sorted(in=C2015_data_row)
    ;
    retain
        Happiness_Rank
    ;
    by
        Country
    ;
    if
        C2016_data_row=1
    then
        do;
            Happiness_Rank_2016 = Happiness_Rank;
        end;
    else if
        C2015_data_row=1
    then
        do;
            Happiness_Rank_change_2015_to_2016 =
                Happiness_Rank_2016
                -
                Hapiness_Rank
            ;
            output;
        end;
run;

* build analytic dataset from raw datasets with the least number of columns and
minimal cleaning/transformation needed to address research questions in
corresponding data-analysis files;
data country_analytic_file;
    retain
        Country
        Region
        Happiness_Rank
        Hapiness_Score
        Economy
        Family
        Health
        Freedom
        Trust
        Generosity
        Dystopia_Residual
    ;
    keep
        Country
        Region
        Happiness_Rank
        Hapiness_Score
        Economy
        Family
        Health
        Freedom
        Trust
        Generosity
        Dystopia_Residual
    ;
    merge
        2016_raw_with_yoy_change
        countries_raw
    ;
    by
        Country
    ;
run;
