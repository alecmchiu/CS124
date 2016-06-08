start <- proc.time()

setwd('/Users/Alec/documents/school/ucla/spring 2016/cs 124/programs/imputation')

set <- 1 # 1=100 SNP, 2=1000SNP, 3=10000SNP
type <- 1 # 1=random, 2 = systematic

if (type == 1){
    data_set <- c('100SNP_R.txt','1000SNP_R.txt','10000SNP_R.txt')
} else if (type == 2){
    data_set <- c('100SNP_S.txt','1000SNP_S.txt','10000SNP_S.txt')
}
key <- c('100SNP_key.txt','1000SNP_key.txt','10000SNP_key.txt')

test <- read.table(data_set[set], header = TRUE)
key <- read.table(key[set], header = TRUE)

holes <- sum(is.na(test))
empty <- which(is.na(test),TRUE)

#cor_mat <- cor(t(test),use='pairwise.complete.obs')
#diag(cor_mat) <- 0

NA_cols <- names(test[colSums(is.na(test)) > 0])
if (type == 2){
    inference_cols <- names(test[colSums(is.na(test)) == 0])
} else {
    inference_cols <- names(test)
}
test[is.na(test)] <- -1 #set all NA to -1 for easier handling



run_time <- proc.time() - start

error <- 0
for (i in seq_len(nrow(empty))){
    if (test[empty[i,1],empty[i,2]] != key[empty[i,1],empty[i,2]]){
        error <- error + 1
    }
}

cat(c('F1 Score: ', (holes - error)/holes,'\n','Time: ',run_time['elapsed'],'s'),sep = '')