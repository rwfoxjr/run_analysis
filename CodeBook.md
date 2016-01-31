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

##activity_mean
Measurements of the subjects activities in the study were collected in groupings of 128 measurements. The results in this file are the averages of the 128 measurement samples.

##activity_standard_deviation
These results are standard deviations calculated from the groups of 128 measurements described above

##subject
A numerical code distinguishing the collected activity measurements by study partcipant.
