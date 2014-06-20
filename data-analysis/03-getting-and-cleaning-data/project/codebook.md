code book for getting and cleaning data excersise.

Features selection details:
The features selected for this database come from the accelerometer and gyroscopic with 3-axial raw signals X, Y and Z.
The time domain signals were captured and finally a Fast Fourier Transform (FFT) was applied to some of these signals (frequency domain signals). These are the 2 domain signals time and frequency.
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
Jerk signals were obtained from the derived "the body linear acceleration and angular velocity".
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag)
We have derived/computed  mean and standard derivation for the above signal combinations.

Variables and Features mapping:							
VARIABLES 					FEATURES		
New variable name	Old variable name(from features.txt)	Domain signals (time/frequency)	body/gravity	accelerometer/gyroscope	jerk/jerk magnitude/magnitude	computations(mean/standarddeviation)	axials(X/Y/Z)