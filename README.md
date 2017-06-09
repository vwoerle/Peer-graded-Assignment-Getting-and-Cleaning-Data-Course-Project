# Peer-graded-Assignment-Getting-and-Cleaning-Data-Course-Project
Programming Assignment for Getting and Cleaning Data Course

Creation of 2 datasets:

finaldata: tidy data set with measurements on mean and standard deviation, subject identifier (1-30) and activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

finaldata2: second, independent tidy data set with the average of each variable (mean and standard deviation) for each activity and each subject


Script:
(1) Downloading and Unzipping of File
(2) Reading of Training and Test Data Sets (-> train, test)
(3) Reading of Activity Labels  (activity labels) -> Rename of columns  & Cleaning
(4) Merging of Training and Test Datasets (-> traintest)
(5) Reading of Label Data Set (y_test.txt, y_train.txt) -> Binding to merged data "traintest" (-> 2 more variables)
(6) Merging Labels to Activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
    -> activitytraintest
(7) Delete Column "Label" since this variable is described by activity
(8) Subset: Measurements on mean and standard deviation -> activitytraintest_subset
(9) Cleaning of "activitytraintest_subset" -> "final data"

(10) Creation of second dataset finaldata2 ("groupedmean") with the average of each variable for each activity and each subject
