#Hole Creator

setwd('/Users/Alec/documents/school/ucla/spring 2016/cs 124/programs/imputation')

rows_wanted = 10000
columns_wanted = 135
percent = 0.25
title = '10000SNP_S'
del_type = 'systematic' #cell, col, row, or systematic

set <- 2
full_data_sets <- c('SNP_Status.txt','imputation_training.txt')

full_data <- read.table(full_data_sets[set],header = TRUE)

subset_data <- full_data[1:rows_wanted,1:columns_wanted]
write.table(subset_data, file = paste(title,"_key.txt",sep=''))

rows <- nrow(subset_data)
columns <- ncol(subset_data)

#full_data[columns] <- NULL #only for PA1

#cell_dels
if (del_type == 'cell'){
    num_dels <- percent*rows*columns
    
    for (i in seq_len(num_dels)){
        subset_data[round(runif(1,1,rows)),round(runif(1,1,columns))] <- NA
    }
    
    sum(is.na(subset_data))
    
    write.table(subset_data,paste(title,'.txt',sep=''))
} else if (del_type == 'col'){
    col_dels <- percent*columns
    for (i in seq_len(col_dels)){
        subset_data[,round(runif(1,1,columns))] <- NA
    }
    sum(is.na(subset_data))
    
    write.table(subset_data,paste(title,'.txt',sep=''))
} else if (del_type == 'row'){
    row_dels <- percent*rows
    for (i in seq_len(row_dels)){
        subset_data[round(runif(1,1,rows)),] <- NA
    }
    
    sum(is.na(subset_data))
    
    write.table(subset_data,paste(title,'.txt',sep=''))
} else if (del_type == 'systematic'){
    for (i in seq(2,nrow(subset_data),2)){
        for (j in seq(2,ncol(subset_data),2)){
            subset_data[i,j] <- NA
        }
    }
    sum(is.na(subset_data))
    write.table(subset_data,paste(title,'.txt',sep=''))
}