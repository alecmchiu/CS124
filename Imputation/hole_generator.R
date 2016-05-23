#Hole Creator

setwd('/Users/Alec/documents/school/ucla/spring 2016/cs 124/programs/imputation')

rows_wanted = 1000
columns_wanted = 100
percent = 0.1
title = 'real_1000SNP_n100'
del_type = 'cell' #cell, col, or row

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
}

#column_dels
if (del_type = 'col'){
    col_dels <- percent*columns
    for (i in seq_len(col_dels)){
        subset_data[,round(runif(1,1,columns))] <- NA
    }
    sum(is.na(subset_data))
    
    write.table(subset_data,paste(title,'.txt',sep=''))
}

#row_dels
if (del_type == 'row'){
    row_dels <- percent*rows
    for (i in seq_len(row_dels)){
        subset_data[round(runif(1,1,rows)),] <- NA
    }
    
    sum(is.na(subset_data))
    
    write.table(subset_data,paste(title,'.txt',sep=''))
}