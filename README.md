#Project `run_analysis`
tidy data assignment for Coursera
This script uses the `dplyr` package

##Download UCI HAR dataset
The script downloads a zip compressed file of the _Human Activity Recognition Using Smartphones Data Set_ from the _University of California, Irvine Machine Learning Repository_. The zip file contains a database built from the recordings of 30 subjects performing activities captured by smartphones with embedded inertial sensors. The script checks if a folder called *ucihar* exists in the working directory, then creates on if it does not.

##Open the three files each for test and train 
An `unzip` extracts six files and saves them in the *ucicar* folder:

* *subject_test.txt*

* *X_test.txt*

* *y_test.txt*

* *subject_train.txt*

* *X_train.txt*

* *y_train.txt*

The six files are also opened as data frames, with `stringsAsFactors = FALSE`.

##Unpack the numeric data fom lists within lists
Two of the files, *X_test.txt* and *X_train.txt* contain lists within lists, consisting of 2,947 and 7,352 rows with 128 measurements recorded on each row. The 128 measurements appear as a single text string, with each measurement in scientific notation (n.nnnnnnne-001), separated by a space. The function `unpackList(x)` separates the strings of each row into 128 numeric values. It then returns the mean and standard deviation of each row into a new data frame.

##Create one data frame from the three test data frames and three train data frames
Creating one data frame from the six is a two-step process. First, the three test data frames and three train data frames are combined using `cbind` to create a single test data frame and train data frame. then `rbind` combines the test and train data frames into one data frame.

##Label the activities
Another file included in the UCI HAR data set is *activity_labels.txt*, which contains descriptive labels for the numeric values indicating the types of activities in the *y_test.txt* and *y_train.txt* files. The combined test and train data frame is first sorted by the numeric values in the `activity` column, then the descriptive labels are assigned to the values in that column using `levels()`. This step required that the `activities` column be coerced from numeric to factor mode.

##Group results by activities and by subject
Using `table()` and `xtabs()`, two data frames are created to count and total the activity measurements by subject and activity type. Dividing the total data frame by the count data frame produced a dataframe with the average activity by subject and activity type.

#Output
The output file, *harSummary.txt* was written to the *ucihar* folder, from the `outputTable` data frame.
