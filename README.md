#Project `run_analysis`
tidy data assignment for Coursera
This script uses the `dplyr` package

##Download UCI HAR dataset
The script downloads a zip compressed file of the _Human Activity Recognition Using Smartphones Data Set_ from the _University of California, Irvine Machine Learning Repository_. The zip file contains a database built from the recordings of 30 subjects performing activities captured by smartphones with embedded inertial sensors. The script checks if a folder called *ucihar* exists in the working directory, then creates on if it does not.

##Open the features file, and the three files each for test and train 
An `unzip` extracts six files and saves them in the *ucicar* folder:

* *features.txt*

* *subject_test.txt*

* *X_test.txt*

* *y_test.txt*

* *subject_train.txt*

* *X_train.txt*

* *y_train.txt*

The six files are then opened as data frames, without a header row. The Activity label files (the y-files) and the subject files are opened as text, so that the activities values can be replaced with text descriptions, and the subjects can be converted to factors.

##Create one data frame from the three test data frames and three train data frames
Creating one data frame from the six is a two-step process. First, the three test data frames and three train data frames are combined using `cbind` to create a single test data frame and train data frame. then `rbind` combines the test and train data frames into one data frame.

##Label the activities
The *activities.txt* file is opened as a data table, coercing the first column to text so that it can be matched to the activities column values in the combined test and train data table. The numeral idetifiers of each activity type are replaced with text descriptors from the activities table, using a for loop to cycle through each row of the table, and nested if statements to replace each numeral with the text label from the .

##Group results by activities and by subject
To create the output for step 5 of the assignment, the combined data table is grouped by activity and subject. Using the 'summarize_each' function, the average of the results in each of the 79 columns is calculated for each of the activity-subject groups.

#Output
The output file, *harSummary.txt* was written to the *ucihar* folder, from the `outputTable` data frame.