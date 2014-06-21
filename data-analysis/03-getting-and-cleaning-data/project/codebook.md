Code book for "getting and cleaning data"
==========

This code book would describe
* the variables,
* the data, and
* any transformations or work that is performed to clean up the data  

Variables
==========

### Column headers are:
* activity,
* subject,
* And the other 66 variables.

## activity and subject 
```R
The experiments have been carried out with a group of "30" volunteers within an age bracket of 19-48 years.
Each person performed "six" activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
```
**activity**  This comprises of 6 activities: `WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`  and `LAYING`  
**subject**   This comprises of those 30 volunteers. `1 to 30 values assigned.`  

## other 66 variables  

**Points to be consider**
1. For this excercise, for each of these 66 variables, mean has been computed and stored as part of tidy data set; irrespective of the variable derived value in raw data is mean or standard deviation.
1. Under each of these variables only the averaged value for each variable is stored, i.e., mean; for each acitivity and subject combination. But the variable name do not reflect the final mean computation, it retains the variable name as-is.

### Features selection
```R
'Raw data features selection details:
The features selected for this database come from the "accelerometer" and "gyroscopic" with 3-axial raw signals 
   "X, Y" and "Z".
The time domain signals were captured and finally a Fast Fourier Transform (FFT) was applied to some of these 
   signals (frequency domain signals). These are the 2 domain signals "time" and "frequency".
Similarly, the acceleration signal was then separated into "body" and "gravity" acceleration signals.
"Jerk" signals were obtained from the derived body linear acceleration and angular velocity.
Also the "magnitude" of these three-dimensional signals were calculated using the Euclidean norm.
We have derived/computed  "mean" and "standard derivation" for the above signal combinations.
This forms the complete set of feature selection (variables) for this data cleaning process.
```

### 66 variables   

**Range of values:** The range of values for these variables are between -1 to 1.  

```R
'These 66 variables are dervied from these 6 basic combinations:
 t/f              -> time/frequency [Fast Fourier Transform (FFT)]  --> domain signals
 X,Y or Z         -> X,Y and Z directions.                          --> 3 axial signals
 Acc/Gyro         -> accelerometer/gyroscope
 Body/Gravity     -> body/gravity
 Jerk/JerkMag/Mag -> jerk/jerkmagnitude/magnitude
 mean()/std()     -> mean/standarddeviation
```
```R
NOTE: "Naming Convention:" All letters are in lower case and a dash in-between the words, for better readability.
The actual expectation from this excersise is to clean the raw data and get "average" of every 66 variable for 
each "activity and subject" combination. Thus, the 66 variables are retained as-is it is not changed 
(did not manipulate by slicing it further down into different variables, etc.).

'66 variables are:
time-body-accelerometer-mean-X
time-body-accelerometer-mean-Y
time-body-accelerometer-mean-Z
time-body-accelerometer-standarddeviation-X
time-body-accelerometer-standarddeviation-Y
time-body-accelerometer-standarddeviation-Z
time-gravity-accelerometer-mean-X
time-gravity-accelerometer-mean-Y
time-gravity-accelerometer-mean-Z
time-gravity-accelerometer-standarddeviation-X
time-gravity-accelerometer-standarddeviation-Y
time-gravity-accelerometer-standarddeviation-Z
time-body-accelerometer-jerk-mean-X
time-body-accelerometer-jerk-mean-Y
time-body-accelerometer-jerk-mean-Z
time-body-accelerometer-jerk-standarddeviation-X
time-body-accelerometer-jerk-standarddeviation-Y
time-body-accelerometer-jerk-standarddeviation-Z
time-body-gyroscope-mean-X
time-body-gyroscope-mean-Y
time-body-gyroscope-mean-Z
time-body-gyroscope-standarddeviation-X
time-body-gyroscope-standarddeviation-Y
time-body-gyroscope-standarddeviation-Z
time-body-gyroscope-jerk-mean-X
time-body-gyroscope-jerk-mean-Y
time-body-gyroscope-jerk-mean-Z
time-body-gyroscope-jerk-standarddeviation-X
time-body-gyroscope-jerk-standarddeviation-Y
time-body-gyroscope-jerk-standarddeviation-Z
time-body-accelerometer-magnitude-mean
time-body-accelerometer-magnitude-standarddeviation
time-gravity-accelerometer-magnitude-mean
time-gravity-accelerometer-magnitude-standarddeviation
time-body-accelerometer-jerkmagnitude-mean
time-body-accelerometer-jerkmagnitude-standarddeviation
time-body-gyroscope-magnitude-mean
time-body-gyroscope-magnitude-standarddeviation
time-body-gyroscope-jerkmagnitude-mean
time-body-gyroscope-jerkmagnitude-standarddeviation
frequency-body-accelerometer-mean-X
frequency-body-accelerometer-mean-Y
frequency-body-accelerometer-mean-Z
frequency-body-accelerometer-standarddeviation-X
frequency-body-accelerometer-standarddeviation-Y
frequency-body-accelerometer-standarddeviation-Z
frequency-body-accelerometer-jerk-mean-X
frequency-body-accelerometer-jerk-mean-Y
frequency-body-accelerometer-jerk-mean-Z
frequency-body-accelerometer-jerk-standarddeviation-X
frequency-body-accelerometer-jerk-standarddeviation-Y
frequency-body-accelerometer-jerk-standarddeviation-Z
frequency-body-gyroscope-mean-X
frequency-body-gyroscope-mean-Y
frequency-body-gyroscope-mean-Z
frequency-body-gyroscope-standarddeviation-X
frequency-body-gyroscope-standarddeviation-Y
frequency-body-gyroscope-standarddeviation-Z
frequency-body-accelerometer-magnitude-mean
frequency-body-accelerometer-magnitude-standarddeviation
frequency-body-accelerometer-jerkmagnitude-mean
frequency-body-accelerometer-jerkmagnitude-standarddeviation
frequency-body-gyroscope-magnitude-mean
frequency-body-gyroscope-magnitude-standarddeviation
frequency-body-gyroscope-jerkmagnitude-mean
frequency-body-gyroscope-jerkmagnitude-standarddeviation
```

