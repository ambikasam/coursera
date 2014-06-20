Getting and cleaning data
===========

In the process of getting and cleaning data, there are several other files:

1. Tidy data set. File: final.txt
2. A code book: Describing each variable and its values in the tidy data set. File: codebook.md
3. Script to generate the tidy data set from scratch. File: run_analysis.R

Tidy data set
===========

0. Better readibility of entire data: This file can be opened with "MS Excel". This displays data in tabular format and thus making it better to read the data than opening it in any of the text pads.
1. Tidy data set has a row with column names - subject, activity and the other 66 variable names.
2. Then, each row represents each "subject and acitivity" combination and for each of these combination, mean is computed for every variable.
3. Exception: If the tidy data set variable names are all in lowercase, then it impacts readbility when compared to camelCase or variable name with a dash in it. Thus, retained variable name with dash which can be read better.
```S
* For example 1: 
frequencybodygyroscopejerkmagnitudestandarddeviation, 
frequencyBodyGyroscopeJerkmagnitudeStandarddeviation, 
frequency-body-gyroscope-jerkmagnitude-standarddeviation. 
* For example 2: 
frequencybodyaccelerometerjerkstandarddeviationY, 
frequencyBodyAccelerometerJerkStandarddeviationY, 
frequency-body-accelerometer-jerk-standarddeviation-Y.
* As readability is one of the characteristic for easy interpretation of data, 
I have considered this characteristic for variable names
```



Code book
===========
Categorical and ordinal

Script
===========

#### The flow of the script
1. Step 1: Downloads the raw file; "UCI HAR Dataset.zip" file from the net.
1. Step 2: Merges data:
		a. Test data: Under test folder, subject_test, y_test and X_test data merged into test_data data frame.
		b. Train data: Under train folder, subject_train, y_train and X_train data merged into train_data data frame.
		c. Then, merge test_data and train_data data frame into all_data data frame.
1. Step 3: Column names: 
		Assign column names to this all_data. 
		Column names are subject, activityId and the 561 values in features.txt. So, totally 563 columns.
1. Step 4: Extract columns: 
		Now, of the 561 columns, extract columns with mean and standard deviation only. 
		This amounts to 66 columns (from 561 columns). Plus subject and activity 2 columns, makes it 68 columns. 
		The sliced_data will contain this data.
1. Step 5: Descriptive activities: 
		After this, assign descriptive names for each Activity. 
		Join slice_data and activity on activityId and form with_activities data.
		"activity" column will now have the descriptive activities.
		Here, one more column "activity" is added. So, the total columns are 69. 
1. Step 6: Descritpvie variables: 
		Next, assign descriptive names for the variables. 
		This is achieved by replacing the short names to more descriptive ones and 
		also by eliminating repeated words or characters, paranthesis (), etc.
1. Step 7: Calculate mean: 
		For the keys "activityId, activity, subject", get the mean for each variable. 
		With "melt" and "dcast" functions, obtain this set of data. 
		Now, there are 180 rows (combi: 6 activities * 30 subjects = 180 rows) and 69 columns.
1. Step 8: Final tidy data set: 
		Eliminate "activityId" and take the rest of the data. 
		This is the final tidy data set. Now, we have 180 rows and 68 columns.
1. Step 9: Write to file: 
		Write this final tidy data set to a text file; final.txt.


#### Environment details
Environment in which script has been developed, executed and verified.

* Mac: OS X 10.9.2
* R: version 3.0.2
* Platform: x86_64-apple-darwin10.8.0 (64-bit)

#### Verification
* This script has been run under different location (folders) to ensure it provides the same results; the same set of tidy data set.
* Also, executed every single line of command/block of command separately on R console and even this produced the same results. 
* This script has been run with and without data folder; the average time take without "data" folder and zip file is "45" secs and with it takes around "15" secs.

