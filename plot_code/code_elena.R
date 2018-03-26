setwd("~/mg_data/elena_csv")

foutfinal <- read.csv(file = "foutfinal.csv")

x = foutfinal[,1]
y = foutfinal[,2]

plot(x,y)

foutfinal <- foutfinal[which(foutfinal[,6]<0.9),]
fmut <- foutfinal[which(foutfinal[,5]<0.9),]

plot(fmut[,1], fmut[,2], xlab = "Distance from Control Region", ylab = "Synonymous Substitution Rate")

cor.test(fmut[,1], fmut[,2])

library(BayesianFirstAid)
fit<-bayes.cor.test(fmut[,1],fmut[,2])
plot(fit)