fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

downloadFilePath <- "./downloads/dataset.zip"

xTrainFilePath <- "./downloads/UCI HAR Dataset/train/X_train.txt"
yTrainFilePath <- "./downloads/UCI HAR Dataset/train/Y_train.txt"
subjectTrainFilePath <- "./downloads/UCI HAR Dataset/train/subject_train.txt"

xTestFilePath <- "./downloads/UCI HAR Dataset/test/X_test.txt"
yTestFilePath <- "./downloads/UCI HAR Dataset/test/Y_test.txt"
subjectTestFilePath <- "./downloads/UCI HAR Dataset/test/subject_test.txt"

activityLabelsFilePath <- "./downloads/UCI HAR Dataset/activity_labels.txt"
featuresFilePath <- "./downloads/UCI HAR Dataset/features.txt"


## Check directory existence
if(!file.exists("./downloads")) { dir.create("./downloads")}


## Downloading & Unziping data
if(!file.exists(downloadFilePath)) {
      download.file(fileURL, downloadFilePath);
      unzip(downloadFilePath, overwrite=TRUE, exdir="./downloads");
}


## Creating ActivityLabel & Features Datasets
activityLabelsDS <- read.table(activityLabelsFilePath)
featuresDS <- read.table(featuresFilePath)


## Creating Training Datasets
xTrainDS <- read.table(xTrainFilePath)
yTrainDS <- read.table(yTrainFilePath)
subjectTrainDS <- read.table(subjectTrainFilePath)

colnames(activityLabelsDS) <- c("V1", "Activity")


## Merging Training Datasets
subjectTrainDS <- rename(subjectTrainDS, subject=V1)
mergedTrainDS <- cbind(yTrainDS, subjectTrainDS)
mergedTrainDS <- merge(mergedTrainDS, activityLabelsDS, by="V1")

colnames(xTrainDS) <- featuresDS[,2]
mergedTrainDS <- cbind(mergedTrainDS, xTrainDS)

mergedTrainDS <- mergedTrainDS[, -1]
mergedTrainDS <- select(mergedTrainDS, contains("subject"), contains("Activity"), contains("mean"), contains("std"))


## Garbage collection for Training Data
rm(xTrainFilePath)
rm(yTrainFilePath)
rm(subjectTrainFilePath)

rm(xTrainDS)
rm(yTrainDS)
rm(subjectTrainDS)


## Creating Test Datasets
xTestDS <- read.table(xTestFilePath)
yTestDS <- read.table(yTestFilePath)
subjectTestDS <- read.table(subjectTestFilePath)

colnames(activityLabelsDS) <- c("V1", "Activity")


## Merging Test Datasets
subjectTestDS <- rename(subjectTestDS, subject=V1)
mergedTestDS <- cbind(yTestDS, subjectTestDS)
mergedTestDS <- merge(mergedTestDS, activityLabelsDS, by="V1")

colnames(xTestDS) <- featuresDS[,2]
mergedTestDS <- cbind(mergedTestDS, xTestDS)

mergedTestDS <- mergedTestDS[, -1]
mergedTestDS <- select(mergedTestDS, contains("subject"), contains("Activity"), contains("mean"), contains("std"))


## Garbage collection for Test Data
rm(xTestDS)
rm(yTestDS)
rm(subjectTestDS)

rm(xTestFilePath)
rm(yTestFilePath)
rm(subjectTestFilePath)


## Garbage collection for ActivityLabels & Features Datasets
rm(featuresDS)
rm(activityLabelsDS)

rm(activityLabelsFilePath)
rm(featuresFilePath)
rm(fileURL)
rm(downloadFilePath)

##Merging Training & Test Datasets and summarizing program output
run_analysis <- (rbind(mergedTrainDS, mergedTestDS) %>% group_by(subject,Activity) %>% summarise_each(funs(mean)))