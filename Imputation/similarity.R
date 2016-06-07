start <- proc.time()

setwd('/Users/Alec/documents/school/ucla/spring 2016/cs 124/programs/imputation')

set <- 1 # 1=100 SNP, 2=1000SNP, 3=10000SNP
type <- 2 # 1=random, 2 = systematic

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

NA_cols <- names(test[colSums(is.na(test)) > 0])
if (type == 2){
    inference_cols <- names(test[colSums(is.na(test)) == 0])
} else {
    inference_cols <- names(test)
}
test[is.na(test)] <- -1 #set all NA to -1 for easier handling

for (column in NA_cols){
    similarity_score <- 0
    best_column <- NA
    for (each in inference_cols){
        if (column == each){
            next
        } else {
            score <- sum(test[,column]==test[,each])
            if (score > similarity_score){
                similarity_score <- score
                best_column <- each
            }
        }
    }
    NA_vals <- which(test[,column]==-1)
    for (i in seq_len(length(NA_vals))){
        test[,column][NA_vals[i]] <- test[,best_column][NA_vals[i]]
    }
}
#sum(test==-1)
if (sum(test == -1) > 0){
    means <- round(rowMeans(test, na.rm = TRUE))
    leftover <- which(test==-1,TRUE)
    for (i in seq_len(nrow(leftover))){
        test[leftover[i,1],leftover[i,2]] <- means[leftover[i,1]]
    }
}
run_time <- proc.time() - start

error <- 0
for (i in seq_len(nrow(empty))){
    if (test[empty[i,1],empty[i,2]] != key[empty[i,1],empty[i,2]]){
        error <- error + 1
    }
}

cat(c('F1 Score: ', (holes - error)/holes,'\n','Time: ',run_time['elapsed'],'s'),sep = '')
