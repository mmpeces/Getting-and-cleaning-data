Getting-and-cleaning-data
=========================

The code, run_analysis.R, contains code to complete the Coursera project for Getting and cleaning data course. 

From instructions copied from Coursera project website, the code does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Details of code steps can be found in the CodeBook.md file in my Getting-and-cleaing-data repository. 


Additional details:

1. Code lines 4 and 5 will call libraries data.table and reshape2, which are necessary for the code.  Please install these packages prior to running code, if not currently installed. 

2. If the Samsung data is not downloaded, remove the "##" located on code lines 9 to 13 and the code will be downloand and unzipped into working directory.

3. The Samsung data must be in your working directory.  

4. Tidy text file will be written to working directory.
