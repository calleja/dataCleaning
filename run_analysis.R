
#change workspace to directory containing raw data
setwd('')
##############################
#######   load the raw files   ###############
#1) subject_test.txt
test.sub<-read.table('./subject_test.txt')
#2) X_test.txt
test.X<-read.table('./X_test.txt')
#3) y_test.txt
test.y<-read.table('./y_test.txt')

#4) subject_train.txt
train.sub<-read.table('./subject_train.txt')
#5) X_train.txt
train.X<-read.table('./X_train.txt')
#6) y_train.txt
train.y<-read.table('./y_train.txt')

#features info:
features<-read.table('/features.txt', sep=" ")
#the 'features' table states the names of the fields
#in trains./test.x/y
###########  file loading ###########
######################################

#######  Question  #1  ###########
#stack the test and train data
full<-rbind(train.sub,test.sub)

######  end question #1  ############
######################################

#####################################
#######  Question 2  ################
#Extracts only the measurements on the mean and standard 
#deviation for each measurement

#field names are found in 'features' data.frame
install.packages('stringr')
library(stringr)

stats<-c("mean()","std()")
#select any observation that contains any within the 'stats' 
#vector
index<-str_detect(features[,2],paste(stats,collapse="|"))
#test<-factor(features[index,2]) #... this works... be careful

#put the features of interest in a vector
fields<-features[index,]

#select out from train and text those fields of 
#mean() and standard deviation()
stats.train<-train.X[,index]
stats.test<-test.X[,index]

#dataset containing only those variables of mean and std 
stats.full<-rbind(stats.train,stats.test)
#########  end question #2  ###########
#######################################

########################################
######  question #3  ###################
#Uses descriptive activity names to name the activities 
#in the data set
#from the hints: we get the activity number in the data
#and replace them with descriptive terms 

#read in activity labels
activity<-read.table('./activity_labels.txt')

#the activity labels are in the y files , i.e.
# y_test.txt and y_train... the "x" files contain data

#put some temporary labels on the variables
colnames(activity)<-c('act.code','act.names')
colnames(test.y)<-'act.code'
colnames(train.y)<-'act.code'

activity.test<-merge(test.y, activity,by='act.code',sort=FALSE)
activity.train<-merge(train.y, activity,by='act.code',sort=FALSE)

#cbind the activity names in the activity tables to 
#both the subject tables of train/test and X_ tables
#ultimate answer to #3
colnames(activity)<-c('act.code','act.names')
colnames(test.y)<-'act.code'
colnames(train.y)<-'act.code'

y.data<-rbind(train.y,test.y)
sub.data<-rbind(train.sub,test.sub)

check<-cbind(sub.data,y.data) #dim:10299 x 2


colnames(check)[1]<-'sub.id'
colnames(activity)[1]<-'act.code.id'

re.merge<-merge(check,activity,by.x='act.code',
by.y='act.code.id',sort=FALSE,suffixes=c(".x",".y"))

#the metadata dataset (that with volunteer ID and activity code) 
#recasted with activity names
df.full<-cbind(re.merge,stats.full)

############  end QUESTION #3   ###################
###############################################

###################################
######   QUESTION #4  ###############

#'features' data.frame contains the labels to be placed
#on the test/train data sets (first 561 columns)

#what are the labels on columns 562-564 
names(data.test[,562:564])
head(data.test[,562:564])

#ultimate answer for question #4
colnames(df.full)[4:82]<-as.character(fields[,2])
###########################################

#############################################
##########    QUESTION #5   ##################
#From the data set in step 4, create a second, 
#independent tidy data set with the average of each 
#variable for each activity and each subject

install.packages('plyr')
install.packages('data.table')
library(plyr)
library(data.table)
dt.full<-data.table(df.full[,-3])
dt.full.1<-copy(dt.full)

#attempting to give final answer to #5
dt.full<-dt.full[,lapply(.SD,mean,na.rm=TRUE),
by=c("sub.id","act.code")]

#either lapply or .SD converted the factor variable 
#"act.names" into its numeric version
dt.full[,act.names:=
factor(act.code,labels=activity[,2])]

df.check<-data.frame(dt.full)

#tidying data with arrange
df.final<-arrange(df.check,act.code,sub.id)
