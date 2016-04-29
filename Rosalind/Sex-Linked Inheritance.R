#Sex-Linked Inheritance

A <- scan('rosalind_sexl.txt',sep = ' ')
#A <- c(0.1, 0.5, 0.8)
B <- c()

for (each in A){
    p = each
    q = 1-p
    B <- c(B, (2*p*q))
}

cat (B)