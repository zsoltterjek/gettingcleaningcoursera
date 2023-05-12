The raw dataset originated from an experiment, where a group of 30 volunteers were involved. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,
SITTING, STANDING, LAYING) wearing a smartphone on the waist. Using its embedded accelerometer and gyroscope, the experiment leaders captured 3-axial linear acceleration and
3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into
two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Our task was to get and clean this raw dataset with prescribed parameters. Firstly the train and test datasets must have been read from the original text files into dataframes. 
This dataframes were merged into a whole dataset which contained all the values from test and train data with the subject and activities numbers as well.

This merged dataset must have been filtered such way that in the subsetted data remained only the columns contained average and standard deviations values.

The activities must have been clearly paired to the appropriate variable values and the variables names must have been in line with the results descripted by them.

Finally an independent dataset must have been created with the average of each variable for each activity and each subject.

In this final dataset the first two columns are the grouping subjects and activities followed by the mean values  of the other variables in 66 more columns. 
