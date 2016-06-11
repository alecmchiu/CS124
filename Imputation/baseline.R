start <- proc.time()

getmode <- function(x1){
    x <- x1[!is.na(x1)]
    ux <- unique(x)
    ux[which.max(tabulate(match(x,ux)))]
}

mode2 <- function(matrix){
    apply(matrix,1,getmode)
}

setwd('/Users/Alec/documents/school/ucla/spring 2016/cs 124/programs/imputation')

impute_mode <- 1 #1=mean, 2=mode
set <- 1 # 1=100 SNP/easy, 2=1000SNP/medium, 3=10000SNP/hard
type <- 3 # 1=random, 2 = systematic, 3 = Bilow sets, 4 = Bilow credit sets

key <- c('100SNP_key.txt','1000SNP_key.txt','10000SNP_key.txt')

if (type == 1){
    data_set <- c('100SNP_R.txt','1000SNP_R.txt','10000SNP_R.txt')
} else if (type == 2){
    data_set <- c('100SNP_S.txt','1000SNP_S.txt','10000SNP_S.txt')
} else if (type == 3){
    data_set <- c('easy_test.txt','medium_test.txt','hard_test.txt')
    key <- c('easy_answer.txt','medium_answer.txt','hard_answer.txt')
} else if (type == 4){
    data_set <- c('easy.txt','medium.txt','hard.txt')
}

if (type <= 2){
    test <- read.table(data_set[set], header = TRUE)
    key <- read.table(key[set], header = TRUE)
} else {
    test <- read.table(data_set[set],header = TRUE, na.strings = '-1')
    if (type == 3){
        key <- read.table(key[set], header = TRUE)
    }
}

if (impute_mode == 2){
    means <- mode2(test)
} else{ 
    means <- round(rowMeans(test, na.rm = TRUE))
}

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

cat(c('F1 Score: ', (holes - error)/holes,'\n','Time: ',run_time['elapsed'],'s'),sep = '')