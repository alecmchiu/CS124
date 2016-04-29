#Generate the Frequency Array of a Strings

library(gtools)

raw <- scan("rosalind_ba1k.txt",what=character(),sep = '\n')

string <- raw[1]
k <- as.numeric(raw[2])

freq_arr <- matrix(data = 0,nrow = 1,ncol=4**k)

nt <- c('A','T','C','G')
kmer_matrix <- permutations(4,k,nt,repeats.allowed = TRUE)
kmers <- c()

for (i in seq_len(nrow(kmer_matrix))){
    kmers <- c(kmers, paste(kmer_matrix[i,],collapse=''))
}

kmers <- sort(kmers)
colnames(freq_arr) <- kmers

for (i in seq_len(nchar(string)-k+1)){
    kmer <- substr(string,i,i+k-1)
    freq_arr[,toString(kmer)] <- freq_arr[,toString(kmer)] + 1
}

cat(freq_arr[1,])