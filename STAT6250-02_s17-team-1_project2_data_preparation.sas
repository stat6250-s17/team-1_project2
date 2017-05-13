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
https://github.com/stat6250/team-1_project2/blob/master/data/2015.xlsx?raw=true
;
%let inputDataset1Type = XLSX;
%let inputDataset1DSN = 2015_raw;

%let inputDataset2URL =
https://github.com/stat6250/team-1_project2/blob/master/data/2016.xlsx?raw=true
;
%let inputDataset2Type = XLSX;
%let inputDataset2DSN = 2016_raw;

%let inputDataset3URL =
https://github.com/stat6250/team-1_project2/blob/master/data/countries.xlsx?raw=true
;
%let inputDataset3Type = XLSX;
%let inputDataset3DSN = countries_raw;

