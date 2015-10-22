run_analysis.R is a R script to read the Train & Test data-sets' and summarize it.

It reqires a root directory path as input. 
The root directory should contain the data files for the R script to run. The script uses the below files in the root directory:
- 'features.txt': It reads the header names for the Train & Test observations from this file. This file contains 561 header / observation names for Train & Test data.
- 'activity_labels.txt' : The different activities based on which the observations are taken are present in this file.

Withn the root directory, there are 2 sub-directories :
- train : This directory contains train related data.
- test : This directory contains test related data.

The files that are used in this script is as below . The same type of files are present for train & test.

- 'train/subject_train.txt' : The script reads the subject number/person details for each row from this file.
- 'train/y_train.txt': The script reads the activity number details for each row from this file. The activity number from this file is joined with 'activity_labels.txt' (in root directory) to get the activity description.
- 'train/X_train.txt': The script reads the 561 observation details from this file. The header names for each observation comes from 'features.txt' (in root directory). This data is finally joined with 'train/subject_train.txt' to get subject number for each row. This data is also joined with 'train/y_train.txt' to get activity name.

- 'test/subject_test.txt' : The script reads the subject number/person details for each row from this file.
- 'test/y_test.txt': The script reads the activity number details for each row from this file. The activity number from this file is joined with 'activity_labels.txt' (in root directory) to get the activity description.
- 'test/X_test.txt': The script reads the 561 observation details from this file. The header names for each observation comes from 'features.txt' (in root directory). This data is finally joined with 'test/subject_test.txt' to get subject number for each row. This data is also joined with 'test/y_test.txt' to get activity name.
