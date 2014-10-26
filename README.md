Human Activity Recognition Using Smartphones Dataset Version 1.0
==================================================================

- Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
- Smartlab - Non Linear Complex Systems Laboratory
- DITEN - Università degli Studi di Genova.
- Via Opera Pia 11A, I-16145, Genoa, Italy.
- activityrecognition@smartlab.ws
- www.smartlab.ws
- Data Filtered, Merged, Joined, Pivoted and Aggregated by Sean Werick


Summary
=======

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


Human Activity Recognition Smartphones Original Dataset
======================================
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


Original Data Provided
======================================
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


Items Included for the Project
=========================================

- 'README.md'      -> High level documentation describing the data, how it was obtained and what it represents
- 'run_analysis.R' -> R script for creating the tidy datset based on Human Activity Recognition Using Smartphones Dataset
- 'codeBook.md'    -> description of the final dataset, tidyData.txt
- 'tidyData.txt'   -> Final product of run_analysis + original dataset from Human Activity Recognition Smartphones


Description of run_analysis.R
=============================

- Set data directory variables
- Read data sets
- Alias data set columns to merge later
- Merge test and training datasets
- Keep only activity_ID, subject_ID, mean() and std() columns
- Join main dataset to activity names instead of IDs
- Rearrange columns to split
- Give new dataset better column names and remove special characters
- Split columns having the subject_ID and activity_name, followed by all metrics
- Calculate mean for each metric
- Pivot data so each row represents an observation
- Output Data


Notes: 
======

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws


License:
========

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.