
# Loads features vector
setwd('data')

features <- read.csv('features.txt',header=FALSE,sep=' ')
colnames(features)<-c('index','feature_name')
activity_labels <- read.csv('activity_labels.txt',header=FALSE,sep=' ')
colnames(activity_labels) <- c('activity_code','activity_name')

# load training data
setwd('train')
x_train <- read.table('X_train.txt',header=FALSE,strip.white=TRUE)
subject_train <- read.csv('subject_train.txt',header=FALSE,sep = ' ')
# Uses descriptive activity names to name the activities in the data set
y_train <- read.csv('y_train.txt',header=FALSE,sep=' ')
colnames(y_train) <- c('activity_code')
activity_train <- merge(y_train,activity_labels,by='activity_code')

train_data <- cbind(subject_train,activity_train,x_train)
# Moves directory back to data directory
setwd('../')

# load training data
setwd('test')
x_test <- read.table('X_test.txt',header=FALSE,strip.white=TRUE)
subject_test <- read.csv('subject_test.txt',header=FALSE,sep = ' ')
# Uses descriptive activity names to name the activities in the data set
y_test <- read.csv('y_test.txt',header=FALSE,sep=' ')
colnames(y_test) <- c('activity_code')
activity_test <- merge(y_test,activity_labels,by='activity_code')

test_data <- cbind(subject_test,activity_test,x_test)
# Moves directory back to data directory
setwd('../')

# Merges the training and the test sets to create one data set.
merged_data <- rbind(train_data,test_data)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
 
data_means <- apply(merged_data,2,mean)
data_sd <- apply(merged_data,2,sd)
