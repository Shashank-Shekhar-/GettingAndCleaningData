
## Setting working directory to the location where the unzipped files from UCI HAR Dataset are saved
setwd("C:/Users/dell/Desktop/John Hopkins/3. Getting and Cleaning Data/UCI HAR Dataset")

############################################################################
##### 1. Merges the training and the test sets to create one data set. #####
############################################################################

## Read test data
subjectTest <- read.table("test/subject_test.txt",stringsAsFactors = FALSE)
yTest <- read.table("test/y_test.txt", stringsAsFactors = FALSE)
xTest <- read.table("test/X_test.txt", stringsAsFactors = FALSE)

## Create final test data set
testData <- cbind(subjectTest,yTest,xTest)

## Read training data
subjectTrain <- read.table("train/subject_train.txt", stringsAsFactors = FALSE)
yTrain <- read.table("train/y_train.txt", stringsAsFactors = FALSE)
xTrain <- read.table("train/X_train.txt", stringsAsFactors = FALSE)

## Create final training data set
trainData <- cbind(subjectTrain,yTrain,xTrain)

## Create master data set by combining test and training data sets (still without column names)
finalData <- rbind(trainData,testData)

## Read the features data
features <- read.table("features.txt")

## Assigning appropriate column names to final data set
colnames(finalData) <- c("subjectID","activityID",as.character(features[,2]))


#####################################################################################################
##### 2. Extracts only the measurements on the mean and standard deviation for each measurement.#####
#####################################################################################################

## Find positions of mean and standard deviation 
meanIndex <- grep("mean()", features[,2], fixed = TRUE)
stdIndex <- grep("std()", features[,2], fixed = TRUE)

## Combining the positions of mean and standard deviation in one vector
colIndex <- sort(c(meanIndex, stdIndex))

## Subset the finalData table based to keep only desired columns of mean and standard deviation
finalData <- finalData[, c(1,2,colIndex + 2)] ## +2 because first two columns are "subjectID" and "activityID"


#####################################################################################
##### 3. Uses descriptive activity names to name the activities in the data set #####
#####################################################################################

## Read the activity_lables data and assign column name
activityLables <- read.table("activity_labels.txt")
colnames(activityLables) <- c("activityID","activityType")

## Merge the finalData set with the activityLables table to include descriptive activity names
finalData <- merge(finalData,activityLables,by.x ='activityID', by.y = 'activityID', all.x=TRUE)

## Reordering the columns as merge changes order of columns
actID <- finalData$activityID
actLab <- finalData$activityType
subID <- finalData$subjectID
len <- length(colnames(finalData)) -1

finalData <- cbind(subjectID = subID,activityID = actID,activityType = actLab,finalData[,3:len])
      
################################################################################
##### 4. Appropriately labels the data set with descriptive variable names.#####
################################################################################

## Assigning column names of final data set to variable columnNames
columnNames <- colnames(finalData)

## Making column name more understandable and meaningful
for(i in 1:length(columnNames))
    {
      columnNames[i] <- gsub("\\()","",columnNames[i])
      columnNames[i] <- gsub("-std","StdDev",columnNames[i])
      columnNames[i] <- gsub("-mean","Mean",columnNames[i])
      columnNames[i] <- gsub("^t","Time",columnNames[i])
      columnNames[i] <- gsub("^f","Frequency",columnNames[i])
      columnNames[i] <- gsub("BodyBody","Body",columnNames[i])
      columnNames[i] <- gsub("AccMag","AccMagnitude",columnNames[i])
      columnNames[i] <- gsub("Bbodyaccjerkmag","BodyAccJerkMagnitude",columnNames[i])
      columnNames[i] <- gsub("JerkMag","JerkMagnitude",columnNames[i])
      columnNames[i] <- gsub("GyroMag","GyroMagnitude",columnNames[i])
      columnNames[i] <- gsub("-",".",columnNames[i])
}

## Assigning updated column names to final data set
colnames(finalData) <- columnNames


####################################################################################
##### 5. Create a second, independent tidy data set                            #####  
#####    with the average of each variable for each activity and each subject. #####
####################################################################################

## Loading package dplyr
library(dplyr)

## Grouping by subjectID and activityID
df <- group_by(finalData, subjectID, activityID, activityType)

## Creating an independent tidy data set 
## with the average of each variable for each activity and each subject
tidyData <- data.frame(summarise_each(df,funs(mean)))
write.table(tidyData, "tidyData.txt", sep="\t", row.names = FALSE)
#####################################################################################
#####################################################################################
