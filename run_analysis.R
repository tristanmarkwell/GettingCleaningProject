## Part 0 - This code downloads the data if you're starting from scratch
# if (!file.exists('data')) dir.create('data')
# download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
#               'rawDatasets.zip')
# dateDownloaded <- date()
# 
# ## unzip files
# unzip('.\\data\\rawDatasets.zip',exdir='.\\data')

## Part 1 - load data - uncommented are simplified assuming all files are in the working directory
#activity_labels <- read.table('.\\data\\UCI HAR Dataset\\activity_labels.txt', col.names=c('ID','Activity'))
activity_labels <- read.table('activity_labels.txt', col.names=c('ID','Activity'))
#features <- read.table('.\\data\\UCI HAR Dataset\\features.txt')
features <- read.table('features.txt')
#subject_test <- read.table('.\\data\\UCI HAR Dataset\\test\\subject_test.txt', col.names='subject')
subject_test <- read.table('subject_test.txt', col.names='subject')
#y_test <- read.table('.\\data\\UCI HAR Dataset\\test\\y_test.txt', col.names='Activity')
y_test <- read.table('y_test.txt', col.names='Activity')
#X_test <- read.table('.\\data\\UCI HAR Dataset\\test\\X_test.txt',col.names=features$V2)
X_test <- read.table('X_test.txt',col.names=features$V2)
#subject_train <- read.table('.\\data\\UCI HAR Dataset\\train\\subject_train.txt', col.names='subject')
subject_train <- read.table('subject_train.txt', col.names='subject')
#y_train <- read.table('.\\data\\UCI HAR Dataset\\train\\y_train.txt', col.names='Activity')
y_train <- read.table('y_train.txt', col.names='Activity')
#X_train <- read.table('.\\data\\UCI HAR Dataset\\train\\X_train.txt',col.names=features$V2)
X_train <- read.table('X_train.txt',col.names=features$V2)

## Part 2 - have to use the activities to label as factors
y_test$Activity <- factor(y_test$Activity,labels=as.character(activity_labels$Activity))
y_train$Activity <- factor(y_train$Activity,labels=as.character(activity_labels$Activity))

## Part 3 - merge columns and then rows
testData <- cbind(X_test, y_test, subject_test)
trainingData <- cbind(X_train, y_train, subject_train)
mergedData <- rbind(testData,trainingData)

## Part 4 - keep only mean and standard deviation columns
trimmedColumns <- c(grep("mean.",colnames(mergedData), fixed=TRUE),grep("std.",colnames(mergedData)),562, 563)
trimmedData <- mergedData[,trimmedColumns]

