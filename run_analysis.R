setwd("C:/Users/Kenneth Lim/Desktop/DataScience/3. Getting and Cleaning Data/Project")

## Starting condition: UCI HAR Dataset is a folder in the working directory

## Step 1: Merging the datasets

## Read relevant data in

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Create dataset

df <- rbind(X_train, X_test) # combining features for train and test
df <- cbind(df, rbind(subject_train, subject_test)) # adding subject data
df <- cbind(df, rbind(y_train, y_test)) # adding activity data

## Adding in variable names

features <- read.table("./UCI HAR Dataset/features.txt")
features <- t(features)
colnames(df)[1:561] <- features[2,]
colnames(df)[562] <- "subject"
colnames(df)[563] <- "activity"

## Step 2: Extract the measurements of the mean and sd only for each measurement

## Identify column names with mean() or std() or meanFreq() on features

features <- read.table("./UCI HAR Dataset/features.txt") # re-read file because transposed earlier on
features[grep("mean()|std()|meanFreq()",features$V2), "keep"] <- TRUE
features[-grep("mean()|std()|meanFreq()",features$V2), "keep"] <- FALSE
features <- rbind(features,c(0,0,TRUE))
features <- rbind(features,c(0,0,TRUE)) # add TRUEs on 562nd and 563rd row to keep these columns (subject, activity)
features$keep <- as.logical(features$keep)
df <- df[features$keep] # keep relevant columns

## Step 3: Use descriptive activity names to name the activities in the dataset

df$activity[df$activity==1] <- "walking"
df$activity[df$activity==2] <- "walkingupstairs"
df$activity[df$activity==3] <- "walkingdownstairs"
df$activity[df$activity==4] <- "sitting"
df$activity[df$activity==5] <- "standing"
df$activity[df$activity==6] <- "laying"

## Step 4: Appropriately label data set with descriptive variable names

colnames(df) <- tolower(colnames(df)) # remove capital letters
colnames(df) <- gsub("-", "", colnames(df)) # remove hyphens
colnames(df) <- gsub("\\()", "", colnames(df)) # remove brackets

## Step 5: Tidy up the data

## Find mean of each column by subject by activity

library(plyr)
df <- ddply(df, .(subject, activity), numcolwise(mean)) # calculate column means by activity by subject

write.table(df, file="tidydata.txt", row.names=FALSE) # write text file

