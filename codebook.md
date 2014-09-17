Codebook
========

Description of variables
-----------------------

The variables selected for this database come from the accelerometer and gyroscope 3-axial raw signals taccxyz and tgyroxyz. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 hz. Then they were filtered using a median filter and a 3rd order low pass butterworth filter with a corner frequency of 20 hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tbodyaccxyz and tgravityaccxyz) using another low pass butterworth filter with a corner frequency of 0.3 hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tbodyaccjerkxyz and tbodygyrojerkxyz). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tbodyaccmag, tgravityaccmag, tbodyaccjerkmag, tbodygyromag, tbodygyrojerkmag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fbodyaccxyz, fbodyaccjerkxyz, fbodygyroxyz, fbodyaccjerkmag, fbodygyromag, fbodygyrojerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
A variable name ending with xyz is used to denote the mean value 3-axial signals in the X, Y and Z directions by individual, by activity. 
Each variable is for one of the directions (X, Y, or Z).

tbodyaccxyz

tgravityaccxyz

tbodyaccjerkxyz

tbodygyroxyz

tbodygyrojerkxyz

tbodyaccmag

tgravityaccmag

tbodyaccjerkmag

tbodygyromag

tbodygyrojerkmag

fbodyaccxyz

fbodyaccjerkxyz

fbodygyroxyz

fbodyaccmag

fbodyaccjerkmag

fbodygyromag

fbodygyrojerkmag


# The set of variables estimated from these signals (prior to averaging for a mean) are:

mean: Mean value

std: Standard deviation

meanfreq: Weighted average of the frequency components to obtain a mean frequency

# Other variables:

subject: Subject ID (1-30)

activity: Activity subject is involved in (6 levels: walking, walkingupstairs, walkingdownstairs, sitting, standing, laying)
