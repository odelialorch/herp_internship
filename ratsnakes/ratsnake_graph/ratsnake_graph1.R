setwd("/Users/olorch/herp_interns/ratsnake_graph")
MyData <- read.csv(file="fubar_result.csv", header=TRUE, sep=",")
x = MyData$distance
y = MyData$alpha
plot(x,y)
cor(x,y)
abline(lm(y~x), col="red")

which(MyData$Posterior.Prob.Positive.Selection<0.5)
#positive selection -> selection of the more advantageous gene

filtereddata = MyData[which(MyData[,6]<0.5),]
#negative selction -> removal of the more harmful gene

plot(filtereddata$distance, filtereddata$alpha)

cor(filtereddata$distance, filtereddata$alpha)
abline(lm(filtereddata$alpha~filtereddata$distance), col="red")