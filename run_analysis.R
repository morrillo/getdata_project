# Loads library reshape (needed for transposing the data)
library(reshape)

# Loads features vector
tryCatch(setwd('data'),error=function(e){print('Can not change working directory to data directory. Aborting');q()})
tryCatch(features <- read.csv('features.txt',header=FALSE,sep=' '),error=function(e){print('Can not open features.txt file. Aborting');q()})
colnames(features)<-c('index','feature_name')

# Loads activity labels information
activity_labels <- tryCatch(read.csv('activity_labels.txt',header=FALSE,sep=' '),error=function(e){print('Can not open activity_labels.txt file. Aborting');q()})
colnames(activity_labels) <- c('activity_code','activity_name')

# loads training data
tryCatch(setwd('train'),error=function(e){print('Can not change working directory to train directory. Aborting');q()})
tryCatch(x_train <- read.table('X_train.txt',header=FALSE,strip.white=TRUE),error=function(e){print('Can not read X_train.txt file. Aborting');q()})
colnames(x_train) <- features$feature_name
tryCatch(subject_train <- read.csv('subject_train.txt',header=FALSE,sep = ' '),error=function(e){print('Can not read subject_train.txt file. Aborting');q()})
colnames(subject_train)<-c('subject')

# Uses descriptive activity names to name the activities in the data set
tryCatch(y_train <- read.csv('y_train.txt',header=FALSE,sep=' '),error=function(e){print('Can not read y_train.txt file. Aborting');q()})
colnames(y_train) <- c('activity_code')
activity_train <- merge(y_train,activity_labels,by='activity_code')

train_data <- cbind(subject_train,activity_train,x_train)
# Moves directory back to data directory
setwd('../')

# load training data
tryCatch(setwd('test'),error=function(e){print('Can not change working directory to test directory. Aborting');q()})
tryCatch(x_test <- read.table('X_test.txt',header=FALSE,strip.white=TRUE),error=function(e){print('Can not read X_test.txt file. Aborting');q()})
colnames(x_test) <- features$feature_name
tryCatch(subject_test <- read.csv('subject_test.txt',header=FALSE,sep = ' '),error=function(e){print('Can not read subject_test.txt file. Aborting');q()})
colnames(subject_test)<-c('subject')
# Uses descriptive activity names to name the activities in the data set
tryCatch(y_test <- read.csv('y_test.txt',header=FALSE,sep=' '),error=function(e){print('Can not read y_test.txt file. Aborting');q()})
colnames(y_test) <- c('activity_code')
activity_test <- merge(y_test,activity_labels,by='activity_code')

test_data <- cbind(subject_test,activity_test,x_test)
# Moves directory back to data directory
setwd('../')

# Merges the training and the test sets to create one data set.
merged_data <- rbind(train_data,test_data)
merged_data$activity_name <- NULL

# 4. Extracts only the measurements on the mean and standard deviation for each measurement. 
 
data_means <- aggregate(merged_data,by=list(merged_data$subject,merged_data$activity_code),FUN=mean)
data_sd <- aggregate(merged_data,by=merged_data[c('subject','activity_code')],FUN=sd)

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# pivots merged data
mdata_means <- melt(data_means,id=c('subject','activity_code'))
mdata_sd <- melt(data_sd,id=c('subject','activity_code'))

colnames(mdata_means) <- c('subject','activity_code','variable','value_avg')
colnames(mdata_sd) <- c('subject','activity_code','variable','value_sd')

# Adds activity name information
mdata_merge <- merge(mdata_means,mdata_sd,by=c('subject','activity_code','variable'))
mdata_activity <- merge(mdata_merge,activity_labels,by='activity_code')

# Creates text file
write.table(mdata_activity,file='output_project.txt',row.name=FALSE)
