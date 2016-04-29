#Sex-Linked Inheritance

A <- scan('rosalind_afrq.txt',sep = ' ')
B <- c()

for (each in A){
    p = sqrt(each)
    q = 1-p
    B <- c(B, (2*p*q + p**2))
}

cat (B)
