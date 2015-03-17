#load in the raw data for the TEST and TRAIN set
data <- read.table("~/UCI HAR Dataset/test/X_test.txt")
data2 <- read.table("~/UCI HAR Dataset/train/X_train.txt")

#merge the data
totaldata <- rbind(data, data2)

#read in the feature labels
features <- read.table("~/UCI HAR Dataset/features.txt")
#pull out the names of the features as a character vector
features <- as.character(features[, 2])

#replace the meaningless colnames of the dataset with what the variables actually are
colnames(totaldata) <- features

#Subset the data frame by only the columns with mean or std in them
#Specifically excludes the "meanFreq" variable and the "gravityMean" variable (which has uppercase)
subsetted <- totaldata[, grep("std|mean[^F]", colnames(totaldata), perl = TRUE)]

#activity codes read in, combined (test before train) and coerced to a numeric vector
activitytest <- read.table("~/UCI HAR Dataset/test/Y_test.txt")
activitytrain <- read.table("~/UCI HAR Dataset/train/Y_train.txt")
activity <- rbind(activitytest, activitytrain)
activity <- as.numeric(activity[, 1])

#activity labels read in as a data frame
actlabels <- read.table("~/UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

#for loop to change the activity code to the label it stands for
for(i in 1:10299) {
        q <- activity[i]
        activity[i] <- actlabels[q, 2]
}
#coerce activity to a factor
activity <- as.factor(activity)

#subjects read in, combined (test before train)
subjectstest <- read.table("~/UCI HAR Dataset/test/subject_test.txt")
subjectstrain <- read.table("~/UCI HAR Dataset/train/subject_train.txt")
subjects <- rbind(subjectstest, subjectstrain)
subjects <- as.factor(subjects[, 1])

#bind together the subject codes, activity (now in words) and the data itself.
#now each ROW of the data contains the subject who recorded it, what they were doing at
#the time and the values of mean and sd for each feature
clean <- cbind(subjects, activity, subsetted, stringsAsFactors = FALSE)

#for the tidy dataset finding means of each feature by activity AND by subject number I have
#taken a step back to combine the two factors (subjects and activity) into one (subjectsactivity)
#formatC gives the single digits a leading 0, reason will become obvious later
formatsubjects <- formatC(as.numeric(subjects), width = 2, format = "d", flag = "0")
subjectsactivity <- as.factor(paste(formatsubjects, activity))

#the tidy dataset is then as simple as initiating an empty dataframe 180 rows (30 subjects each
#performing 6 activities) and 66 columns (each of the feature variables)
tidy <- as.data.frame(matrix(rep(NA, 11880), nrow = 180, ncol = 66))

#the column names are the feature variables
colnames(tidy) <- colnames(subsetted)
#now a simple for loop does a tapply for each column of data (each feature variable), populating
#it with the mean of each set of activities by subject and activity
for(i in 1:66){
        tidy[, i] <- tapply(subsetted[, i], subjectsactivity, mean)
}
#the order in which the tapply loop returns the ROWS in is the strictly alphabetical/numeric
#order of the factor variable subjectsactivity.  Given that the single digit numbers have a leading 0
#this will be subject 1 for all 6 activities in alphabetical order followed by subject 2 etc

#I generate fresh subject and activity variables with this in mind
tidysubject <- rep(1:30, each = 6)
tidyactivity <- rep(c("Laying", "Sitting", "Standing", "Walking", "Walking Downstairs", "Walking Upstairs"), 30)

#Bind it up and clean up the column names
tidyfinal <- cbind(tidysubject, tidyactivity, tidy)
colnames(tidyfinal)[colnames(tidyfinal) == "tidysubject"] <- "Subject Number"
colnames(tidyfinal)[colnames(tidyfinal) == "tidyactivity"] <- "Activity"

write.table(tidyfinal, file = "tidy set.txt", row.name=FALSE)
