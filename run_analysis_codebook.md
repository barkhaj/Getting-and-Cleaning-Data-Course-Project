Tidy data set features
=================

##Study Design

This data set is derived from a database "containing accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. The data was collected using a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist." (para phrased from original data set features_info.txt file)

More information about the original database is available from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The features selected for this tidy data set contain mean or standard deviation measurements. The t prefix indicates time domain signal measurements and the f prefix indicates frequency domain signal measurements. Excluded meanFreq columns as the tidy data set is a summary of average measurements by subject and activity. There are 180 summary observations for 30 volunteers participating in 6 activities.


##Code book

Definitions from the original data set as described in the features_info.txt file:
* mean: Mean value
* std: Standard deviation
* '-XYZ' used to denote 3-axial signals in the X, Y and Z directions


Abbreviations:
* Acc - Accelerometer
* Gyro - Gyroscope
* t - time
* f - frequency, a Fast Fourier Transform was applied to the signals


Complete list of 68 column names in the tidy data set for 30 volunteers.

* Subject  - Vounteer participating in the experiment
* Activity - A description of the activity that measurements are collected for example: WALKING
* tBodyAcc_Mean_X
* tBodyAcc_Mean_Y
* tBodyAcc_Mean_Z
* tBodyAcc_Std_X
* tBodyAcc_Std_Y
* tBodyAcc_Std_Z
* tGravityAcc_Mean_X
* tGravityAcc_Mean_Y
* tGravityAcc_Mean_Z
* tGravityAcc_Std_X
* tGravityAcc_Std_Y
* tGravityAcc_Std_Z
* tBodyAccJerk_Mean_X
* tBodyAccJerk_Mean_Y
* tBodyAccJerk_Mean_Z
* tBodyAccJerk_Std_X
* tBodyAccJerk_Std_Y
* tBodyAccJerk_Std_Z
* tBodyGyro_Mean_X
* tBodyGyro_Mean_Y
* tBodyGyro_Mean_Z
* tBodyGyro_Std_X
* tBodyGyro_Std_Y
* tBodyGyro_Std_Z
* tBodyGyroJerk_Mean_X
* tBodyGyroJerk_Mean_Y
* tBodyGyroJerk_Mean_Z
* tBodyGyroJerk_Std_X
* tBodyGyroJerk_Std_Y
* tBodyGyroJerk_Std_Z
* tBodyAccMag_Mean
* tBodyAccMag_Std
* tGravityAccMag_Mean
* tGravityAccMag_Std
* tBodyAccJerkMag_Mean
* tBodyAccJerkMag_Std
* tBodyGyroMag_Mean
* tBodyGyroMag_Std
* tBodyGyroJerkMag_Mean
* tBodyGyroJerkMag_Std
* fBodyAcc_Mean_X
* fBodyAcc_Mean_Y
* fBodyAcc_Mean_Z
* fBodyAcc_Std_X
* fBodyAcc_Std_Y
* fBodyAcc_Std_Z
* fBodyAccJerk_Mean_X
* fBodyAccJerk_Mean_Y
* fBodyAccJerk_Mean_Z
* fBodyAccJerk_Std_X
* fBodyAccJerk_Std_Y
* fBodyAccJerk_Std_Z
* fBodyGyro_Mean_X
* fBodyGyro_Mean_Y
* fBodyGyro_Mean_Z
* fBodyGyro_Std_X
* fBodyGyro_Std_Y
* fBodyGyro_Std_Z
* fBodyAccMag_Mean
* fBodyAccMag_Std
* fBodyBodyAccJerkMag_Mean
* fBodyBodyAccJerkMag_Std
* fBodyBodyGyroMag_Mean
* fBodyBodyGyroMag_Std
* fBodyBodyGyroJerkMag_Mean
* fBodyBodyGyroJerkMag_Std


