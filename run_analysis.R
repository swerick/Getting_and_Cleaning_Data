## Set working directory
setwd("C:/Users/Sean/Desktop/Coursera/Programming in R/Getting and Cleaning Data/Project/")

## Set data directory variables
dataDir <- paste(getwd(), "UCI HAR Dataset", sep="/")
trainingDataDir <- paste(dataDir,"train", sep="/")
testDataDir <- paste(dataDir,"test", sep="/")
completeDataDir <- paste(dataDir,"complete", sep="/")
finalDataFilename <- "tidyData.txt"

## Read data sets
featureList <- read.table(paste(dataDir, "features.txt", sep="/"))
activityTypeList <- read.table(paste(dataDir, "activity_labels.txt", sep="/"))
subjectTestSet <- read.table(paste(testDataDir, "subject_test.txt", sep="/"))
subjectTrainingSet <- read.table(paste(trainingDataDir, "subject_train.txt", sep="/"))
yTrainingSet<-read.table(paste(trainingDataDir, "y_train.txt", sep="//"))
yTestSet<-read.table(paste(testDataDir, "y_test.txt", sep="//"))
xTrainingSet <- read.table(paste(trainingDataDir, "x_train.txt", sep="/"))
xTestSet <- read.table(paste(testDataDir, "x_test.txt", sep="/"))

## Alias data set columns to merge later
colnames(activityTypeList) <- c("activity_ID", "activity_name")
colnames(subjectTestSet) <- c("subject_ID")
colnames(subjectTrainingSet) <- c("subject_ID")
colnames(yTrainingSet) <- c("activity_ID")
colnames(yTestSet) <- c("activity_ID")
colnames(xTrainingSet) <- featureList$V2
colnames(xTestSet) <- featureList$V2

## Merge test and training datasets
trainingSet <- cbind(subjectTrainingSet, yTrainingSet, xTrainingSet)
testSet <- cbind(subjectTestSet, yTestSet, xTestSet)
combinedSet <- rbind(trainingSet, testSet)

## Keep only activity_ID, subject_ID, mean() and std() columns
## Escape parenthesis with double back slash
filteredSet <- combinedSet[, grepl("activity_ID", colnames(combinedSet)) | 
                             grepl("subject_ID", colnames(combinedSet)) | 
                             grepl("mean\\()", colnames(combinedSet)) | 
                             grepl("std\\()", colnames(combinedSet))]                       

## Get activity names using activity_ID and the activity type list
## Merge after filter to reduce processing time
filteredSet <- merge(filteredSet, activityTypeList, by="activity_ID", all=FALSE)

## Rearrange columns and change names
filteredSet[,1] <- filteredSet[,2]
filteredSet[,2] <- as.character(filteredSet[,69])
filteredSet[,69] <- NULL
colnames(filteredSet)[1:2] <- c("subject_id", "activity_name")

## Give new dataset better column names
## Remove parenthesis and dashes, escape parenthesis with double back slash
finalColumnNames <- gsub("\\()", "", gsub("-", "_", colnames(filteredSet)))

## Split up users and their activities
## First 2 columns are the subject_ID and activity_name
groupSets <-split(filteredSet[,c(3:68)], filteredSet[,c(1:2)])

## Calculate average for each column
finalSet <- sapply(groupSets, colMeans) 

## Pivot the data so columns are rows and rows are columns
finalSet <- t(finalSet) 

## Write final date to text file (each row represents an observation)
## Tab delimited without row names
write.table(finalSet, paste(completeDataDir, finalDataFilename, sep="/"), sep="\t", row.name=FALSE)