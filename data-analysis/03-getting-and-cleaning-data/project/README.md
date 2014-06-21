Getting and cleaning data
===========

In the process of getting and cleaning data, there are several other files:

1. Tidy data set. **File:** `final.txt`
2. A code book: Describing each variable and its values in the tidy data set. **File:** `codebook.md`
3. Script to generate the tidy data set from scratch. **File:** `run_analysis.R` 


Raw data
==========
The raw data is Human Activity Recognition Using Smartphones Dataset.  

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.  
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.  
Using its embedded accelerometer and gyroscope, the 3-axial linear acceleration and 3-axial angular velocity has been captured.  

The sensor acceleration signal, which has gravitational and body motion components, was separated into body acceleration and gravity.  

From each window, a vector of features was obtained by calculating variables from the time and frequency domain. This is further detailed out in features_info.txt and features.txt files of the raw data set. This is the raw data obtained to further process it to tidy data set.


Tidy data set
===========

0. Better readibility of entire data: This file can be opened with "MS Excel". This displays data in tabular format and thus making it better to read the data than opening it in any of the text pads.
1. Tidy data set has a row with column names - subject, activity and the other 66 variable names.
2. Then, each row represents each "acitivity and subject" combination and for each of these combination, mean is computed for every variable.
3. Please note, the actual expectation from this excersise is to clean the raw data and get "average" of every variable for each "activity and subject" combination. Thus, the 66 variables are retained as-is it is not changed (did not manipulate to slice it further down into different variables, etc.). 
4. Also, note that the variable names does not reflect final "mean" calculation in it. It retains "variable name" as-is. Please take a note of this. Mention of mean in variable name is omitted, as all the variables are "mean" calculations. Please refer to the code book for more details on all the variables.
5. Exception: If the tidy data set variable names are all in lowercase, then it impacts readbility when compared to camelCase or variable name with a dash in it. Thus, retained variable name with dash which can be read better.

```S
For example 1:
lowercase: frequencybodygyroscopejerkmagnitudestandarddeviation
camelCase: frequencyBodyGyroscopeJerkmagnitudeStandarddeviation
dash     : frequency-body-gyroscope-jerkmagnitude-standarddeviation

For example 2: 
lowercase: frequencybodyaccelerometerjerkstandarddeviationY
camelCase: frequencyBodyAccelerometerJerkStandarddeviationY
dash     : frequency-body-accelerometer-jerk-standarddeviation-Y 

As readability is one of the characteristic for easy interpretation of data, 
I have considered this characteristic for variable names
```


Code book
===========
The variables are of 2 types in this tidy data set: Categorical and ordinal.  
Please refer to [coodebook.md](https://github.com/ambikasam/coursera/blob/master/data-analysis/03-getting-and-cleaning-data/project/codebook.md) for more info. 


Script
===========

#### The flow of the script
`Initially, the package checks, installation and loading is all complete.`
```R
Step 1: Downloads the raw file - "UCI HAR Dataset.zip"[1] file from the net and unzip it under data folder.
        [Go to the "UCI HAR Dataset" folder, under data folder after unzip].
Step 2: Merges data:
      a. Test:  Under test  folder, subject_test,  y_test  & X_test  text files merged into "test_data"  data frame.
      b. Train: Under train folder, subject_train, y_train & X_train text files merged into "train_data" data frame.
      c. Then, merge "test_data" and "train_data" data frame into "all_data" data frame, using rbind.
Step 3: Column names: 
      Assign column names to this "all_data". 
      Column names are subject, activityId and the 561 values in features.txt. So, totally 563 columns.
Step 4: Extract columns: 
      Now, of the 561 columns, extract columns with mean and standard deviation only. 
      This amounts to 66 columns (from 561 columns). Plus subject and activity 2 columns, makes it 68 columns. 
      The "sliced_data" will contain this data.
Step 5: Descriptive activities: 
      After this, assign descriptive names for each Activity.
      Extract activity_labels text file info in to "activity" data frame.
      Join and arrange "slice_data" and "activity" on 'activityId' and get "with_activities" data.
      'activity' column will now have the descriptive activities.
      Here, one more column 'activity' is added. So, the total columns are 69.
      NOTE: 'activityId' is yet retained so that the ordering of data can be on activityId instead of activity.
Step 6: Descriptive variables: 
      Next, assign descriptive names for the variables. 
      This is achieved by replacing the short names to more descriptive ones and 
      also by eliminating repeated words or characters, paranthesis (), etc.
      This is achieved by using gsub.
Step 7: Calculate mean: 
      For the keys 'activityId, activity, subject', get the mean for each variable. 
      With 'melt' and 'dcast' functions, obtain this set of data. 
      Now, there are 180 rows (combi: 6 activities * 30 subjects = 180 rows) and 69 columns.
Step 8: Final tidy data set: 
      Eliminate 'activityId' and take the rest of the data. 
      This is the final tidy data set. Now, we have 180 rows and 68 columns.
Step 9: Write to file: 
      Write this final tidy data set to a text file; final.txt.
Finally, clean up the workspace by removing all the other variables in workspace.
NOTE: Intermittently, the unwanted variables are removed off the workspace.
```

#### Execution of the script  
1. Before executing any one of these, ensure you have set the correct directory path. Path is where this code is checked out and run_analysis.R is in that directory.   
2. Execution
   a. To execute this script in R console or R studio `source("run_analysis.R")`  
   b. To execute on the command line `R CMD BATCH run_analysis.R` and to check the execution process `vi run_analysis.Rout`.  
3. After the execution, it will generate a file call final.txt. This is the tidy data set generated by run_analysis.R  

#### Environment details
Environment in which script has been developed, executed and verified.

* Mac: OS X 10.9.2
* R: version 3.0.2
* Platform: x86_64-apple-darwin10.8.0 (64-bit)

#### Verification
* Script: run_analysis.R
* This script has been executed under different location (folders) to ensure it provides the same results (the same tidy data set).
* Also, executed every single line of command/block of command separately on R console and even this produced the same results. 
* This script has been run with and without data folder and "UCI HAR Dataset.zip" file; the average time take without "data" folder and zip file is "45" secs and with it takes around "15" secs. This timing does not include without packages installed.

References
=========
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012