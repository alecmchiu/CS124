Imputation
=====

##Background

A large problem in bioinformatics is the inability to get complete data. As a data driven field, this creates many problems. In the prominent sequencing data aspect of bioinformatics, we often find difficulties in generating genotypes of individuals for a variety of reasons. Sequencing machines have error. Certain parts of the genome such as areas near centromeres are hard to sequence. We can fill these gaps through imputation, the idea of being able to infer missing data. While this is a very pertinent concept in bioinformatics, it is truly a question of any data driven field.

##Contents
+ imputation.R - Old baseline imputation script (ignore)
+ baseline.R - Completed baseline mean imputation script
+ hole_generator.R - Missing data generator
+ similarity.R - Similarity approach to imputation
+ regression.R - Multinomial logistic regression approach
+ sico.R - Combined similarity + regression (SiCo - SImiliarty-COrrelation)

##Baseline Method

The baseline method for this project is mean imputation. This is the idea of using the mean for each SNP, excluding missing values. For instance, if the mean for SNP A is 1, we will fill in all missing values for SNP A in the data set with a value of 1.

##Improved Method

The improved method for this project is a combination of the column similarity approach and multinomial logistic regression. First, the column similarity approach is applied. This is a method that compares each column and tries to find the two most similar columns. Imputed values are simply copied from the most similar column. The multinomial logistic regression method is applied after the similarity approach. This builds a regression model for the missing values and fills them in through this method.

The column similarity approach is used to capture low correlation SNP's. By capturing the most similar columns, we capture many SNP's that may have low correlation.

The multinomial logistic regression method here uses high correlation. We first create a correlation matrix for each pair of SNP's. Then, we filter this matrix for high correlation SNP pairs (abs(r) >= 0.9). Regressions are run using these SNP's. The purpose of this approach is to capture highly correlated SNP's that may have been overlooked due the column similarity approach.

##Benchmarks

#F1 Score

F1 score is a measure of precision and recall. We see an overall increase in F1 score for the improved method over the baseline method. F1 score drops as the number of SNP's to impute increases.

#Complexity & Wall Time

The complexity of baseline method is O(n) where n is the number of missing data values. This is reflected in wall time measurements. The improved method has a complexity of O(s<sup>2</sup>) where s is the number of SNP's in the data set. This arises from creating the pair-wise correlation matrix.

#Implications & Improvements

There are many areas of improvement in this algorithm. One of the simplest improvements that can be made is to port the algorithm to a faster language. R is known to slow down when faced with larger datasets. Perhaps moving the algorithm to Python and the pandas package would improve the speed of this algorithm, even if by simply introducint multithreading.

There is also a complication regarding the number of completed cases. Both the similarity approach and the multinomial logistic regression heavily rely on the number of completed cases. In the case of missing completely at random (MCAR) data, this poses a problem as there may be no completed cases in the data set. Systematic randomness heavily impacts the multinomial logistic regression as without many complete cases, very incorrect regression models may be made.

##Concluding Remarks

Ultimately, imputation is not an easy process to do with high accuracy. Many methods exists, but ultimately you are guessing and inferring what the data may be. That being said, even crude methods such as mean or mode imputation can get a large chunk of data correct in certain scenarios such as a ternary system for genotypes.

For my method specifically, there is much improvement to made, particularly in the regression model. Due to systematic bias in the data, a regression approach may not be the best even when there is high correlation as this high correlation may be due to the bias are we are trying to fix.

##Progress Log

+ 5/13 - First commit on project
+ 5/20 - Baseline method near completion
+ 5/23 - Data/hole generator near completion
+ 6/5 - Added systematic missingness to data generator, completed baseline, start of similarity approach
+ 6/6 - Completion of similarity approach, comparison of mean and mode imputation for baseline
+ 6/7 - Tweaks to similarity approach
+ 6/9 - Implemented multinomial regression approach, combined similarity and regression approach

Project 'completed' on 6/9/16.
