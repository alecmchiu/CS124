#Hole Creator

setwd('/Users/Alec/documents/school/ucla/spring 2016/cs 124/programs/imputation')

full_data <- read.table('SNP_Status.txt',header = TRUE)

rows <- nrow(full_data)
columns <- ncol(full_data)
full_data[columns] <- NULL

num_dels <- 0.1*rows*columns

for (i in seq_len(num_dels)){
    full_data[round(runif(1,1,rows)),round(runif(1,1,columns))] <- NA
}