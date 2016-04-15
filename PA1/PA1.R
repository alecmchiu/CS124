#Alec Chiu
#SID: 904-175-341
#CS 124

student_info <- c("UID:904175341","email:alecmchiu@ucla.edu","Undergrad or Grad:undergrad")

start <- proc.time()
data <- read.table("SNP_Status.txt", header = TRUE)
print (start-proc.time())
cases <- subset(data,Status=='Case')
controls <- subset(data,Status=='Control')

A <- c("<A>")
B <- c("<B>")

n_cases <- length(rownames(cases))
n_controls <- length(rownames(controls))
n_ind <- length(rownames(data))

alpha <- 0.05
bonf_corr <- alpha/length(colnames(data[,-1*length(colnames(data))]))

start <- proc.time()

for (each in colnames(data[,-1*length(colnames(data))])){
    pos <- sum(cases[each])/(2*n_cases)
    neg <- sum(controls[each])/(2*n_controls)
    prob <- (pos+neg)/2
    if(prob == 0){
        #implies pos and neg are 0, so null hypothesis is true
        A <- c(A,paste(c(each,1.0),collapse=":"))
    }
    else {
        test_stat <- (pos - neg)/(sqrt(2/n_ind)*sqrt(prob*(1-prob)))
        p_val <- 2*pnorm(abs(test_stat),lower.tail = FALSE) #two-tail
        A <- c(A,paste(c(each,p_val),collapse=":"))
    }
    if (p_val < bonf_corr){
        B <- c(B,each)
    }
}
A <- c(A,"</A>")
B <- c(B,"</B>")

output <- file ("output.txt")
writeLines(c(student_info,A,B),output)
close(output)

print (start-proc.time())