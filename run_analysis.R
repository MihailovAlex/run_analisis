library(dplyr)

activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Step 1: Merges the training and the test sets to create one data set.

X <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
sub <- rbind(subject_train, subject_test)
df <- cbind(sub, X, y)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

df_mean_std <- df %>%
    select(subject, code, contains('mean'), contains('std'))

# Step 3: Uses descriptive activity names to name the activities in the data set.

df_mean_std$code <- activities[df_mean_std$code, 2]

# Step 4: Appropriately labels the data set with descriptive variable names.

names(df_mean_std)[2] <- "activity"

patterns <- c("Acc" = "Accelerometer",
              "Gyro" = "Gyroscope",
              "BodyBody" = "Body",
              "Mag" = "Magnitude",
              "^t" = "Time",
              "^f" = "Frequency",
              "tBody" = "TimeBody",
              "-mean()" = "Mean",
              "-std()" = "STD",
              "-freq()" = "Frequency",
              "angle" = "Angle",
              "gravity" = "Gravity")

for (pattern in names(patterns)) {
    names(df_mean_std) <- gsub(pattern, patterns[pattern], names(df_mean_std), ignore.case = TRUE)
}

# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

res_df <- df_mean_std %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))

write.table(res_df, "final_dataset.txt", row.name=FALSE)



