library(reshape2)

filename <- "getdata_dataset.zip"

# Step 1:
## Download and unzip the dataset:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}


#Step 2:
# Load activity labels + features

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

#Step 2:
# Extract only the data on mean and standard deviation

FeaturesMean <- grep(".*mean.*|.*std.*", features[,2])
FeaturesMean.names <- features[FeaturesMean,2]
FeaturesMean.names = gsub('-mean', 'Mean', FeaturesMean.names)
FeaturesMean.names = gsub('-std', 'Std', FeaturesMean.names)
FeaturesMean.names <- gsub('[-()]', '', FeaturesMean.names)

#Step 3:
# Load the train and test datasets

train <- read.table("UCI HAR Dataset/train/X_train.txt")[FeaturesMean]
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")[FeaturesMean]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

#Step 4:
# merge datasets and add labels

TidyData <- rbind(train, test)
colnames(TidyData) <- c("subject", "activity", FeaturesMean.names)

#Step 5:
# turn activities & subjects into factors
TidyData$activity <- factor(TidyData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
TidyData$subject <- as.factor(TidyData$subject)

TidyData.melted <- melt(TidyData, id = c("subject", "activity"))
TidyData.mean <- dcast(TidyData.melted, subject + activity ~ variable, mean)

#Step 6:
#Create the tidy data file. 
write.table(TidyData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
