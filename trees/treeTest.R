install.packages('ctv')
library('ctv') 
install.views('Phylogenetics')
update.views('Phylogenetics')
library(ape)
library(phytools)
tree <- read.tree(file.choose())
rownames(tree) <- tree$species

write.tree(tree, file="Ultrametric_Tree_130")
plot(tree)
# dtips <- sample(tree$tip.label)
# dt <- drop.tip(tree, tree$tip.label[])
# plotTree(dt)
