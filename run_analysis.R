#load plyr and dplyr
library("dplyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.2/Resources/library")

#download UCI HAR dataset
urlUcihar <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("./ucihar")) {dir.create("./ucihar")}
download.file(urlUcihar, destfile = "./ucihar/dataset.zip", method = "curl")
dataZip <- "./ucihar/dataset.zip"
unzip(dataZip,exdir = "./ucihar")
rm(dataZip)
rm(urlUcihar)

#open the features file, and the three files each for test and train 
featuresTable <- read.table("./ucihar/UCI HAR Dataset/features.txt", header = FALSE)
xTestTable <- read.table("./ucihar/UCI HAR Dataset/test/X_test.txt", header = FALSE)
yTestTable <- read.table("./ucihar/UCI HAR Dataset/test/y_test.txt", header = FALSE, col.names = "Activity Type", colClasses = "character")
subjectTestTable <- read.table("./ucihar/UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = "Subject")
xTrainTable <- read.table("./ucihar/UCI HAR Dataset/train/X_train.txt", header = FALSE)
yTrainTable <- read.table("./ucihar/UCI HAR Dataset/train/y_train.txt", header = FALSE, col.names = "Activity Type")
subjectTrainTable <- read.table("./ucihar/UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = "Subject")

names(xTestTable) <- featuresTable[,2]
names(xTrainTable) <- featuresTable[,2]

rm(featuresTable)

#create one table from each set of test tables and train tables
testTable <- data.frame(yTestTable, subjectTestTable, xTestTable)
trainTable <- data.frame(yTrainTable, subjectTrainTable, xTrainTable)

rm(xTestTable)
rm(xTrainTable)
rm(yTestTable)
rm(yTrainTable)
rm(subjectTestTable)
rm(subjectTrainTable)

#combine the test table and train table into one file
dataTable <- rbind(testTable,trainTable)

#dataFile$activity_type <- as.factor(dataFile$activity_type)
rm(testTable)
rm(trainTable)

#label the activities
activityLabels <- read.table("./ucihar/UCI HAR Dataset/activity_labels.txt", header = FALSE, colClasses = c("character","character"))

convertActivityName <- function(x) {
  lengthName <- length(x[[1]])
  for (i in 1:lengthName) {
    if(x[i,1]=="1") {
      x[i,1] <- activityLabels[1,2]   
    }else{
      if(x[i,1]=="2") {
       x[i,1] <- activityLabels[2,2] 
      }else{
        if(x[i,1]=="3") {
          x[i,1] <- activityLabels[3,2]
        }else{
          if(x[i,1]=="4") {
            x[i,1] <- activityLabels[4,2]
          }else{
            if(x[i,1]=="5") {
              x[i,1] <- activityLabels[5,2]
            }else{
              x[i,1] <- activityLabels[6,2]
            }
          }
        }
      }
    }
  }
  return(x)
}

dataTable <- convertActivityName(dataTable)
rm(activityLabels)
rm(convertActivityName)

#Step 5 - group and subset table and save to file
dataTable <- group_by(dataTable,Activity.Type,Subject)
outputTable <- dataTable[c(1,2,grep("mean()|std",names(dataTable)))]
summaryTable <- summarize_each(outputTable,funs(mean))
write.table(outputTable,"./ucihar/harSummary.txt")

rm(dataTable)
rm(outputTable)
rm(summaryTable)