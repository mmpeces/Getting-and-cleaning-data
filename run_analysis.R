##Getting and cleaning data course project R code

##libraries needed
library(data.table)
library(reshape2)

##Location to download zip file and getting data

##fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
##zipfile <-"./galData.zip"
##download.file(fileurl, zipfile)
##zipfile_download_date <- date()
##unzip(zipfile, overwrite=TRUE)



##1. Merged the training and the test sets to create one data set.
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
label_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names="label")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names="subject")

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
label_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names="label")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names="subject")

alldata <- rbind(cbind(subject_test, label_test, x_test),cbind(subject_train, label_train, x_train))


##2. Extracted only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("./UCI HAR Dataset/features.txt", strip.white=TRUE, stringsAsFactors=FALSE)
mean_stdev <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]
mean.stdev.measurements <- alldata[, c(1, 2, mean_stdev$V1+2)]


##3. Used descriptive activity names to name the activities in the data set
activity <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)
mean.stdev.measurements$label <- activity[mean.stdev.measurements$label, 2]



##4. Appropriately labeled the data set with descriptive variable names.
variable.names <- c("subject", "activity", mean_stdev$V2)
unique(variable.names)
variable.names <- gsub("tBody", "timebody", variable.names)
variable.names <- gsub("tGravity", "timegravity", variable.names)
variable.names <- gsub("fBody", "fftbody", variable.names)
variable.names <- gsub("fGravity", "fftgravity", variable.names)
variable.names  <- tolower(gsub("[^[:alpha:]]", "", variable.names))
colnames(mean.stdev.measurements) <- variable.names


##5 From the data set in step 4, created a second, independent tidy data set with the average 
##of each variable for each activity and each subject.

tidy.melt <-melt(mean.stdev.measurements,id=c("subject","activity"))
tidy.cast <- dcast(tidy.melt, subject + activity ~ variable, mean)

write.table(tidy.cast, "tidy.txt", row.names=FALSE)




