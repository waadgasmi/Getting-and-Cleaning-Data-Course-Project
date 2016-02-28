# Getting-and-Cleaning-Data-Course-Project

Overview:

This is the course project for the Getting and Cleaning Data Coursera course. The goal is to prepare tidy data that can be used for later analysis. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone

A full description is available at the site where the data was obtained: The UCI Machine Learning Repository.


# Project summary:

The R script, run_analysis.R, does the following:

1- Download the dataset if it does not already exist in the working directory
2- Load the activity and feature info
3- Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
4- Loads the activity and subject data for each dataset, and merges those columns with the dataset
5- Merges the two datasets
6- Converts the activity and subject columns into factors
7- Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
8- The end result is shown in the file tidy.txt.

CodeBook.md file describes the variables, the data, and any transformations or work that was performed to clean up the data.
