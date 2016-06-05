start <- proc.time()

setwd('/Users/Alec/documents/school/ucla/spring 2016/cs 124/programs/imputation')

set <- 3 # 1=100 SNP, 2=1000SNP, 3=10000SNP
type <- 2 # 1=random, 2 = systematic

if (type == 1){
    data_set <- c('100SNP_R.txt','1000SNP_R.txt','10000SNP_R.txt')
} else if (type == 2){
    data_set <- c('100SNP_S.txt','1000SNP_S.txt','10000SNP_S.txt')
}
key <- c('100SNP_key.txt','1000SNP_key.txt','10000SNP_key.txt')

test <- read.table(data_set[set], header = TRUE)
key <- read.table(key[set], header = TRUE)

means <- round(rowMeans(test, na.rm = TRUE))

holes <- sum(is.na(test))
empty <- which(is.na(test),TRUE)

for (i in seq_len(nrow(empty))){
    test[empty[i,1],empty[i,2]] <- means[empty[i,1]]
}

run_time <- proc.time() - start

error <- 0
for (i in seq_len(nrow(empty))){
    if (test[empty[i,1],empty[i,2]] != key[empty[i,1],empty[i,2]]){
        error <- error + 1
    }
}

cat(c('Success: ', (holes - error)/holes,'\n'),sep = '')
cat(c('Failure: ', error/holes),sep='')

print(run_time)