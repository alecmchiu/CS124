#Homework 2
#Alec Chiu
#SID: 904-175-341

##Problem 1A

#parameters
ind <- c(500,1000)
risks <- c(1.5,2.0,3.0)
freq <- c(0.05,0.2,0.4)

#generate blank matricies for both sets of individuals
n500 <- matrix(rep(0,9),nrow=3,ncol=3,dimnames=list(risks,freq))
n1000 <- matrix(rep(0,9),nrow=3,ncol=3,dimnames=list(risks,freq))

for (n in ind){
    for (each in risks){
        for (prob in freq){
            pos <- (each*prob)/(((each-1)*prob)+1) #calculate p+
            neg <- prob #low relative risk so p- = p
            avg = (pos + neg)/2
            
            #ncp calculation
            non_centr <- (pos-neg)/(sqrt(2/n)*sqrt(avg*(1-avg)))
            
            #assign to matrix
            if (n == 500){
                n500[toString(each),toString(prob)] <- non_centr
            }
            else{
                n1000[toString(each),toString(prob)] <- non_centr
            }
        }
    }
}
cat("500 Individuals")
print(n500)

cat("1000 Individuals")
print(n1000)

##Problem 1B

n500_pow <- matrix(rep(0,9),nrow=3,ncol=3,dimnames=list(risks,freq))
n1000_pow <- matrix(rep(0,9),nrow=3,ncol=3,dimnames=list(risks,freq))

p_val <- 0.05
test_stat <- qnorm(p_val/2,lower.tail=FALSE) #calc test statistic

for (i in seq_len(ncol(n500))){
    for (j in seq_len(nrow(n500))){
        
        #calculate power from upper tail
        n500_pow[i,j] <- pnorm(test_stat,mean = n500[i,j],lower.tail=FALSE)
        n1000_pow[i,j] <- pnorm(test_stat,mean=n1000[i,j],lower.tail=FALSE)
    }
}

cat ("500 Individuals (Power)")
print (n500_pow)
cat ("1000 Individuals (Power)")
print (n1000_pow)

##Problem 1C

n_pow <- matrix(rep(0,9),nrow=3,ncol=3,dimnames=list(risks,freq))

for (each in risks){
    for (prob in freq){
        pos <- (each*prob)/(((each-1)*prob)+1)
        neg <- prob
        avg = (pos + neg)/2
        lamb <- (pos-neg)/(sqrt(2*avg*(1-avg)))
        pow <- -1
        n <- 0
        #calculate power until it is within 79.85%-80.15%
        while (abs(pow - 0.8) >= 0.0015){
            n <- n + 1
            non_centr <- lamb*sqrt(n)
            pow <- pnorm(test_stat, mean = non_centr,lower.tail=FALSE)
        }
        n_pow[toString(each),toString(prob)] <- n
    }
}

cat ("Individuals for ~0.8 Power")
print (n_pow)
