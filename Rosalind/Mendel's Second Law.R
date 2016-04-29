#Mendel's Second Law

#k generations
k <- 6

#N organisms threshold
N <- 16

#k-th generation individuals
num <- 2**k

probs <- matrix(c(0.5,0.5,0,0.25,0.5,0.25,0,0.5,0.5),nrow=3,ncol=3,byrow=TRUE)
names <- c('++','+-','--')

colnames(probs) <- names
rownames(probs) <- names

generations <- matrix(data = 0, nrow = k+1, ncol = 3)
colnames(generations) <- names
rownames(generations) <- 0:k
generations['0','+-'] <- 1

for (i in seq_len(k)){
    prev <- generations[toString(i-1),]
    dominant <- prev[1]*probs['++','++']+prev[2]*probs['+-','++']+prev[3]*probs['--','++']
    homozygous <- prev[1]*probs['++','+-'] + prev[2]*probs['+-','+-'] + prev[3]*probs['--','+-']
    recessive <- prev[1]*probs['++','--'] + prev[2]*probs['+-','--'] + prev[3]*probs['--','--']
    generations[toString(i),] <- c(dominant,homozygous,recessive)
}

final_prob <- sum(dbinom(N:num,num,generations[toString(k),'+-']**2))

print (final_prob)