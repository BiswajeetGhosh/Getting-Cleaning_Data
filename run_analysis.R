library(dplyr)
run_analysis <- function(directory) {

## Set the different directory path for Test & Train Data

train_dir <- paste0(directory,"/train")
test_dir <- paste0(directory,"/test")


## Read the Activity & features information

activity_labels <- read.table(paste0(directory,"/activity_labels.txt"))
	colnames(activity_labels) <- c("act_id","activity_name")
data_header <- read.table(paste0(directory,"/features.txt"),colClasses=c("numeric","character"))
	colnames(data_header) <- c("mrs_id","measures")

	
## Filter the mean() & std() variables present in features file and store it in a vector. 
## The Train & Test data-sets would contain the columns present in v_col vector

v_col <- data_header[grep("mean\\(\\)|std\\(\\)",data_header$measures), "mrs_id"]
	



## Read the Train related subject, activity & measurement data

train_subject <- read.table(paste0(train_dir,"/subject_train.txt"))
	train_subject <- cbind(as.numeric(rownames(train_subject)),train_subject)
	colnames(train_subject) <- c("row_id","sub_id")
	
train_activity <- read.table(paste0(train_dir,"/y_train.txt"))
	train_activity <- cbind(as.numeric(rownames(train_activity)),train_activity)
	colnames(train_activity) <- c("row_id","act_id")
	
train_data <- read.table(paste0(train_dir,"/X_train.txt"))
	colnames(train_data) <- c(data_header$measures)

## Keep only the mean() & std() variable columns
train_data <- train_data[,v_col]
	train_data <- cbind(row_id=as.numeric(rownames(train_data)),train_data)

## Join the different Train data-sets' to create a single Train data-set

train_activity <- merge(train_activity, activity_labels, by="act_id")
train_sub_act <- merge(train_activity, train_subject, by="row_id")
train_sub_act <- train_sub_act[,c("row_id","sub_id", "activity_name")]

train_data <- merge(train_data, train_sub_act, by="row_id")




## Read the Test related subject, activity & measurement data

test_subject <- read.table(paste0(test_dir,"/subject_test.txt"))
	test_subject <- cbind(as.numeric(rownames(test_subject)),test_subject)
	colnames(test_subject) <- c("row_id","sub_id")
	
test_activity <- read.table(paste0(test_dir,"/y_test.txt"))
	test_activity <- cbind(as.numeric(rownames(test_activity)),test_activity)
	colnames(test_activity) <- c("row_id","act_id")
	
test_data <- read.table(paste0(test_dir,"/X_test.txt"))
	colnames(test_data) <- c(data_header$measures)
	
## Keep only the mean() & std() variable columns
test_data <- test_data[,v_col]
	test_data <- cbind(row_id=as.numeric(rownames(test_data)),test_data)

## Join the different Test data-sets' to create a single Test data-set

test_activity <- merge(test_activity, activity_labels, by="act_id")
test_sub_act <- merge(test_activity, test_subject, by="row_id")
test_sub_act <- test_sub_act[,c("row_id","sub_id", "activity_name")]

test_data <- merge(test_data, test_sub_act, by="row_id")



## Combine the Train & Test data-sets' to create a single data-set
com_data <- rbind(train_data,test_data)
com_data <- subset(com_data, select = -c(row_id) )



## Calculate a tidy data set with the average of each variable for each activity and each subject
avg_data <- com_data %>%
group_by(activity_name, sub_id) %>%
summarise_each(funs(mean))


## Write the tidy data-set
write.table(avg_data,paste0(directory,"/final_avg.txt"),row.name=FALSE)
}
