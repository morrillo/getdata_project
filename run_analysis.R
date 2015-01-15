
# Loads features vector
setwd('data')

features <- read.csv('features.txt',header=FALSE,sep=' ')
colnames(features)<-c('index','feature_name')

# load training data
setwd('train')
x_train <- read.table('X_train.txt',header=FALSE,strip.white=TRUE)
y_train <- read.csv('y_train.txt',header=FALSE,sep=' ')

train_data <- cbind(y_train,x_train)
# Moves directory back to data directory
setwd('../')

# load training data
setwd('test')
x_test <- read.table('X_test.txt',header=FALSE,strip.white=TRUE)
y_test <- read.csv('y_test.txt',header=FALSE,sep=' ')

test_data <- cbind(y_test,x_test)
# Moves directory back to data directory

