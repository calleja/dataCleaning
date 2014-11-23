Study design explaining how the raw data was recorded:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

Raw data:
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Units of these values are seconds (denoted with a t in front of the variable) or frequency (denoted with a "f" prefix).

In the raw file, we work with the mean, mean frequency (weighted average of the frequency components to obtain a mean frequency) and standard deviation observed of the variables. Observations of each variable were recorded for each of the 30 subjects and for each activity (further explanation below).

tBodyAcc-XYZ (3)
tGravityAcc-XYZ (3)
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag


Processed data:
There are 82 variables in the dataset.

Categorical data
"sub.id" - a unique numeric identification for each of the 30 volunteers
"act.names" - a factor with six levels listed above
"act.code" - numeric code for each of the activity types listed above

Data tranformation and summarization:
The raw data - partitioned into a trial and test data set made up of independent volunteers - was first merged into a large data set. An arithmetic mean was calculated for each participant and each activity (in other words, each variable was grouped by "act.names" and "act.code" and subsequently the arithmetic mean was calculated for each of these groups) across each of the movement/motion variables listed above.
Results are produced in the tidy data set in the wide format where each variable of motion is recorded in its own column. Lastly, the data set was ordered by activity type and subject.