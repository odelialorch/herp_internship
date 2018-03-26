library(visreg)
library(BayesianFirstAid)


# read in CSV file
setwd("~/mg_data/pseudoxy_tree")
x1<-read.csv("pseudoxy.csv")


# filter data
tolerance = 0.90 # lower tolerance means fewer points plotted
x1<-x1[which(x1[,7]<tolerance),] # filter negative selection
x1<-x1[which(x1[,6]<tolerance),] # filter positive selection


# plot & linear regression
plot(x1[,1], x1[,3], xlab="Distance from CR1 (codons)", ylab="Synonymous substitution rate")
line1<-lm(x1[,3]~x1[,1])
abline(line1,col="red")


# bayesian correlation test
fit1<-bayes.cor.test(x1[,1],x1[,3])
plot(fit1)
