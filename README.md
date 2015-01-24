# getdata_project

## How to run run_analysis.R

Download the run_analisys.R file from the repository. Extract the data for this project from the link below:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data should be extracted in the data directory of the directory where the run_analisys.R was downloaded. After downloading the data and extracting the R source file, you should be read to run the analysis. The code should be run from the R application. You do that by submitting the command below from the R command line:

> source('run_analysis.R')

Appropiate error messages will be shown during the execution of the program indicating any problem (for instance, opening data files).

## Codebook

The output of the run_analysis.R program is a data frame with the columns listed below:

* activity_code: activity code under analysis
* variable: variable name under analysis
* value_avg: mean for the variable under analysis
* value_sd: standard deviation for the variable under analysis
* activity_name: name for the activity under analysis






