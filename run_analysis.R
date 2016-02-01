#load dplyr
library("dplyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.2/Resources/library")

#download UCI HAR dataset
urlUcihar <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("./ucihar")) {dir.create("./ucihar")}
download.file(urlUcihar, destfile = "./ucihar/dataset.zip", method = "curl")
dataZip <- "./ucihar/dataset.zip"
unzip(dataZip,exdir = "./ucihar")

rm(urlUcihar)
rm(dataZip)

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
rm(unpackList)

#create one file from each set of test files and train files
testFile <- data.frame(measurements = ytestFile, activity = xTestUnpack, subject = subjectTestFile)
trainFile <- data.frame(measurements = ytrainFile, activity = xTrainUnpack, subject = subjectTrainFile)
names(testFile) <- c("activity_type","activity_mean","activity_standard_deviation", "subject")
names(trainFile) <- c("activity_type","activity_mean","activity_standard_deviation", "subject")

rm(xTestUnpack)
rm(xTrainUnpack)
rm(ytestFile)
rm(ytrainFile)
rm(subjectTestFile)
rm(subjectTrainFile)

#combine the test file and train file into one file
dataFile <- rbind(testFile,trainFile)
dataFile$activity_type <- as.factor(dataFile$activity_type)

rm(testFile)
rm(trainFile)

#label the activities
sortDataFile <- arrange(dataFile, activity_type)
rm(dataFile)

activityLabels <- read.delim("./ucihar/UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = "\t")
levels(sortDataFile$activity_type) <- activityLabels[[1]]

rm(activityLabels)

#summarize data grouped by subject and activities
outputCount <- table(sortDataFile$subject,sortDataFile$activity_type)
outputSum <- xtabs(activity_mean ~ subject + activity_type, data = sortDataFile)
outputTable <- outputSum / outputCount

rm(sortDataFile)
rm(outputSum)
rm(outputCount)

#save output to text file
write.table(outputTable,"./ucihar/harSummary.txt")

rm(outputTable)