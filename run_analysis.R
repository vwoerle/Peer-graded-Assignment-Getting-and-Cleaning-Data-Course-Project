# Set Working Directory ####
setwd("~/R/Coursera_Data Cleaning")

# Download and Unzip File ####
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","data.zip", mode="wb")
unzip("data.zip")

# Read Training and Test Dataset ####
train <- read.table("UCI HAR Dataset/train/X_train.txt")
test <- read.table("UCI HAR Dataset/test/X_test.txt")

## Features ####
features <- read.table("UCI HAR Dataset/features.txt")
# rename column names of test and training dataset
colnames(test) <- features[,2]
colnames(train) <- features[,2]

# Read Activity Labels ####
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")
# rename column names
colnames(activitylabels) <- c("labels","activity")
# big letters into small letters
tolower(activitylabels$activity)


# Merge Training and Test Dataset ####
traintest <- rbind(train, test)

# Label and Subject ####
# add column subject
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt")
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
traintest$subject <- unlist(rbind(subjecttrain,subjecttest))
# add column label
testlabels <- read.table("UCI HAR Dataset/test/y_test.txt")
trainlabels <- read.table("UCI HAR Dataset/train/y_train.txt")
traintest$label <- unlist(rbind(trainlabels,testlabels))

# Merge labels with activity description ####
activitytraintest <- merge(traintest,activitylabels, by.x="label", by.y="labels", all=TRUE)

#Delete column "label" ####
activitytraintest <- activitytraintest[-1]

# subset of only mean and standard deviation variables ####
activitytraintest_subset <- activitytraintest[,c(which(grepl("[Mm]ean|std", colnames(activitytraintest))),562,563)]


#replacement to describe variables ####
# delete brackets
colnames(activitytraintest_subset) <- gsub("\\()", "", colnames(activitytraintest_subset))
#
colnames(activitytraintest_subset) <- gsub("Gyro","Gyroscope",colnames(activitytraintest_subset))
colnames(activitytraintest_subset) <- gsub("Acc","Acceleration",colnames(activitytraintest_subset))
colnames(activitytraintest_subset) <- gsub("^t","time-",colnames(activitytraintest_subset))
colnames(activitytraintest_subset) <- gsub("^f","frequency-",colnames(activitytraintest_subset))
colnames(activitytraintest_subset) <- gsub("Mag","Magnitude",colnames(activitytraintest_subset))

finaldata <- activitytraintest_subset

# second, independent tidy data set with the average of each variable for each activity and each subject
library(dplyr)
grouped <- group_by(activitytraintest_subset,subject, activity)
groupedmean <- summarise_each(grouped, funs(mean))

finaldata2 <- groupedmean