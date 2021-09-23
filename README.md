This document describes the code of run_analysis.R, which was generated for the Programming Assignment of the Coursera Course "Getting and Cleaning Data" as well as the output file with its generated and transformed variables.
Data set and Codebook
The raw data set used as input data for this assignment is provided via the following link:
•	Data file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
•	CodeBook: Human Activity Recognition Using Smartphones
In this data set the measured raw data was provided for both testing and training data sets in the folder ../Inertial Signals. But this data was already preprocessed and certain extracted features were provided in some preprocessed files. These data files were used for the assignment:
•	X_train.txt and X_test.txt: containing the feature measurements
•	y_train.txt and y_test.txt: containing the activity labels corresponding to the rows of X_train and X_test
•	subject_test.txt and subject_train.txt: containing the subjects from which the measurements were taken corresponding to the rows of X_train and X_test.
•	features.txt: variable names for describing the kind of measurement/feature
•	activity_labels.txt: Link between activity ids and descriptive name of the activity
Code description
The code within run_analysis.R can be separated in a few sections, which was highlighted via comments at the beginning of each section:
•	Downloading, unzipping  data
•	loading data
•	merging data and extracting relevant variables
•	aggregating data and estimating the average by group
•	Writing final output to txt file
Downloading, unzipping 
•	Downloads and unzips the UCI HAR dataset fileURL, if the data set filename is not yet existing in the current working directory
Loading input data
•	Reads in "features.txt" into features and "activity_labels.txt" into activity_labels, which contain informations on kind of measurement (variables) and activity. With these informations data columns can be named with its appropriate variable name and activity labels can be transformed into descriptive names.
Merging input files and extracting relevant variables
•	Merge the loaded files (“train”
•	Extracts variable names of all measurements on the mean and standard deviation for each measurement “myvar”  related to columns will be selected out of the data set.
•	Transforms the selected variable names to proper descriptive variable names for labeling the data set. (change prefix t to time, prefix f to frequency, bodybody to body…..)
Aggregating data and estimating the average by group.
•	Group the dataset by subject and by activity
•	Calculates the average of the selected columns by group via summary function of dyplyr 
Writing final data to txt file
•	Writes the full_data_mean to  outputfile " UCI_HAR_Dataset_Mean.txt" in the current working directory.
•	
What you find in this repository 
•	CodeBook.md: raw and tidy data set and and the scripts used to transform them
•	README.md: this file
•	 run_analysis.R: R script to transform raw data set in a tidy one
•	
How to create the tidy data set
•	clone this repository: git clone git@github.com:jlok/getting_and_cleaning_assignement.git
•	download compressed raw data
•	unzip raw data and copy the directory UCI HAR Dataset to the cloned repository root directory 
•	open a R console and set the working directory to the repository root (use setwd()) 
•	source run_analisys.R script (it requires the dplyr package and stringr package)
•	In the repository root directory you find the file UCI_HAR_Dataset_Mean.txt with the tidy data set.

