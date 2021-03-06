CodeBook.md 
Getting and Cleaning Data Course Project

This is a code book that describes the variables, the data, and any transformations or work that have been performed to clean up the data. Specifically, this codebook walks the user through the R-script run_analysis.R.



First the program gets the current working directory and stores it as a variable directory.
The data folder is then generated by pasting the UCI HAR Dataset onto directory and stored as the variable folder. 

Next, the program pulls all feature names from the file features.txt and stores it as a vector called features.

Similarly, the same is done for the activity names from the file activity_labels.txt and stored as the vector activities.

Now we can inpmort the data. Starting with the X data, the data frames Xtraindf and Xtestdf are generated by reading in the X data from train and test folders repectively.

The same is then done for subject to generate Straindf and Stestdf data frames, which are then also given the column name "subject".

The same is then done for Y to generate Ytraindf and Ytestdf data frames, which are then also given the column name "activity".

Next, the activity numbers are replaced in the Y data frames with the names from the activities vector using the sub() function.

The column names in the X data frames are also labeled appropriately using the features vector.

Now all data is combined using cbind to bind X and Y and rbind to bind train and test data. The total data is stored in the data frame rawdata and all temporary data frames are now removed to preserve system memory.


Next, we extract only the mean and std data from rawdata while also keeping the activity name. This is stored in the data frame ms_data.


Lastly, the ddply function is used to find the mean of all columns while using the activity names as factors. This new data frame is called avg_ms_data.


Variables:
	data frames:
		rawdata
		ms_data
		avg_ms_data
	vectors:
		activities
		features
	variables:
		directory
		folder
		
Removed Variables:
	Xtraindf
	Xtestdf
	Ytraindf
	Ytestdf
	Straindf
	Stestdf
	trainddf
	testdf
	ms_indices
	i
