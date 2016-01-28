# Variables in the tidy data set
All variables that have 'mean()' and 'std()' in the raw data set (i.e mean and standard deviation)

# Identifiers
activityID - Indicator for the type of activity performed when the corresponding measurements were taken
activityType - Description for the type of activity performed when the corresponding measurements were taken
subject - The ID of the subject performing the activity

# Measurements 
TimeBodyAccMean.X                   	   
TimeBodyAccMean.Y                   	   
TimeBodyAccMean.Z                   	   
TimeBodyAccStdDev.X                 	   
TimeBodyAccStdDev.Y                 	   
TimeBodyAccStdDev.Z                 	   
TimeGravityAccMean.X                	   
TimeGravityAccMean.Y                	   
TimeGravityAccMean.Z                	   
TimeGravityAccStdDev.X              	   
TimeGravityAccStdDev.Y              	   
TimeGravityAccStdDev.Z              	   
TimeBodyAccJerkMean.X               	   
TimeBodyAccJerkMean.Y               	   
TimeBodyAccJerkMean.Z               	   
TimeBodyAccJerkStdDev.X             	   
TimeBodyAccJerkStdDev.Y             	   
TimeBodyAccJerkStdDev.Z             	   
TimeBodyGyroMean.X                  	   
TimeBodyGyroMean.Y                  	   
TimeBodyGyroMean.Z                  	   
TimeBodyGyroStdDev.X                	   
TimeBodyGyroStdDev.Y                	   
TimeBodyGyroStdDev.Z                	   
TimeBodyGyroJerkMean.X              	   
TimeBodyGyroJerkMean.Y              	   
TimeBodyGyroJerkMean.Z              	   
TimeBodyGyroJerkStdDev.X            	   
TimeBodyGyroJerkStdDev.Y            	   
TimeBodyGyroJerkStdDev.Z            	   
TimeBodyAccMagnitudeMean            	   
TimeBodyAccMagnitudeStdDev          	   
TimeGravityAccMagnitudeMean         	   
TimeGravityAccMagnitudeStdDev       	   
TimeBodyAccJerkMagnitudeMean        	   
TimeBodyAccJerkMagnitudeStdDev      	   
TimeBodyGyroMagnitudeMean           	   
TimeBodyGyroMagnitudeStdDev         	   
TimeBodyGyroJerkMagnitudeMean       	   
TimeBodyGyroJerkMagnitudeStdDev     	   
FrequencyBodyAccMean.X              	   
FrequencyBodyAccMean.Y              	   
FrequencyBodyAccMean.Z              	   
FrequencyBodyAccStdDev.X            	   
FrequencyBodyAccStdDev.Y            	   
FrequencyBodyAccStdDev.Z            	   
FrequencyBodyAccJerkMean.X          	   
FrequencyBodyAccJerkMean.Y          	   
FrequencyBodyAccJerkMean.Z          	   
FrequencyBodyAccJerkStdDev.X        	   
FrequencyBodyAccJerkStdDev.Y        	   
FrequencyBodyAccJerkStdDev.Z        	   
FrequencyBodyGyroMean.X             	   
FrequencyBodyGyroMean.Y             	   
FrequencyBodyGyroMean.Z             	   
FrequencyBodyGyroStdDev.X           	   
FrequencyBodyGyroStdDev.Y           	   
FrequencyBodyGyroStdDev.Z           	   
FrequencyBodyAccMagnitudeMean       	   
FrequencyBodyAccMagnitudeStdDev     	   
FrequencyBodyAccJerkMagnitudeMean   	   
FrequencyBodyAccJerkMagnitudeStdDev 	   
FrequencyBodyGyroMagnitudeMean      	   
FrequencyBodyGyroMagnitudeStdDev    	   
FrequencyBodyGyroJerkMagnitudeMean  	   
FrequencyBodyGyroJerkMagnitudeStdDev	 

# Description and Units
subjectID - ID of the subject undertaking the activity (1-30)
activityID - ID indicating the type of activity (1-6)
activityType - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING (corresponding to acivityID from 1 to 6 respectively)
Any variable with the word 'Time' has units in seconds.
Any variable with the word 'Frequency' has units in Hz.

# Description of variables as per 'features_info' of the raw data set
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

# Notes:
Acc stands for accelerometer
Gyro stands for Gyroscope
In the raw data set mean() indicates average, std() indicates standard deviation
In the tidy data set, average of the Mean and Standard Deviation of each variable was computed for each activity and each subject and labeled as 'Mean' and 'StdDev' respectively.
't' in raw data set indicates time and has been updated in varibale name of tidy data set.
'f' in raw data set indicates time and has been updated in varibale name of tidy data set.

# Raw Data sets used for creating a tidy data set
X_test: A 561-feature vector with time and frequency domain variables for the test group
y_test:Indicates the tyoe of activity performed
subject_test: Indicates the subject who performed the activities and for whom the data about time and frequency domain variables was recorded
X_train, y_train and subject_train represent corresponding data sets for the training group
features: A set of 561 character variables that indicate the name of the measurements
activity_labels: Character variables that indicate the type of activity

# Analysis performed to arrive at a tidy data set
# 1. Merges the training and the test sets to create one data set.
Set the working directory to where the UCI HAR Dataset was downloaded and unzipped
Read the test data sets(subject_test,X_test,y_test) and combine using cbind. Objects created are subjectTest, yTest and xTest. 
Read the training data sets(subject_trai n,X_train,y_train) and combine using cbind. Objects created are subjectTrain, yTrain and xTrain.
Create master data set by combining test and training data sets (still without column names)using rbind. Object finalData created.
Read variable names from 'feature' raw data set and assign to master data set as column names using colnames function with first two column names being subjectId and activityID.

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
Find positions in the masterdata where there is 'mean()' or 'std()' in the column names (in objects meanIndex and stdIndex respectively). Sort and save these positions in an object called colIndex.
Subset the masterData table (i.e object finalData) to keep only desired columns of mean and standard deviation. This gives the final data set.

# 3. Uses descriptive activity names to name the activities in the data set
Read the 'activity_lables' data and assign column names(activityId and activityType). Object activityLables created. 
Merge the finalData set with the activityLables to include descriptive activity names.
Since merge changes the order of columns, we reorder the columns using intermediate objects actId, actLab, subId and len. These objects contain activityId, activityType, subjectID and number of columns -1 in the finalData. -1 is done because the last column is activityType as a result of the merge operation.
Columns of finalData are re-ordered to make subjectID, activityId and activityType as the first three columns. This is done using the objects made in previous step and fedding them to cbind

# 4. Appropriately labels the data set with descriptive variable names.
Column names of finalData are stored in object named columnNames.
A for loop is executed where the gsub function makes the columnNames more meaningful and understandable. The edited columnNames are then assigned as column names of finalData using the colnames function

# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
Load package dplyr so that we can use functions group_by and summarise_each.
Create object df that groups the finalData by subjectID, activityID and activityType.
Create a tidy data set by using summarise_each function to apply mean of each variable except the variable on which the grouping is done. 
Finally, write the tidy data set into a text file using write.table command.