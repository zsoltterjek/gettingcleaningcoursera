##Task 1.

#Get the URL and download the zipped file

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file(fileURL, destfile = "C:/Users/zterjek/Desktop/PTP/PtP.zip", method = "curl")

#Unzip the zipped file

setwd("C:/Users/zterjek/Desktop/PTP")
unzip("PtP.zip")

#Read the data

test_set <- read.table("C:/Users/zterjek/Desktop/PTP/UCI HAR Dataset/test/X_test.txt")
train_set <- read.table("C:/Users/zterjek/Desktop/PTP/UCI HAR Dataset/train/X_train.txt")

test_labels <- read.table("C:/Users/zterjek/Desktop/PTP/UCI HAR Dataset/test/y_test.txt")
train_labels <- read.table("C:/Users/zterjek/Desktop/PTP/UCI HAR Dataset/train/y_train.txt")

test_subject <- read.table("C:/Users/zterjek/Desktop/PTP/UCI HAR Dataset/test/subject_test.txt")
train_subject <- read.table("C:/Users/zterjek/Desktop/PTP/UCI HAR Dataset/train/subject_train.txt")

#Bind the test and train data

whole_set <- rbind(test_set, train_set)
whole_labels <- rbind(test_labels, train_labels)
whole_subject <- rbind(test_subject, train_subject)

#Create the whole dataset

whole_data <- cbind(whole_set, whole_subject, whole_labels)

#rename the label and subject columns of whole data

colnames(whole_data)[562] <- "subject"
colnames(whole_data)[563] <- "label"

##Task 2.

#Read the features

features <- read.table("C:/Users/zterjek/Desktop/PTP/UCI HAR Dataset/features.txt")

#find mean and std values in features

MSD <- grep("-mean\\(\\)|-std\\(\\)", features$V2)

#subset the whole_data leaving only the columns of label, subject and the numbers match with MSD

whole_data_MSD <- whole_data[,c(MSD, 562, 563)]

#set the column names of whole_data_MSD to the matching features names

colnames(whole_data_MSD)[1:66] <- features[MSD, 2]

##Task 3.

#reading the activity names table

activities <- read.table("C:/Users/zterjek/Desktop/PTP/UCI HAR Dataset/activity_labels.txt")

#changing the letters to lowercase 

activities[,2] <- tolower(activities[,2])

#changing the whole_data label column values to the matching activity names 

whole_data_MSD[,68] <- activities[whole_data_MSD[,68],2]

##Task 4.

#changing the name of last column 

colnames(whole_data_MSD)[68] <- "activities"

##Task 5.

#melting the whole_data 

library(reshape2)

melted_whole_data <- melt(whole_data_MSD, id = c("subject", "activities"))

#making the final tidy dataset with calculating the average valu of the variables per subject and activity

tidy_whole_data <- dcast(melted_whole_data, subject + activities ~ variable, mean)

#write the tidy dataset to a text file

write.table(tidy_whole_data, file = "C:/Users/zterjek/Desktop/PTP/final_tidy_data.txt")

#End of the code
