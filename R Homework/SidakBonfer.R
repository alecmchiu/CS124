#Sidak vs Bonferonni Corection
#difference: Sidak - Bonferroni
alpha = 0.05
for (i in seq_len(1000)){
    print (c(i,(1-(1-alpha)^(1/i)) - (alpha/i)))
}