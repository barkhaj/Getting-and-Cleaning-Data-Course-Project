#### Get data ####
#### Set working directory and download zip files

  #Assume have set working directory
  #Example:
  #setwd("C:/Users/Barkha/Desktop/Data_Science/GettingAndCleaningData/Assign_Wk_3")
  
  #Download and unzip file
  zipFile<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  destFile<-"assignWK3_Dataset.zip"
  if(!file.exists(destFile)) {
      download.file(zipFile,destFile)
    }
  unzip(destFile,overwrite=TRUE)

  library(dplyr)



#### Read files ####

  #Load activity labels
  activityFile<-"./UCI HAR Dataset/activity_labels.txt"
  activityLabels<-read.table(activityFile)
  #rename column names
  names(activityLabels)<-c("Activity_ID","Activity_Description")
  
  #Load test data 
  testFile<-"./UCI HAR Dataset/test/X_test.txt"
  testData<-read.table(testFile)
  
  #Load Activity test data
  testActivityFile<-"./UCI HAR Dataset/test/y_test.txt"
  testActivityData<-read.table(testActivityFile)
  names(testActivityData)<-"Activity_ID"
  testActivity<-inner_join(testActivityData,activityLabels,by="Activity_ID")


  #Load Subject test data
  testSubjectFile<-"./UCI HAR Dataset/test/subject_test.txt"
  testSubjectData<-read.table(testSubjectFile)
  
  #Load training data 
  trainFile<-"./UCI HAR Dataset/train/X_train.txt"
  trainData<-read.table(trainFile)
  
  #Load Activity training data
  trainActivityFile<-"./UCI HAR Dataset/train/y_train.txt"
  trainActivityData<-read.table(trainActivityFile)
  names(trainActivityData)<-"Activity_ID"
  trainActivity<-inner_join(trainActivityData,activityLabels,by="Activity_ID")

  #Load Subject training data
  trainSubjectFile<-"./UCI HAR Dataset/train/subject_train.txt"
  trainSubjectData<-read.table(trainSubjectFile)


#### Name columns with mean or standard deviation using features.txt 

  #load features file
  featuresFile<-"./UCI HAR Dataset/features.txt"
  featuresData<-read.table(featuresFile)
  
  #Pick records for mean() or standard std() variables only
  featuresPick<-grep(".mean\\(|.std.",featuresData$V2)
  featuresPick<-data.frame(featuresPick)
  names(featuresPick)<-"V1"
  
  #Only keep variables , that match mean and standard selected in features_data
  featuresKeep<-merge(featuresData,featuresPick,by="V1")
  names(featuresKeep)[names(featuresKeep)=="V1"]<-"MeasureCols"
  names(featuresKeep)[names(featuresKeep)=="V2"]<-"MeasureName"
  
  #Update column names in featuresKeep from 2,3,4 to example V2,V3,V4 etc
  featuresKeep$MeasureCols<-paste0("V",featuresKeep$MeasureCols)

  #Use friendly names - remove brackets and replace hyphen with underscore
  featuresKeep$MeasureName <- gsub("\\(\\)","",featuresKeep$MeasureName)
  featuresKeep$MeasureName <- gsub("-","_",featuresKeep$MeasureName)
  featuresKeep$MeasureName <- gsub("mean","Mean",featuresKeep$MeasureName)
  featuresKeep$MeasureName <- gsub("std","Std",featuresKeep$MeasureName)



#### Update column names ####

    #Only keep mean and standard columns for training data
    trainMeasuresData <- trainData[featuresKeep$MeasureCols]
    
    #Rename columns in measures_data with V2 values in featuresKeep
    names(trainMeasuresData) <- featuresKeep$MeasureName
    
    #Only keep mean and standard columns for test data
    testMeasuresData <- testData[featuresKeep$MeasureCols]
    
    #Rename columns in measures_data with V2 values in featuresKeep
    names(testMeasuresData) <- featuresKeep$MeasureName

    #Add Subject to test data
    testMeasuresData$Subject_ID<-testSubjectData$V1
   
    #Add Activity to test data
    testMeasuresData$Activity_ID<-testActivity$Activity_ID
    testMeasuresData$Activity_Desc<-testActivity$Activity_Desc
    
    #add Activity to training data
    trainMeasuresData$Activity_ID<-trainActivity$Activity_ID
    trainMeasuresData$Activity_Desc<-trainActivity$Activity_Desc
      
    #Add Subject to training data
    trainMeasuresData$Subject_ID<-trainSubjectData$V1


#### Combine test and training data start ####
  #Check columns
  head(trainMeasuresData)
  head(testMeasuresData)

  #Combine datasets
  combinedData<-rbind(trainMeasuresData,testMeasuresData)

  #Aggregate average
  avgData<-aggregate(combinedData,by=list(Subject = combinedData$Subject, Activity = combinedData$Activity_Desc),FUN="mean")

  avgData$Activity_ID<-NULL
  avgData$Activity_Desc<-NULL
  avgData$Subject_ID<-NULL


#### Write table to text file start ####
  write.table(avgData, file = "tidy_data.txt", sep=",",row.names = FALSE)





  
