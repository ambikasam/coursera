code book for getting and cleaning data excersise
==========

### Variables and Features mapping
#### Features selection details:
```R
The features selected for this database come from the "accelerometer" and "gyroscopic" with 3-axial raw signals 
   "X, Y" and "Z".
The time domain signals were captured and finally a Fast Fourier Transform (FFT) was applied to some of these 
   signals (frequency domain signals). These are the 2 domain signals "time" and "frequency".
Similarly, the acceleration signal was then separated into "body" and "gravity" acceleration signals.
"Jerk" signals were obtained from the derived body linear acceleration and angular velocity.
Also the "magnitude" of these three-dimensional signals were calculated using the Euclidean norm.
We have derived/computed  "mean" and "standard derivation" for the above signal combinations.
```

#### Variables and Features mapping:   
The main categories of the headers in Variable and features mapping file is as given below.  
  
**VARIABLES**  
New variable name  
Old variable name(from features.txt)  
  
**FEATURES**  
Domain signals (time/frequency)  
body/gravity  
accelerometer/gyroscope  
jerk/jerk magnitude/magnitude  
computations(mean/standarddeviation)  
axials(X/Y/Z)  
  
[Variable and features mapping file](https://github.com/ambikasam/coursera/blob/master/data-analysis/03-getting-and-cleaning-data/project/variables-features-mapping.csv)


### Variables details

activity  
subject  
