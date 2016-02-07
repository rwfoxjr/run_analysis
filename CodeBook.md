#Project `run_analysis`
Summary of the _Human Activity Recognition Using Smartphones Data Set_ from the _University of California, Irvine Machine Learning Repository_.

Data for this summary was taken from seven files within the data set:

* *subject_test.txt*

* *X_test.txt*

* *y_test.txt*

* *subject_train.txt*

* *X_train.txt*

* *y_train.txt*

* *activity_labels.txt*

The "test" set of data contains 2,947 observations from the HAR study. The `X_test.txt` file contains the activity measurements, the `y_test.txt` file contains the numerical code for the type of activity captured by each observation, and the `subject_test` file contains an identifier of the subject participating in the study to assiciate with each of the observations.

The "train" set of data contains 7,352 observations from the same study, with the same three types of files. The `activity_labels.txt` file lists the descriptive titles for each of the numerically coded activity types captured in the `y` files.

# Data frame contents
The results of this summary are available as data frames, containing the following columns:

##activity_type
The number from 1 to 6, indicating the type of activity measured in the study:
  
  1 WALKING
  
  2 WALKING_UPSTAIRS
  
  3 WALKING_DOWNSTAIRS
  
  4 SITTING
  
  5 STANDING
  
  6 LAYING

##subject
A numerical code distinguishing the collected activity measurements by study partcipant.

##activity measurements
A subset of the measurements from the *X_test.txt* and *X_train.txt* files, that includes only the columns for means and standard deviations:

* tBodyAcc-mean()-X

* tBodyAcc-mean()-Y

* tBodyAcc-mean()-Z

* tGravityAcc-mean()-X

* tGravityAcc-mean()-Y

* tGravityAcc-mean()-Z

* tBodyAccJerk-mean()-X

* tBodyAccJerk-mean()-Y

* tBodyAccJerk-mean()-Z

* tBodyGyro-mean()-X

* tBodyGyro-mean()-Y

* tBodyGyro-mean()-Z

* tBodyGyroJerk-mean()-X

* tBodyGyroJerk-mean()-Y

* tBodyGyroJerk-mean()-Z

* tBodyAccMag-mean()

* tGravityAccMag-mean()

* tBodyAccJerkMag-mean()

* tBodyGyroMag-mean()

* tBodyGyroJerkMag-mean()

* fBodyAcc-mean()-X

* fBodyAcc-mean()-Y

* fBodyAcc-mean()-Z

* fBodyAccJerk-mean()-X

* fBodyAccJerk-mean()-Y

* fBodyAccJerk-mean()-Z

* fBodyGyro-mean()-X

* fBodyGyro-mean()-Y

* fBodyGyro-mean()-Z

* fBodyAccMag-mean()

* fBodyBodyAccJerkMag-mean()

* fBodyBodyGyroMag-mean()

* fBodyBodyGyroJerkMag-mean()

* fBodyAcc-meanFreq()-X

* fBodyAcc-meanFreq()-Y

* fBodyAcc-meanFreq()-Z

* fBodyAccJerk-meanFreq()-X

* fBodyAccJerk-meanFreq()-Y

* fBodyAccJerk-meanFreq()-Z

* fBodyGyro-meanFreq()-X

* fBodyGyro-meanFreq()-Y

* fBodyGyro-meanFreq()-Z

* fBodyAccMag-meanFreq()

* fBodyBodyAccJerkMag-meanFreq()

* fBodyBodyGyroMag-meanFreq()

* fBodyBodyGyroJerkMag-meanFreq()

* tBodyAcc-std()-X

* tBodyAcc-std()-Y

* tBodyAcc-std()-Z

* tGravityAcc-std()-X

* tGravityAcc-std()-Y

* tGravityAcc-std()-Z

* tBodyAccJerk-std()-X

* tBodyAccJerk-std()-Y

* tBodyAccJerk-std()-Z

* tBodyGyro-std()-X

* tBodyGyro-std()-Y

* tBodyGyro-std()-Z

* tBodyGyroJerk-std()-X

* tBodyGyroJerk-std()-Y

* tBodyGyroJerk-std()-Z

* tBodyAccMag-std()

* tGravityAccMag-std()

* tBodyAccJerkMag-std()

* tBodyGyroMag-std()

* tBodyGyroJerkMag-std()

* fBodyAcc-std()-X

* fBodyAcc-std()-Y

* fBodyAcc-std()-Z

* fBodyAccJerk-std()-X

* fBodyAccJerk-std()-Y

* fBodyAccJerk-std()-Z

* fBodyGyro-std()-X

* fBodyGyro-std()-Y

* fBodyGyro-std()-Z

* fBodyAccMag-std()

* fBodyBodyAccJerkMag-std()

* fBodyBodyGyroMag-std()

* fBodyBodyGyroJerkMag-std()