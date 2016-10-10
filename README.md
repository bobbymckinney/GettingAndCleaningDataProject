# GettingAndCleaningDataProject
This is the programming project for the Coursera Course Getting and Cleaning Data by Johns Hopkins University


This repo explains how all of the scripts work and how they are connected.

The script run_analysis.R is the main data cleaning script. The function analyzes all the data in the folder UCI HAR Dataset.

The script returns three data frames:

	rawdata is a labeled dataframe that includes all the data
	ms_data is a labeled dataframe that only includes the mean and std data
	avg_ms_data is a labeled dataframe that averages ms_data by column according 
	to each activity factor.
	
The Script also removes all temporary data frames created along the way. 