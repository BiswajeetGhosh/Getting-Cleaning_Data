
1. The script run_analysis.R takes a root directory path as input.

2. It then sets the different directory path for Test & Train data-sets.

3. It then reads the Activity & features information as data.frame from 'activity_labels.txt' & 'features.txt' files respectively.
	activity_labels <- data.frame for Activity information.
	data_header <- data.frame for features/header names.
	
4. It then filters the mean() & std() variables present in 'data_header' variable and stores it in 'v_col' vector.

5. It then reads the Train related data in the below data.frame.
	train_subject <- data.frame for train subject details per row.
	train_activity <- data.frame for train activity details per row.
	train_data <- data.frame for train observation details. The column names for this data.frame is set by information from 'data_header' data.frame. Then this data frame is filtered to contain only the column names present in vector 'v_col'. Also a 'row_id' column is generated for this data.frame to contain the sequential row numbers.
	
6. It then joins the 'train_subject', 'train_activity', 'train_data' to create a single Train data-set.

7. It then reads the Test related data in the below data.frame.
	test_subject <- data.frame for test subject details per row.
	test_activity <- data.frame for test activity details per row.
	test_data <- data.frame for test observation details. The column names for this data.frame is set by information from 'data_header' data.frame. Then this data frame is filtered to contain only the column names present in vector 'v_col'. Also a 'row_id' column is generated for this data.frame to contain the sequential row numbers.
	
8. It then joins the 'test_subject', 'test_activity', 'test_data' to create a single Test data-set.

9. It then combines the Train & Test data-sets' to create a single data-set in data.frame 'com_data'.

10. Then it calculates a tidy data set with the average of each variable for each activity and each subject in data.frame 'avg_data' using dplyr package in R.

11. Finally the data.frame 'avg_data' is written to a file.
