# Read Me for the explanation of run_analysis.R
The code in the "run_analysis.R" script performs the following steps in sequential order to produce the required output:

Step 1 - Initialize program variables.

Step 2 - Check existence of download directory. If download directory does not exist it creates one.

Step 3 - Download the data file for the project from the given URL and save it on disk and unzip the file.

Step 4 - Load the ActivityLabel and Features data into their respective variables.

Step 5 - Load the Test data into their respective variables.

Step 6 - Merge the yTestDS data with the activityLabelDS data into a mergedTestDS dataset.

Step 7 - Merging the xTestDS data with mergedTestDS dataset.

Step 8 - Remove duplicate column from the mergedTestDS dataset.

Step 9 - Filter mergedTestDS dataset to select columns which contains MEANS and STANDARD DEVIATION.

Step 10 - Perform garbage collection on test data variables to free up memory.

Step 11 - Load the Training data into their respective variables.

Step 12 - Merge the yTrainDS data with the activityLabelDS data into a mergedTrainDS dataset.

Step 13 - Merging the xTrainDS data with mergedTrainDS dataset.

Step 14 - Remove duplicate column from the mergedTrainDS dataset.

Step 15 - Filter mergedTrainDS dataset to select columns which contains MEANS and STANDARD DEVIATION.

Step 16 - Perform garbage collection on training data variables to free up memory.

Step 17 - Perform garbage collection on analysislabel and features data variables to free up memory.

Step 18 - Combine Test and Training data by combining mergedTestDS and mergedTrainDS datasets.

Step 19 - Summarizing script output.

Step 20 - Store script output in run_analysis variable.