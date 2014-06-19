########################################################################
## Title: 	run_analysis.R                                        ##
## Author: 	Ambika J                                              ##
## Date: 	Jun-2014                                              ##
## Notes: 	Getting and cleaning data                             ##
########################################################################

library("data.table")
library("plyr")
library("reshape2")

#setwd("~/Desktop/OTHERSonDESKTOP/CourseraCourses/DataAnalysis-courseraCourse/03-GettingAndCleaningData")
#setwd("/Users/ambika/gitDir/coursera/data-analysis/03-getting-and-cleaning-data")

#############################################
## 	File and Folder section		   ##
#############################################
## Folder: check/create
if (!file.exists("data")) {
    dir.create("data")
}

## File: check/download and unzip 
if (!file.exists("data/UCI HAR Dataset")) {
	fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(fileUrl, destfile = "./data/UCI-HAR-Dataset.zip", method = "curl")
	setwd("data")
	unzip("UCI-HAR-Dataset.zip")
	setwd("UCI HAR Dataset")
} else {
	setwd("data/UCI HAR Dataset")
}

#############################################
## 		Functions block		   ##
#############################################

##=========================================##
## combine_data: combine train and test data.
## 1. combine subject, y and x of test and train
## 2. then, combine test and train data
##=========================================##
combine_data <- function() {
	## read test data
	sub_test = read.table("test/subject_test.txt")
	y_test = read.table("test/y_test.txt")
	x_test = read.table("test/X_test.txt",colClasses = "numeric")
        ## combine - subject, y and x of "test"
	test_data = cbind(sub_test,y_test,x_test)

	## read train data
	sub_train = read.table("train/subject_train.txt")
	y_train = read.table("train/y_train.txt")
	x_train = read.table("train/X_train.txt",colClasses = "numeric")
	## combine - subject, y and x of "train"
	train_data = cbind(sub_train,y_train,x_train)

	## combine test and train data
	rbind(train_data,test_data) 
}

##=========================================##
## variable_name_replacements:
##	Replace all the short names to descriptive ones.
##	parameters: x (a data frame with column names)
##=========================================##
variable_name_replacements <- function(x) {
	## Feature details ##
	# t/f -> domain signals: time / frequency [Fast Fourier Transform (FFT)]
	# X,Y or Z -> 3 axial signals: X,Y and Z directions.
	# Acc/Gyro -> accelerometer/ gyroscope
	# Body/Gravity
	# Jerk/JerkMag/Mag -> Jerk/Jerk Magnitude / Magnitude
	# mean()/std() -> Mean value / Standard deviation
	##-----------------##

	# Single line command for replacements of the variable names for better descriptive variable names.
	#tmpcolnames <- gsub("std","standarddeviation",(gsub("std","standarddeviation",(gsub("\\(\\)","",(gsub("--","-",(gsub("-Mag","-magnitude-",(gsub("-Jerk","-jerk-",(gsub("-JerkMag","-jerkmagnitude-", gsub("-Gyro","-gyroscope-",(gsub("-Acc","-accelerometer-",(gsub("-Gravity","-gravity-",(gsub("-Body","-body-",(gsub("^f","frequency-",(gsub("^t","time-",(gsub("BodyBody","Body",colnames(x)))))))))))))))))))))))))))  

	# For better understanding, multiple line replacements (of the variable names for descriptive variable names).
	tmpcolnames <- colnames(x)
	tmpcolnames <- gsub("BodyBody","Body",tmpcolnames)
	tmpcolnames <- gsub("^t","time-",tmpcolnames)
	tmpcolnames <- gsub("^f","frequency-",tmpcolnames)
	tmpcolnames <- gsub("-Body","-body-",tmpcolnames)
	tmpcolnames <- gsub("-Gravity","-gravity-",tmpcolnames)
	tmpcolnames <- gsub("-Acc","-accelerometer-",tmpcolnames)
	tmpcolnames <- gsub("-Gyro","-gyroscope-",tmpcolnames) 
	tmpcolnames <- gsub("-JerkMag","-jerkmagnitude-",tmpcolnames)
	tmpcolnames <- gsub("-Jerk","-jerk-",tmpcolnames)
	tmpcolnames <- gsub("-Mag","-magnitude-",tmpcolnames)
	tmpcolnames <- gsub("--","-",tmpcolnames)
	tmpcolnames <- gsub("\\(\\)","",tmpcolnames)
	tmpcolnames <- gsub("std","standarddeviation",tmpcolnames)

        ### 1. Convert all variable names to lowercase.
	#tmpcolnames <- gsub("-","",tmpcolnames)
        
	### 2. Convert all varible names to camelCase.
	## This will replace "-" and every character after "-", to Upper case of that character. 
        ## E.g. time-time -> timeTime.
	#tmpcolnames <- gsub("-([^ ])", "\\U\\1", tmpcolnames, perl=TRUE) 
        
	## Not applying any of the above 2 techniques for now (lowercase or camelCase), 
        ## for better readbility retaining "-" in the variable.

	tmpcolnames
}

#############################################
## 		   MAIN	       	           ##
#############################################

##=========================================## 
## 1. Merge data 
## (subject, y and x) of (test and train)
##=========================================##
all_data <- combine_data()

## temporary assignment of vairble names as in features.txt
features <- read.table("features.txt")
colnames(all_data) <- c("subject","activityId",t(features[2]))

## cleaning up the unwanted variables
rm(features)

##=========================================## 
## 2. Extract only mean & standarad deviation
##=========================================## 
colIndex <- grep("mean\\(\\)|std\\(\\)",colnames(all_data))
sliced_data <- all_data[,c(1,2,colIndex)]

## cleaning up the unwanted variables
rm(colIndex)
rm(all_data)

##=========================================## 
## 3. Descriptive Activity names
##=========================================## 
activities <- read.table("activity_labels.txt")
colnames(activities) <- c("activityId","activity") 
jn <- arrange(join(activities,sliced_data),activityId)

## cleaning up the unwanted variables
rm(activities)
rm(sliced_data)

##=========================================## 
## 4. Descriptive variable names
##=========================================##
colnames(jn) <- variable_name_replacements(jn)

##=========================================## 
## 5. independent tidy data set 
##      with the average(mean) of each variable 
##	for each activity and subject combination
##=========================================## 
## to retain the same order of activityId, perform melt and dcast with activityId
## after dcast is complete, extract final data excluding activityId
dataMelt <- melt(jn,id=c("activityId","activity","subject"))
subActData <- dcast(dataMelt, activityId + activity + subject ~ variable,mean)
final <- subActData[,2:length(subActData)]

## Write it to a text file.
write.table(final,file="final.txt",row.names=FALSE, col.names=TRUE, sep="\t", quote=FALSE)

############################################# 
##      End of the script - cleanup        ##
############################################# 
rm(list=ls())

########################################################################