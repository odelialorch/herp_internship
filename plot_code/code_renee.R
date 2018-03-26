#load in data
setwd('~/mg_data/renee_csv')

data = read.csv(file = "tree.csv")

Codon = data$Codon
Alpha = data$alpha

#filter out data by prob of neg selection
filtered_data = data[which(data[,6]< 0.7),]

#filter out data by prob of pos selection
filtered_data2 = filtered_data[which(filtered_data[,5]< 0.7),]

Codon = filtered_data2$Codon
Alpha = filtered_data2$alpha

#plot filtered data
plot(Codon,Alpha, xlab = "Distance from Control Region", ylab = "Synonymous Substitution Rate")
