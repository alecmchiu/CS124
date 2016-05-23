#Imputation

setwd('/Users/Alec/documents/school/ucla/spring 2016/cs 124/programs/imputation')

set <- 3

training <- c('PA1_train.txt','PA1_train.txt','imputation_training.txt')
testing <- c('PA1_test_pure_random.txt','PA1_test_sys_random.txt','imputation_test.txt')
key_sets <- c('PA1_test_key.txt','PA1_test_key.txt')

credit_set <- length(training)

train <- read.table(training[set], header = TRUE)
test <- read.table(testing[set], header = TRUE, fill = TRUE)

means <- round(colMeans(train))
header <- colnames(test)

holes <- sum(is.na(test))

for (i in seq_len(nrow(test))){
    for (j in seq_len(ncol(test))){
        if (is.na(test[i,j])){
            test[i,j] <- means[as.character(header[j])]
        }
    }
}
if (set != credit_set){
    key <- read.table(key_sets[set], header = TRUE)
    error <- 0
    for (i in seq_len(nrow(test))){
        for (j in seq_len(ncol(test))){
            if (test[i,j] != key[i,j]){
                error <- error +1
            }
        }
    }
    
    cat(c('Success: ', (holes - error)/holes,'\n'),sep = '')
    cat(c('Failure: ', error/holes),sep='')
}

