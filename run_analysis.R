# run_analysis script of the getting_and_cleaning_data_assignment

# merge test and train sets
subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")
subject <- rbind(subject_train,subject_test)
rm(subject_train)
rm(subject_test)
X_train <- read.table("~/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
X_test <- read.table("~/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
X <- rbind(X_train,X_test)
rm(X_train)
rm(X_test)
y_train <- read.table("~/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")
y_test <- read.table("~/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
y <- rbind(y_train,y_test)
rm(y_train)
rm(y_test)

# extract mean and sd variables
X.extract <- X[c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543)]
# use descriptieve names
y$activity <- as.factor(y$V1)
y$V1 <- NULL
levels(y$activity) <- c('WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING')
names(X.extract) <- c('bodyAccelarationXaxisMeanTimeDomain','bodyAccelarationYaxisMeanTimeDomain','bodyAccelarationZaxisMeanTimeDomain','bodyAccelarationXaxisStdTimeDomain','bodyAccelarationYaxisStdTimeDomain','bodyAccelarationZaxisStdTimeDomain',
                            'gravityAccelarationXaxisMeanTimeDomain','gravityAccelarationYaxisMeanTimeDomain','gravityAccelarationZaxisMeanTimeDomain','gravityAccelarationXaxisStdTimeDomain','gravityAccelarationYaxisStdTimeDomain','gravityAccelarationZaxisStdTimeDomain',
                            'bodyAccelarationYerkXaxisMeanTimeDomain','bodyAccelarationYerkYaxisMeanTimeDomain','bodyAccelarationYerkZaxisMeanTimeDomain','bodyAccelarationYerkXaxisStdTimeDomain','bodyAccelarationYerkYaxisStdTimeDomain','bodyAccelarationYerkZaxisStdTimeDomain',
                            'bodyGyroXaxisMeanTimeDomain','bodyGyroYaxisMeanTimeDomain','bodyGyroZaxisMeanTimeDomain','bodyGyroXaxisStdTimeDomain','bodyGyroYaxisStdTimeDomain','bodyGyroZaxisStdTimeDomain',
                            'bodyGyroYerkXaxisMeanTimeDomain','bodyGyroYerkYaxisMeanTimeDomain','bodyGyroYerkZaxisMeanTimeDomain','bodyGyroYerkXaxisStdTimeDomain','bodyGyroYerkYaxisStdTimeDomain','bodyGyroYerkZaxisStdTimeDomain',
                            'bodyAccelarationMagnitudeMeanTimeDomain','bodyAccelarationMagnitudeStdTimeDomain',
                            'gravityAccelarationMagnitudeMeanTimeDomain','gravityAccelarationMagnitudeStdTimeDomain',
                            'bodyAccelarationYerkMagnitudeMeanTimeDomain','bodyAccelarationYerkMagnitudeStdTimeDomain',
                            'bodyGyroMagnitudeMeanTimeDomain','bodyGyroMagnitudeStdTimeDomain',
                            'bodyGyroYerkMagnitudeMeanTimeDomain','bodyGyroYerkMagnitudeStdTimeDomain',
                            'bodyAccelarationXaxisMeanFrequencyDomain','bodyAccelarationYaxisMeanFrequencyDomain','bodyAccelarationZaxisMeanFrequencyDomain','bodyAccelarationXaxisStdFrequencyDomain','bodyAccelarationYaxisStdFrequencyDomain','bodyAccelarationZaxisStdFrequencyDomain',
                            'bodyAccelarationYerkXaxisMeanFrequencyDomain','bodyAccelarationYerkYaxisMeanFrequencyDomain','bodyAccelarationYerkZaxisMeanFrequencyDomain','bodyAccelarationYerkXaxisStdFrequencyDomain','bodyAccelarationYerkYaxisStdFrequencyDomain','bodyAccelarationYerkZaxisStdFrequencyDomain',
                            'bodyGyroXaxisMeanFrequencyDomain','bodyGyroYaxisMeanFrequencyDomain','bodyGyroZaxisMeanFrequencyDomain','bodyGyroXaxisStdFrequencyDomain','bodyGyroYaxisStdFrequencyDomain','bodyGyroZaxisStdFrequencyDomain',
                            'bodyAccelarationMagnitudeMeanFrequencyDomain','bodyAccelarationMagnitudeStdFrequencyDomain',
                            'bodyAccelarationYerkMagnitudeMeanFrequencyDomain','bodyAccelarationYerkMagnitudeStdFrequencyDomain',
                            'bodyGyroMagnitudeMeanFrequencyDomain','bodyGyroMagnitudeStdFrequencyDomain',
                            'bodyGyroYerkMagnitudeMeanFrequencyDomain','bodyGyroYerkMagnitudeStdFrequencyDomain')
#
names(subject) <- c("user")
Xy <- cbind(subject,y,X.extract)
ds2 <- aggregate(Xy[,3:ncol(Xy)], list(Xy$user,Xy$activity), mean)
names(ds2)[names(ds2) == "Group.1"] <- "user"
names(ds2)[names(ds2) == "Group.2"] <- "activity"
# write results to file
write.table(ds2, "averages.txt", row.names = FALSE, quote = FALSE)