# Johns Hopkins Getting and Cleaning Data Course Project

This is the course project for the Getting and Cleaning Data Coursera course.

Set the working directory of R studio to the folder containing the unzipped folder "UCI HAR Dataset".
Run the R script "run_analysis.R" which will perform the following actions:

1. Merges the training and test datasets
2. Extracts the relevant columns
3. Converts the activity column into factors and gives these the required names
4. Calculates the mean of each of the variables per subject and activity pair
5. Stores the end result in the file "averages.txt".
