
library(plyr)
#read X_test data to copy raw data into a dataframe
X_test<-read.table("test/X_test.txt")

#read feature labels into a dataframe
features<-read.table("features.txt")

#Name the columns in X_testdata dataset
names(X_test)<-features[,2]


#subject_test contains numerical values for subjects in test data. read the data into a data frame
subject_test<-read.table("test/subject_test.txt")

#Merge activity label nuerical values to X_test data
X_test_data <- cbind(X_test,subject_test)

#Name the last column bound in the previous step. Call it "Subject"
colnames(X_test_data)[562]<-"Subject"

#y_test contains numerical values for activity label in test data. read the data into a data frame
y_test<-read.table("test/y_test.txt")

#Merge activity label numerical value to X_test data
X_testdata<-cbind(X_test_data,y_test)

#Read activity labels into a dataframe
activity_labels<-read.table("activity_labels.txt")

#Replace numbers in 563 column in X_testdata(activity label numbers) with actual string activity label read into activity_labels
X_Complete_test<-merge(X_testdata,activity_labels,by.x="V1",by.y="V1")

#read X_train data to copy raw data into a dataframe
X_train<-read.table("train/X_train.txt")

#Name the columns in X_testdata dataset
names(X_train)<-features[,2]


#subject_test contains numerical values for subjects in test data. read the data into a data frame
subject_train<-read.table("train/subject_train.txt")

#Merge activity label nuerical values to X_test data
X_train_data <- cbind(X_train,subject_train)

#Name the last column bound in the previous step. Call it "Subject"
colnames(X_train_data)[562]<-"Subject"

#y_test contains numerical values for activity label in test data. read the data into a data frame
y_train<-read.table("train/y_train.txt")

#Merge activity label numerical value to X_test data
X_traindata<-cbind(X_train_data,y_train)

#Replace numbers in 563 column in X_testdata(activity label numbers) with actual string activity label read into activity_labels
X_Complete_train<-merge(X_traindata,activity_labels,by.x="V1",by.y="V1")
#Merge both data sets.
Merged_dataset<-rbind(X_Complete_test,X_Complete_train)

#dataset with only mean and std deviation values
#Step 1 : Store the indices of columns with mean or std in their names
meanstd<-grep("(mean|std)\\((\\))",names(Merged_dataset))

#Step 2 : Extract out these columns and store it in different dataset
meanstd_data<-Merged_dataset[,c(meanstd,563,564)]

#creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyset<-ddply(meanstd_data,c('Subject','V2'),function(x) colMeans(x[, 1:66]))
write.table(tidyset,"tidyset.txt",row.name=FALSE)
