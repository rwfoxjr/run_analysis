#download UCI HAR dataset
urlUcihar <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("./ucihar")) {dir.create("./ucihar")}
download.file(urlUcihar, destfile = "./ucihar/dataset.zip", method = "curl")
dataZip <- "./ucihar/dataset.zip"
unzip(dataZip,exdir = "./ucihar")

#open the three files each for test and train 
xtestFile <- read.delim("./ucihar/UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "\t", stringsAsFactors = FALSE)
ytestFile <- read.delim("./ucihar/UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "\t")
subjectTestFile <- read.delim("./ucihar/UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "\t")
xtrainFile <- read.delim("./ucihar/UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "\t", stringsAsFactors = FALSE)
ytrainFile <- read.delim("./ucihar/UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "\t")
subjectTrainFile <- read.delim("./ucihar/UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "\t")

#unpack the numeric data fom lists within lists
unpackList <- function(x) {
  lengthTest <- length(x[[1]])
  meanTest <- vector("numeric",lengthTest)
  sdTest <- vector("numeric",lengthTest)
  for (i in 1:lengthTest) {
    lineTest <- x[[1]][[i]]
    parseTest <- strsplit(lineTest[[1]],"\\s")
    vectorTest <- as.vector(strsplit(parseTest[[1]],"\\s"),"numeric")
    meanTest[i] <- mean(vectorTest,na.rm = TRUE)
    sdTest[i] <- sd(vectorTest,na.rm = TRUE)
  }
  resultTest <- data.frame(meanTest,sdTest)
  return(resultTest)
}

xTestUnpack <- unpackList(xtestFile)
xTrainUnpack <- unpackList(xtrainFile)

rm(xtestFile)
rm(xtrainFile)

#create one file from each set of test files and train files
testFile <- data.frame(measurements = ytestFile, activity = xTestUnpack, subject = subjectTestFile)
trainFile <- data.frame(measurements = ytrainFile, activity = xTrainUnpack, subject = subjectTrainFile)

#Label the data set with descriptive variable names.
names(testFile) <- c("activity","mean","standard deviation", "subject")
names(trainFile) <- c("activity","mean","standard deviation", "subject")

rm(xTestUnpack)
rm(xTrainUnpack)
rm(ytestFile)
rm(ytrainFile)
rm(subjectTestFile)
rm(subjectTrainFile)

#Assign descriptive activity names to name the activities in the data set
sortTestFile <- arrange(testFile, activity)
sortTrainFile <- arrange(trainFile, activity)

activityLabels <- read.delim("~/Documents/Coursera/wk4Project/UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = "\t")
levels(sortTestFile$activity) <- activityLabels
levels(sortTrainFile$activity) <- activityLabels
rm(activityLabels)

#combine the test file and train file into one file
dataFile <- rbind(testFile,trainFile)

rm(testFile)
rm(trainFile)

#Create a second, independent tidy data set with the average of each variable
#for each activity and each subject.
