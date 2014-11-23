# Step 1: Load in all the data!  Optionally, make sure that the 
# number of rows in each data set are the same, as a sanity check.
fit_features        <- read.table("./UCI HAR Dataset/features.txt")
fit_activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
fit_X_test          <- read.table("./UCI HAR Dataset/test/X_test.txt")
fit_y_test          <- read.table("./UCI HAR Dataset/test/y_test.txt")
fit_subject_test    <- read.table("./UCI HAR Dataset/test/subject_test.txt")
fit_X_train         <- read.table("./UCI HAR Dataset/train/X_train.txt")
fit_y_train         <- read.table("./UCI HAR Dataset/train/y_train.txt")
fit_subject_train   <- read.table("./UCI HAR Dataset/train/subject_train.txt")
# nrow(fit_subject_test);  nrow(fit_X_test);  nrow(fit_y_test);
# nrow(fit_subject_train); nrow(fit_X_train); nrow(fit_y_train);

# Step 2:  Concatenate the X and Y data sets.  Optionally, make sure that the
# number of rows in each data set is equal to the total of the rows in the
# train and test sets.
fit_X                <- rbind(fit_X_train, fit_X_test)
fit_Y                <- rbind(fit_y_train, fit_y_test)
fit_subject          <- rbind(fit_subject_train, fit_subject_test)
# nrow(fit_subject); nrow(fit_X); nrow(fit_Y)

# Step 3:  Ascribe the column names from our fit_features vector to the
# fit_X data.
colnames(fit_X)      <- fit_features[,2]
colnames(fit_activity_labels) <- c("Activity","Act_Name")

# Step 4: Get all of the columns that have either "std(" or "mean(" in their names, and then
# get that subset of columns from fit_X.
fit_cols             <- c(grep("std\\(",fit_features[,2]), grep("mean\\(",fit_features[,2]))
fit_cols             <- sort(fit_cols)
fit_X_sub            <- fit_X[,fit_cols]

# Step 5: Add in our Subject and Activity values.
colnames(fit_subject) <- "Subject"
colnames(fit_Y)       <- "Activity"
fit_XY                <- cbind(fit_X_sub, fit_Y)
fit_XY                <- cbind(fit_XY, fit_subject)
fit_XY_dtab           <- data.table(fit_XY)

# Step 6:  Now we're making the averages set
fit_XY_averages       <- fit_XY_dtab[,lapply(.SD, mean), by=list(Activity,Subject)]

# Step 7:  Finally, add in the Activity names and the outputs
fit_output_averages   <- merge(fit_activity_labels, fit_XY_averages, by="Activity")
fit_output            <- merge(fit_activity_labels, fit_XY, by="Activity")




