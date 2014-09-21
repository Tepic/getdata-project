
run_analysis <- function(){
  if (!file.exists("UCI HAR Dataset"))
  {
    stop("Please set working directory to where assign3.R is located! i.e. setwd('some/dir/path')")
  }
  library("reshape2")
  
  
  
  activity <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activityLabel", "activityDesc"))
  features <- read.table("UCI HAR Dataset/features.txt", col.names = c("featureRow", "featureName"))
  #do the paste cuz some of the colnames are the same and dcast won't work
  features$featureName <-  paste(as.character(features$featureRow) , features$featureName)
  subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
  xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
  yTest <- read.table("UCI HAR Dataset/test/Y_test.txt")
  subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
  xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
  yTrain <- read.table("UCI HAR Dataset/train/Y_train.txt")
  
  #rename columns for xTest and xTrain
  names(xTest) <- features$featureName
  names(xTrain) <- features$featureName
  
  #rename column for subjectTrain and subjectTest
  names(subjectTest) <- "Subject"
  names(subjectTrain) <- "Subject"
  
  #merge activity to yTrain and yTest to get yTrainDesc and yTestDesc
  yTrainDesc <- merge(yTrain, activity, by.x="V1", by.y="activityLabel")[2]
  yTestDesc <- merge(yTest, activity, by.x="V1", by.y="activityLabel")[2]
  
  #cbind our subjectXXX, yXXX and xXXX
  test <- cbind(subjectTest, yTestDesc, xTest)
  train <- cbind(subjectTrain, yTrainDesc, xTrain)
  
  #rbind test and train
  allData <- rbind(test, train)
  
  #create the second study
  #melt by Subject and activityDesc
  meltStudy <- melt(allData, id=1:2, measure.vars=3:563)
  #now lets dcast this to mean values
  dcastStudy <- dcast(meltStudy, Subject + activityDesc ~ variable, mean)
  write.table(dcastStudy, "second_study.txt", row.name=F)
  
  cat("INFO: Writing second_study.txt to ", getwd(), "\n\n");
  
  #back to the first study
  #get the colnames we are interested in ...
  colsOfInterest <- grep("subject|activityDesc|mean|std", names(allData), ignore.case=T)
  
  #slimData
  slimData <- allData[,colsOfInterest]
  
  #return the slimData ... which is the tidy data (the first study)
  slimData
}
