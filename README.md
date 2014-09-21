This is a class assignment from coursera course 'Getting and Cleaning Data' under the Data Sciences track offered from John Hopkins University.

The raw data is within this repo and is structured under the 'UCI HAR Dataset'.

The data being analyzed is under the test and train directories, which are mirrors of eachother in layout. The subject_test.txt is the Subject(person) the data was collected from. The y_test.txt is the activity performed (see activity_labels below). The x_test.txt is the raw data. The train directory is respective in layout to the test directory (which was just explained).

In the root directory of the the study the activity_label.txt spells out the exact activity (this is for the y_test.txt and y_train.txt data). The features explains the 561 columns of raw data in the x_test.txt and x_train.txt files. 

Lastly the features_info.txt and the README.txt spell out in more depth how the study was run and the meanings of some the features, etc.

To run this:

setwd('to/local/path/where/assign3.R')
tidy <- runTidyData()

a secondary study file will be created and placed in the same directory as the assign3.R file. This file has the name second_study.txt.

The goal of this assignment is as such: 

You should create one R script called run_analysis.R that does the following. 
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
