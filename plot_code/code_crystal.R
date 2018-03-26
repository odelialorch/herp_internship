library(visreg)
library(BayesianFirstAid)
setwd('~/mg_data')

data = read.csv(file = "MimophisWTree.csv", header=TRUE,sep = ",")
x = data$Codon
y = data$alpha

plot(x,y, main = "Unfiltered Mimophis Genome", xlab = "Codon",ylab = "Alpha")
abline(lm(y~x), col = "blue")

#Filtering 

filtered_positive_selection_data = data[which(data[,5]< 0.7),]
a = filtered_positive_selection_data$Codon #Codon
b = filtered_positive_selection_data$alpha #alpha
plot(a,b, main="Mimophis Filtered Positive Selection 0.7", xlab = "Codon", ylab = "Alpha")
abline(lm(b~a), col = "blue")

data = filtered_positive_selection_data

filtered_negative_selection_data = data[which(data[,6]< 0.7),]
a = filtered_negative_selection_data$Codon #Codon
b = filtered_negative_selection_data$alpha #alpha
plot(a,b, xlab = "Distance from Control Region", ylab = "Synonymous Substitution Rate")
abline(lm(b~a), col = "green")

data = filtered_negative_selection_data
a = data$Codon
b = data$alpha

#Bayesian correlation test
fit<-bayes.cor.test(a,b)
#bayesian plot
plot(fit)



#circles code
library(circlize)

mutrat1 <- read.csv(file = "Mimophis_NO_ND56.csv")
data = data.frame(
  factor = 1,
  x = mutrat1[,1], 
  y = mutrat1[,2]
)
circos.par("track.height" = 0.4)
circos.initialize(factors = data$factor, x = data$x )

circos.trackPlotRegion(factors = data$factor, y=data$y, panel.fun = function(x, y) {
  circos.axis(labels.cex=0.5, labels.font=1, lwd=0.8, h="bottom", direction="inside")
})

circos.trackPoints(data$factor, data$x, data$y, col = rgb(0.1,0.5,0.8,0.3), pch=20)


