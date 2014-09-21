This is the class assignment from coursera course 'Getting and Cleaning Data' under the Data Sciences track offered from John Hopkins University.

The raw data is within this repo and is structured under the 'UCI HAR Dataset'.

The data being analyzed is under the test and train directories, which are mirrors of eachother in layout. The subject_test.txt is the Subject(person) the data was collected from. The y_test.txt is the activity performed (see activity_labels below). The x_test.txt is the raw data. The train is respective in layout.

In the root directory of the the study the activity_label.txt spells out the exact activity. The features explains the 561 columns of raw data in the x_test.txt and x_train.txt files. 

Lastly the features_info.txt and the README.txt spell out in more depth how the study was run and the meanings of some the features, etc.

To run this:

setwd('to/local/path/where/assign3.R')

tidy <- runTidyData()

a secondary study file will be created and placed in the same directory as the assign3.R file. This file has the name second_study.txt.


