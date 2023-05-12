Explanation to the final peer-graded assessment of Coursera Getting and Cleaning Data (Johns Hopkins) course.

The aim of the code in the run_analysis.R file is to get and clean the data from the source of "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" side. 

First step (rows 5-6.) is downloading the zipped files

In rows 10-11. this zipped file is being unzipped.

In rows 15-22. the three parts of test and train sets are being read.

In rows 26-28. the set, label and subject datasets are being created from the test and train parts of each of them.

In the row 32 the whole_dataset is merged from the above created three datasets

In rows 36-37 the columns originated from subject and label datasets are being renamed to the better identification

In row 43 the features data is being read

In row 47 the row numbers of names contain average and standard deviation is being found

In row 51 the whole_data is filtered remaining only the columns which ones match the average and SD positions got from features above

In row 55 the columns of this filtered data are renamed according to the matching names from features dataset

In row 61 the real names of the activities are being read

In row 65 the characters of the activities names are being changed to lower case letters

In row 69 the numbers of activities column are being changed to the real activities names

In the row 75 the activities column is being renamed to "activities"

In rows 81-83 the filtered dataset are reshaped remaining the subject and activities column as their own and the other columns are melted into a variable and value columns.

In the row 87 the variables mean values are being calculated per subject and per activity

In the row 91 the final tidy dataset is being written to a file named "final_tidy_data.txt"
