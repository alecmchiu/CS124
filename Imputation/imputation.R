#Imputation

setwd('/Users/Alec/documents/school/ucla/spring 2016/cs 124/programs/imputation')

datasets <- c('SNP_Status.txt','imputation_training.txt','imputation_test.txt')

train <- read.table(datasets[2],header = TRUE)
test <- read.table(datasets[3],header = TRUE, fill = TRUE)

means <- colMeans(train)