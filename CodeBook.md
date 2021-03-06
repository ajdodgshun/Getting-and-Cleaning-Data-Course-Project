Data set containing a tidy formatted subset of the UCI HAR Dataset
===
Raw data set obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Variables
---

There are, in total, 66 variables in the dataset generated by this script.  Each data point encodes the mean signal recorded by each subject for each activity studied in the variable listed over the entire course of the testing and training period.

- tBodyAcc-XYZ = Time Body Acceleration in X, Y or Z dimension (in gravity units, g)
- tGravityAcc-XYZ = Time Gravity Acceleration in X, Y or Z dimension (in gravity units, g)
- tBodyAccJerk-XYZ = Time Acceleration Jerk Signal in X, Y or Z dimension (in gravity units, g)
- tBodyGyro-XYZ = Time Body Gyroscopic Signal in X, Y or Z dimension (in radians per second, rad/sec)
- tBodyGyroJerk-XYZ = Time Body Gyroscopic Jerk Signal in X, Y or Z dimension (in radians per second, rad/sec)
- tBodyAccMag = Time Body Acceleration Magnitude (in gravity units, g)
- tGravityAccMag = Time Gravity Acceleration Magnitude (in gravity units, g)
- tBodyAccJerkMag = Time Body Acceleration Jerk Signal Magnitude (in gravity units, g)
- tBodyGyroMag = Time Body Gyroscopic Magnitude (in radians per second, rad/sec)
- tBodyGyroJerkMag = Time Body Gyroscopic Jerk Signal Magnitude (in radians per second, rad/sec)
- fBodyAcc-XYZ = Fast Fourier Transformed Body Acceleration in X, Y or Z dimension (in gravity units, g)
- fBodyAccJerk-XYZ = Fast Fourier Transformed Body Acceleration Jerk Signal in X, Y or Z dimension (in gravity units, g)
- fBodyGyro-XYZ = Fast Fourier Transformed Body Gyroscopic Signal in X, Y or Z dimension (in radians per second, rad/sec)
- fBodyAccMag = Fast Fourier Transformed Body Acceleration Magnitude (in gravity units, g)
- fBodyAccJerkMag = Fast Fourier Transformed Body Acceleration Jerk Signal Magnitude (in gravity units, g)
- fBodyGyroMag = Fast Fourier Transformed Gyroscopic Magnitude (in radians per second, rad/sec)
- fBodyGyroJerkMag = Fast Fourier Transformed Gyroscopic Jerk Signal Magnitude (in radians per second, rad/sec)

Each variable is followed by:

- mean(): Mean value
- std(): Standard deviation

Transformation
---

- Testing and training datasets have been merged
- All variables not encoding mean or standard deviation have been removed
- Variable names have been assigned as above
- Activity numbers have been replaced with words
- Mean of each variable recorded by each subject doing each activity has been summarised