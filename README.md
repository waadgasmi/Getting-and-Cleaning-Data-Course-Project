# Getting-and-Cleaning-Data-Course-Project

Overview:

This is the course project for the Getting and Cleaning Data Coursera course. The goal is to prepare tidy data that can be used for later analysis. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone

A full description is available at the site where the data was obtained: The UCI Machine Learning Repository.


# Project summary:

The R script, run_analysis.R, does the following:

1.	Download and unzip the dataset
2.	Load activity labels + features
3.	Extract only the data on mean and standard deviation
4.	Load the train and test datasets
5.	merge datasets and add labels
6.	turn activities & subjects into factors
7.	Create and export a second, independent tidy data set with the average of each variable For each activity and each subject.
8.  The end result is shown in the file tidy.txt.

CodeBook.md file describes the variables, the data, and any transformations or work that was performed to clean up the data.
