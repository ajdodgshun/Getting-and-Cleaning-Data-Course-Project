Data set containing a tidy formatted subset of the UCI HAR Dataset
------
Raw data set obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

R code provided is annotated briefly within the code for convenience.  A more full explanation exists here.

- Test and Training datasets ("~/UCI HAR Dataset/test/X_test.txt" and "~/UCI HAR Dataset/train/X_train.txt") have been read into R using read.table and combined together using rbind in that order.

- Feature labels ("~/UCI HAR Dataset/features.txt") have been read in, coerced to character vector and assigned as column labels

- Only columns with "mean" or "std" (standard deviation) are to be included and have been selected by a grep command which specifically excludes the additional variables (which happen to have an uppercase "M" leading the word "Mean") and excluding the meanFrequency variables by using [^F] operator after the string "mean".  This leaves a 66 variable dataset.

- Activity codes for test and training dataset ("~/UCI HAR Dataset/test/Y_test.txt" and "~/UCI HAR Dataset/train/Y_train.txt") are read in, combined, and coerced to a numeric vector

- Activity labels ("~/UCI HAR Dataset/activity_labels.txt") are read in and, using a for loop, the activity numbers are changed to the character labels they represent (ie. Walking, Standing etc).  This is coerced to a factor variable.

- In exactly the same way Subject numbers for test and training dataset ("~/UCI HAR Dataset/test/subject_test.txt" and "~/UCI HAR Dataset/train/subject_train.txt") are read in and combined before being coerced to a factor.

- Subjects, Activity labels and the 66 variable dataset are combined to form a clean data frame including all observations.  This data frame is not yet summarised.

Forming the tidy data frame with mean values
---

- Line 51 takes a step back to form a new factor variable combining Subject number with Activity Code.  The single digits are formatted to have a leading zero.

- A data frame is initialized with 180 rows (30 subjects each performing 6 activities) and 66 columns for 66 variables

- A simple for loop takes tapply down column by column to provide the mean value for each subject within each activity performed.  This is assigned to each of the 180 row values for that column and then the for loop moves to the next column.

- Note the order in which the tapply loop returns the rows is strictly the alphabetical/numeric
order of the factor variable subjectsactivity.  Given that the single digit numbers have a leading 0, the order will start with subject 1 for all 6 activities in alphabetical order followed by subject 2 etc

- As the final table is not to have row names, 2 vectors are generated.  First the subject number which we know the tapply loop will return the 6 means for subject 1 first, then 2 and down to 30 so a vector is created to reflect this.  Within each subject tapply will return each activity in alphabetical order 30 times so an activity variable is created to reflect this.

- Finally the subject, activity and tidy data frame are combined to the final table, column names adjusted and then write.table to write this to an accessible format. 
