


#Purpose 
The purpose of this is to give an example of the different programing languages I am able to write in to any would be employeers.

All software contained in this repository is Copyright David Infortunio. Please contact before using this code 512-228-4838: 
## Contents
### R OPEN
1.  run_analysis.R : This is a program that downloads a dataset, creates a file on the system to unpack the data into, merges different parts of the dataset (there was test data and training data) 
2. Matchingv4Big.R : This was written in R to assist in standardizing the names of offenses listed in a police file. This was done to help Texas AppleSeed, which is working to analyze people who cannot afford to pay fines and who are forced to serve jail time due to their inability to pay and what sort of offenses they committed. This takes care of the issue that the police use many different names for the same offence. The list that the matching data was taken from was done by hand. The idea is it could be updated without updating the code.
3.completeGridHardv2.txt : This is a file that is meant to be copied into R on a windows computer. It creates a logic puzzle that involves linear optimization and its solution. I wrote this file two years ago but it shows that I understand linear programing. 
4. permutV4.txt : Some code I put together to create a puzzle. In this puzzel letters are permuted. The goal of the puzzle is to decrypt the original message.
###VBA
5. BACT_Data_Base5.accdb: A Microsoft Access Database that was written for the TCEQ and contains large amounts of VBA code.

###run_analysis.R
The purpose of this code is to take information from website https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and look at the mean for every subject (there are 30 test subjects) for each of the 6 activities. 

This  code was written to work with the directory system of Linux. On Windows the slashes need to be in the opposite direction.
Also there are two slashes in windows for every slash in Linux. 

The codes starts by checking to make sure that the information is not overwriting anything and then make a new directory. The program systematicly looks for an unused directory name. The possibilities included are data, data2 and, dat3  . I know this was not part of the assignment but I felt like it.

Once a directory has been established the data downloads into the directory. Alternatively, if the data was already there the code to download can be omitted.

It is preferred that the variable names be lower case and without commas, and dashes so the code converts them.

The file features.txt is read to extract variable names. It is then processed to make sure the names are unique.

The test data and the training data are then merged into one dataframe. This involves reading the files  X_train.txt,  Y_train.txt,  S_train.txt,  X_test.txt, Y_test.txt, and S_test.txt.

The columns that relate to the mean and standard deviation are then extracted with perl regular expressions and the grepl function.

#A table containing all the data is named bigtable.txt,

# a table with just the means of the means and standard deviations, grouped by person and activity is called smalltable.txt .


