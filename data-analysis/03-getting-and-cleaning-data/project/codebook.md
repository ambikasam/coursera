Code book for "getting and cleaning data"
==========

This code book would describe
* the variables,
* the data, and
* any transformations or work that is performed to clean up the data  

Variables
==========

### Column headers
* activity,
* subject,
* And the other 66 variables.

#### activity and subject 
```R
The experiments have been carried out with a group of "30" volunteers within an age bracket of 19-48 years.
Each person performed "six" activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
```
**activity**  This comprises of six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  
**subject**   This comprises of those 30 volunteers. 1 to 30 values assigned.  

##### other 66 variables
###### Features selection:
```R
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

###### Variables and Features mapping:   
This section shows the correlation between the features and the variables.  

Refer to [Variable and features mapping file](https://github.com/ambikasam/coursera/blob/master/data-analysis/03-getting-and-cleaning-data/project/variables-features-mapping.csv)

```R
Headers with `New variable name` and `Old variable name(from features.txt)` are "VARIABLES"
Headers with `Domain signals (time/frequency)`, `body/gravity, accelerometer/gyroscope`, `jerk/jerk magnitude/magnitude`,
`computations(mean/standarddeviation)` and `axials(X/Y/Z)` are "FEATURES"
```


###### 66 variables are:
```R
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


Data
==========


Transformations
==========