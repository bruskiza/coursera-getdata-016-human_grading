# clear the workspace to start, to ensure clean, consistent results.
rm(list = ls())

# Utility function to get the full file path of the data set.
get_full_file_path = function(file) {
	source_data = "source_data/UCI HAR Dataset"
	paste(source_data, file, sep = "/")
}

training = read.csv(get_full_file_path("train/X_train.txt"), sep="", header=FALSE)
training[, length(training) + 1 ] = read.csv(get_full_file_path("train/Y_train.txt"), sep="", header=FALSE)
training[, length(training) + 1 ] = read.csv(get_full_file_path("train/subject_train.txt"), sep="", header=FALSE)

testing = read.csv(get_full_file_path("test/X_test.txt"), sep="", header=FALSE)
testing[, length(testing) + 1 ] = read.csv(get_full_file_path("test/Y_test.txt"), sep="", header=FALSE)
testing[, length(testing) + 1 ] = read.csv(get_full_file_path("test/subject_test.txt"), sep="", header=FALSE)


# Merge training and test sets together
allData = rbind(training, testing)

activityLabels = read.csv(get_full_file_path("activity_labels.txt"), sep="", header=FALSE)


features = read.csv(get_full_file_path("features.txt"), sep="", header=FALSE)

features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

# Merge training and test sets together
allData = rbind(training, testing)

# Get only the data on mean and std. dev.
colsWeWant <- grep(".*Mean.*|.*Std.*", features[,2])
#colsWeWant <- grep(".*-mean.*|.*-std.*", features[,2])
# First reduce the features table to what we want
features <- features[colsWeWant,]
# Now add the last two columns (subject and activity)
colsWeWant <- c(colsWeWant, 562, 563)

# And remove the unwanted columns from allData
allData <- allData[,colsWeWant]

# Add the column names (features) to allData
colnames(allData) <- c(features$V2, "Activity", "Subject")
colnames(allData) <- tolower(colnames(allData))

currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
  allData$activity <- gsub(currentActivity, currentActivityLabel, allData$activity)
  currentActivity <- currentActivity + 1
}

allData$activity <- as.factor(allData$activity)
allData$subject <- as.factor(allData$subject)

tidy = aggregate(allData, by=list(activity = allData$activity, subject=allData$subject), mean)

if (! file.exists("results") ) {
	dir.create("results")
}

write.table(tidy, "results/mean-and-std.txt", row.names = FALSE)