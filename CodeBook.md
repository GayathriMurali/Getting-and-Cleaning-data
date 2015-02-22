---
title: "CodeBook"
author: "GayathriMurali"
date: "February 21, 2015"
output: html_document
---
The script run_analysis.R cleans and transforms the data in the following steps
1. read X_test data to copy raw data into a dataframe
2. read feature labels into a dataframe
3. Name the columns in X_testdata dataset
4. subject_test contains numerical values for subjects in test data. read the data into a data frame
5. Merge activity label nuerical values to X_test data
6. Name the last column bound in the previous step. Call it "Subject"
7. y_test contains numerical values for activity label in test data. read the data into a data frame
8. Merge activity label numerical value to X_test data
9. Read activity labels into a dataframe
10. Replace numbers in 563 column in X_testdata(activity label numbers) with actual string activity label read into activity_labels
11. Repeat the same process for Train data set
12. Merge both data sets
13. Extract data with only "mean" and "std" in the columnname
14. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Variables
1. X_test,X_train,y_test,y_train,features,activity_labels,subject_test,subject_train contains values from files X_test.txt,X_train.txt, y_test.txt,y_train.txt, features.txt, activity.txt,subject_test.txt,subject_train.txt
2. X_test_data contains Merged subject_test numerical values to X_test
3. X_testdata Merge activity label numerical value to X_test_data
4. X_Complete_test contains the complete descriptive dataset for test
5. X_train_data contains Merged subject_test numerical values to X_train
6. X_traindata Merge activity label numerical value to X_train_data
7. X_Complete_train contains the complete descriptive dataset for train
8. Merged_dataset is the rbind of both X_Complete_test and  X_Complete_train
9. meanstd contains the indices of the columns in the merged data set which has mean or std in the column name
10. meanstd_data contains the actual data from merged_dataset which contains the columns from meanstd
11. tidyset is the final tidy data set created with means of every column per subject per activity
