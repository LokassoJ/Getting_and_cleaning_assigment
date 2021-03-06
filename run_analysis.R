library(dplyr)
library(stringr)
## download.file( url, dest="dataset.zip", mode="wb") 
## unzip ("dataset.zip", exdir = "./UCI_HAR_dataset")
subject_train<-read.table("./train/subject_train.txt")
subject_test<-read.table("./test/subject_test.txt")
X_test<-read.table("./test/X_test.txt")
Y_test<-read.table("./test/y_test.txt")
Y_train<-read.table("./train/y_train.txt")
X_train<-read.table("./train/X_train.txt")
activity_labels<-read.table("./activity_labels.txt")
features<-read.table("./features.txt")
train_data<-cbind(subject_train,Y_train,X_train)
test_data<-cbind(subject_test,Y_test,X_test)
full_data<-rbind(train_data,test_data)
mycolnames<-c("subject","activity",features$V2)
colnames(full_data)<-mycolnames
myvar<-features$V2[str_detect(features$V2,"mean",negate=FALSE)|str_detect(features$V2,"std",negate=FALSE)]
full_data<-select(full_data,subject,activity,all_of(myvar))
full_data<-left_join(full_data,activity_labels,by=c("activity"="V1"))
full_data$activity<-full_data$V2
full_data<-select(full_data,-V2)
full_data<-group_by(full_data,subject,activity)
full_data_mean<-summarize_all(full_data,list(mean=mean))