## Part 5 - create tidy data set using plyr
library(plyr)
tidyData <- ddply(trimmedData,.(subject,Activity),summarize, 
                  TimeBodyAccelerometerMeanX = mean(tBodyAcc.mean...X),
                  TimeBodyAccelerometerMeanY = mean(tBodyAcc.mean...Y),
                  TimeBodyAccelerometerMeanZ = mean(tBodyAcc.mean...Z),
                  TimeBodyAccelerometerStdDevX = mean(tBodyAcc.std...X),
                  TimeBodyAccelerometerStdDevY = mean(tBodyAcc.std...Y),
                  TimeBodyAccelerometerStdDevZ = mean(tBodyAcc.std...Z),
                  TimeGravityAccelerometerMeanX = mean(tGravityAcc.mean...X),
                  TimeGravityAccelerometerMeanY = mean(tGravityAcc.mean...Y),
                  TimeGravityAccelerometerMeanZ = mean(tGravityAcc.mean...Z),
                  TimeGravityAccelerometerStdDevX = mean(tGravityAcc.std...X),
                  TimeGravityAccelerometerStdDevY = mean(tGravityAcc.std...Y),
                  TimeGravityAccelerometerStdDevZ = mean(tGravityAcc.std...Z),
                  TimeBodyAccelerometerJerkMeanX = mean(tBodyAccJerk.mean...X),
                  TimeBodyAccelerometerJerkMeanY = mean(tBodyAccJerk.mean...Y),
                  TimeBodyAccelerometerJerkMeanZ = mean(tBodyAccJerk.mean...Z),
                  TimeBodyAccelerometerJerkStdDevX = mean(tBodyAccJerk.std...X),
                  TimeBodyAccelerometerJerkStdDevY = mean(tBodyAccJerk.std...Y),
                  TimeBodyAccelerometerJerkStdDevZ = mean(tBodyAccJerk.std...Z),
                  TimeBodyGyroscopeMeanX = mean(tBodyGyro.mean...X),
                  TimeBodyGyroscopeMeanY = mean(tBodyGyro.mean...Y),
                  TimeBodyGyroscopeMeanZ = mean(tBodyGyro.mean...Z),
                  TimeBodyGyroscopeStdDevX = mean(tBodyGyro.std...X),
                  TimeBodyGyroscopeStdDevY = mean(tBodyGyro.std...Y),
                  TimeBodyGyroscopeStdDevZ = mean(tBodyGyro.std...Z),
                  TimeBodyGyroscopeJerkMeanX = mean(tBodyGyroJerk.mean...X),
                  TimeBodyGyroscopeJerkMeanY = mean(tBodyGyroJerk.mean...Y),
                  TimeBodyGyroscopeJerkMeanZ = mean(tBodyGyroJerk.mean...Z),
                  TimeBodyGyroscopeJerkStdDevX = mean(tBodyGyroJerk.std...X),
                  TimeBodyGyroscopeJerkStdDevY = mean(tBodyGyroJerk.std...Y),
                  TimeBodyGyroscopeJerkStdDevZ = mean(tBodyGyroJerk.std...Z),
                  TimeBodyAccelerometerMagnitudeMean = mean(tBodyAccMag.mean..),
                  TimeGravityAccelerometerMagnitudeMean = mean(tGravityAccMag.mean..),
                  TimeBodyAccelerometerJerkMagnitudeMean = mean(tBodyAccJerkMag.mean..),
                  TimeBodyGyroscopeMagnitudeMean = mean(tBodyGyroMag.mean..),
                  TimeBodyGyroscopeJerkMagnitudeMean = mean(tBodyGyroJerkMag.mean..),
                  TimeBodyAccelerometerMagnitudeStdDev = mean(tBodyAccMag.std..),
                  TimeGravityAccelerometerMagnitudeStdDev = mean(tGravityAccMag.std..),
                  TimeBodyAccelerometerJerkMagnitudeStdDev = mean(tBodyAccJerkMag.std..),
                  TimeBodyGyroscopeMagnitudeStdDev = mean(tBodyGyroMag.std..),
                  TimeBodyGyroscopeJerkMagnitudeStdDev = mean(tBodyGyroJerkMag.std..),
                  FourierBodyAccelerometerMeanX = mean(fBodyAcc.mean...X),
                  FourierBodyAccelerometerMeanY = mean(fBodyAcc.mean...Y),
                  FourierBodyAccelerometerMeanZ = mean(fBodyAcc.mean...Z),
                  FourierBodyAccelerometerStdDevX = mean(fBodyAcc.std...X),
                  FourierBodyAccelerometerStdDevY = mean(fBodyAcc.std...Y),
                  FourierBodyAccelerometerStdDevZ = mean(fBodyAcc.std...Z),
                  FourierBodyAccelerometerJerkMeanX = mean(fBodyAccJerk.mean...X),
                  FourierBodyAccelerometerJerkMeanY = mean(fBodyAccJerk.mean...Y),
                  FourierBodyAccelerometerJerkMeanZ = mean(fBodyAccJerk.mean...Z),
                  FourierBodyAccelerometerJerkStdDevX = mean(fBodyAccJerk.std...X),
                  FourierBodyAccelerometerJerkStdDevY = mean(fBodyAccJerk.std...Y),
                  FourierBodyAccelerometerJerkStdDevZ = mean(fBodyAccJerk.std...Z),
                  FourierBodyGyroscopeMeanX = mean(fBodyGyro.mean...X),
                  FourierBodyGyroscopeMeanY = mean(fBodyGyro.mean...Y),
                  FourierBodyGyroscopeMeanZ = mean(fBodyGyro.mean...Z),
                  FourierBodyGyroscopeStdDevX = mean(fBodyGyro.std...X),
                  FourierBodyGyroscopeStdDevY = mean(fBodyGyro.std...Y),
                  FourierBodyGyroscopeStdDevZ = mean(fBodyGyro.std...Z),
                  FourierBodyAccelerometerMagnitudeMean = mean(fBodyAccMag.mean..),
                  FourierBodyAccelerometerMagnitudeStdDev = mean(fBodyAccMag.std..),
                  FourierBodyAccelerometerJerkMagnitudeMean = mean(fBodyBodyAccJerkMag.mean..),
                  FourierBodyAccelerometerJerkMagnitudeStdDev = mean(fBodyBodyAccJerkMag.std..),
                  FourierBodyGyroscopeMagnitudeMean = mean(fBodyBodyGyroMag.mean..),
                  FourierBodyGyroscopeMagnitudeStdDev = mean(fBodyBodyGyroMag.std..),
                  FourierBodyGyroscopeJerkMagnitudeMean = mean(fBodyBodyGyroJerkMag.mean..),
                  FourierBodyGyroscopeJerkMagnitudeStdDev = mean(fBodyBodyGyroJerkMag.std..)
                  )

## Part 6 - final output of tidy data
write.table(tidyData,file="tidyData.txt",sep=",")
