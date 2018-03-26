from Bio.Nexus import Nexus

gene_list = [open("CO1.nex","r"), open("CO2.nex","r"), open("ATP8.nex","r"), open("ATP6.nex","r"), open("CO3.nex","r"), open("ND3.nex","r"), open("ND4L.nex","r"), open("ND4.nex","r"), open("ND5.nex","r"), open("ND6.nex","r"), open("CytB.nex","r")]
nexi = [(gene.name, Nexus.Nexus(gene)) for gene in gene_list]

combined = Nexus.combine(nexi)
combined.write_nexus_data(filename = "snakegenomes.nex")

