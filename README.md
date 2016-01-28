# Purpose of the project
The purpose of this project is to demonstrate collecting, working with and cleaning of various data sets to finally create a tidy data set

# Information about how the data was collected
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

# Data description and source
A full description of the data used in this project can be found  at the following URL:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original data sets can be downloaded from the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Fields/variables in the raw data sets
Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
Triaxial Angular velocity from the gyroscope. 
A 561-feature vector with time and frequency domain variables. 
Its activity label. 
An identifier of the subject who carried out the experiment.

# Data sets used for creating a tidy data set
X_test: A 561-feature vector with time and frequency domain variables for the test group

y_test:Indicates the type of activity performed

subject_test: Indicates the subject who performed the activities and for whom the data about time and frequency domain variables was recorded

X_train, y_train and subject_train represent corresponding data sets for the training group

features: A set of 561 character variables that indicate the name of the measurements

activity_labels: Character variables that indicate the type of activity


*NOTE: 70% of the subjects comprised the training group while the remaining 30% comprised the test group


# Analysis performed to create a tidy data set
Set working directory to the directory where the data set was downloaded and unzipped

Read test data sets and combine them

Read training data sets and combine them

Combine the test and training data sets to create master data set

Assign column names to the master data set

Subset the master data set to extract only the columns for mean and standard deviation for each measurement - this gives us the final data set

Add a column to the final data set indicating descriptive names for each activity type

Edit the column names of the final data set to make them more understandable and meaningful

Create an independent tidy data set which has the average of each 
variable in the final data set for each activity and each subject - This fulfills the criteria of a tidy data set i.e one row per observation of a specific type and one column for each variable measured

More details can be found in CodeBook.md

# References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

#Files in the repository
run_analysis.R - R code to create the tidy data set

README.md

CodeBook.md