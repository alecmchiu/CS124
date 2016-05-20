Imputation
=====

##Background

A large problem in bioinformatics is the inability to get perfect data. As a data driven field, this creates many problems. In the vast sequencing data aspect of bioinformatics, we often find difficulties in generating genotypes of individuals for a variety of reasons. Sequencing machines have error. Certain parts of the genome such as areas near centromeres are hard to sequence. We can fill these gaps through imputation, the idea of being able to infer missing data. While this is a very pertinent concept in bioinformatics, it is truly a questin of any data driven field.

##Contents
+ imputation.R - Baseline imputation script
+ hole_generator.R - missing data generator

##Baseline Method

The baseline method for this project will be mean imputation. This is the idea of using the mean from the training data set as the value that will fill in the missing wholes of the test data set. For instance, if the mean for SNP A is 1, we will fill in all missing values for SNP A in the test data set with a value of 1.

##Improved Method

##Benchmarks

##Concluding Remarks
