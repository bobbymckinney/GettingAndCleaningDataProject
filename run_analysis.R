library(plyr)

## get the current working directory and define the data folder
directory <- getwd()
folder <- paste(directory,"/UCI HAR Dataset",sep="")

## get all features into a factor of length 561
features <- read.table(paste(folder,"/features.txt",sep=""))[,2]

## get activity labels into a factor of length 6a
activities <- read.table(paste(folder,"/activity_labels.txt",sep=""))[,2]
activities <- tolower(activities)

## read subject dat for train and test and save as data frames with label subject
Straindf <- read.table( paste(folder, "/train/subject_train.txt", sep=""  ) )
Stestdf <- read.table( paste(folder, "/test/subject_test.txt", sep=""  ) )
colnames(Straindf)[1]<- "subject"
colnames(Stestdf)[1]<- "subject"

## read Y data for train and test and save as data frames with label activity
Ytraindf <- read.table( paste(folder, "/train/Y_train.txt", sep=""  ) )
Ytestdf <- read.table( paste(folder, "/test/Y_test.txt", sep=""  ) )
colnames(Ytraindf)[1]<- "activity"
colnames(Ytestdf)[1]<- "activity"

## replace activity numbers with descriptive activity names
for (i in 1:length(activities)) {
    Ytestdf[,1] <- sub(as.character(i),activities[[i]],Ytestdf[,1])
    Ytraindf[,1] <- sub(as.character(i),activities[[i]],Ytraindf[,1])
}
## NOTE:: third task now complete

## read X data for train and test and save as data frames
Xtraindf <- read.table( paste(folder, "/train/X_train.txt", sep=""  ) )
Xtestdf <- read.table( paste(folder, "/test/X_test.txt", sep=""  ) )

## appropriately label columns of X data using features
colnames(Xtraindf) <- features
colnames(Xtestdf) <- features
## NOTE:: third and fourth tasks now complete

## combine subject, Y, and X data
traindf <- cbind(Straindf,Ytraindf,Xtraindf)
testdf <- cbind(Stestdf,Ytestdf,Xtestdf)

## combine all data into 1 raw data table
raw_data <- rbind(traindf, testdf)
## NOTE:: first, third, and fourth tasks now complete

## It is also in our best interest to remove all 
## temporary data frames at this time and only keep 
## the raw data  in order to preserve memory
remove(Xtraindf,Xtestdf,Ytraindf,Ytestdf,Straindf,Stestdf,testdf,traindf,i)

## extract only mean and std data from raw data 
## while keeping activity data
ms_indices <- grep("subject|activity|mean()|std()",colnames(raw_data))
ms_data <- raw_data[,ms_indices]
remove(ms_indices)
## NOTE:: first, second, third, and fourth tasks now complete

## find the mean of all variables separated by activity
tidy_data <- ddply(ms_data,c("subject","activity"),colwise(mean))
## NOTE:: all tasks now complete

write.table(tidy_data,file="tidydata.txt",row.name=FALSE)