### Variables and Features mapping:   
For variables and features detailed mapping, refer to this section.  
This section shows the correlation between the features and the variables, which describes what each variable comprises off.  

```R
The first 2 rows in this "Variable and features mapping" file are headers.
Headers with `New variable name` and `Old variable name(from features.txt)` are "VARIABLES"
Headers with `Domain signals (time/frequency)`, `body/gravity, accelerometer/gyroscope`, 
`jerk/jerk magnitude/magnitude`, `computations(mean/standarddeviation)` and `axials(X/Y/Z)` are "FEATURES"
```

Refer to [Variable and features mapping file](https://github.com/ambikasam/coursera/blob/master/data-analysis/03-getting-and-cleaning-data/project/variables-features-mapping.csv)


Data
==========
For intro to raw data, please refer to [Raw data section in README.md](https://github.com/ambikasam/coursera/tree/master/data-analysis/03-getting-and-cleaning-data/project#raw-data).

The raw data files[1] considered for "tidying the data set":  
* Test data with [under test folder]
   * subject
   * y
   * X
* Train data with [under train folder]
   * subject
   * y
   * X  
which together had 6 activities, 30 subjects and 561 variables.  

`For more info, please refer to the above "Variables" section on "activity and subject" and "feature selection".`

```R
X train      :    7352 rows and 561 columns
y train      :    7352 rows and   1 column   [1-6 values]; these are activityId labels
subject_train:    7352 rows and   1 column   [1-30 values]; these are subjects who performed in the window slot 1-30
X test       :    2947 rows and 561 columns 
y test       :    2947 rows and   1 column   [1-6 values]; these are activityId labels
subject_test :    2947 rows and   1 column   [1-30 values]; these are subjects who performed in the window slot 1-30
```  

In raw data, there were 7352 (train) + 2947 (test)    = 10299 rows.  
In raw data, there were 561 (X) + 1 (y) + 1 (subject) =   563 columns.  
Out of 561 variables, only mean and std (standard deviation) measurements are considered for the final tidy data set. Thus, it is 66 variables in the final data set.  

The final tidy data set has been processed to have a new set of data with, 6 activities, 30 subjects and 66 variables.  
For each combination of these activities and subjects (6 * 30 = 180), there is mean calculated for every 66 variable.  
Thus, the final data has 66 + 2 = 68 columns and 180 rows.  

This has been achieved by processing the raw data through as set of tranformers. `Please refer to "Transformations" section for more info on this.`


Transformations
==========
The transformations of raw data to tidy data set is captured here - [section "Script > The flow of the script" in README.md](https://github.com/ambikasam/coursera/tree/master/data-analysis/03-getting-and-cleaning-data/project#the-flow-of-the-script).  
Also, [run_analysis.R](https://github.com/ambikasam/coursera/blob/master/data-analysis/03-getting-and-cleaning-data/project/run_analysis.R) is the script which tranforms the raw data (test and train data sets) to the final tiday data set. After processing this file, there will be a new file generated called "final.txt". This file will contain the final tidy data set. Refer to [`Tidy data set` section in README.md](https://github.com/ambikasam/coursera/tree/master/data-analysis/03-getting-and-cleaning-data/project#tidy-data-set)

References
=========
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012  