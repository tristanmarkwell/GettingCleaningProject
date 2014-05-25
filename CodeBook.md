#Codebook for Getting and Cleaning Data project

##Data Source
The data in this repository comes from the UCI Machine Learning Repository, Human Activity Recognition Using Smartphones Data Set.
Data available at [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

##Data
There are 68 variables in the dataset.  The first two form the primary key:
* subject: represents the ID of the subject observations were taken from
* Activity: a factor column indicating the activity at the time of the observation
The other 66 variables are the mean and standard deviation columns from the original dataset.  Names were transformed to be human readable based on the following convention:
* Time <- t
* Fourier <- f
* Accelerometer <- Acc
* Gyroscope <- Gyro
* Mean <- mean
* StdDev <- std
* Magnitude <- Mag

##Transformations
Each data element in the tidy data set represents the average of the values for that subject/activity/feature combination.