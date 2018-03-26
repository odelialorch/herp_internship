library(ape)

setwd("~/Dropbox/AMNH/mtDNA_evol/trees")
tree <- read.tree("dated_tree732")
#rownames(tree) <- tree$species

alltips <- tree$tip.label

goodtips <- c("Alluaudina_bellyi_RAN43680_seq1", "Compsophis_zeny_RAN44452_seq1", "Compsophis_laphystius_RAN39677_seq1", "Duberria_lutrix_PEM908_seq1", "Heteroliodon_lava_RAX12518_seq1", "Heteroliodon_lava_cf_AMNH176448_seq1", "Hormonotus_modestus_AMCC117585_seq1", "Ithycyphus_miniatus_RAN39321_seq1", "Leioheterodon_madagascariensis_A_RAN39463_seq1", "Liophidium_chabaudi_MVZ238844_seq1", "Liophidium_trilineatum_RAX8290_seq1", "Liopholidophis_dimorphus_RAN38118_seq1", "Liopholidophis_dolicocercus_RAN39094_seq1", "Liopholidophis_grandidieri_FMNH259989_seq1", "Lycodryas_guentheri_RAN34638_seq1", "Lycodryas_granuliceps_RAN39443_seq1", "Lycodryas_capuroni_RAN38973_seq1", "Lycodryas_gaimardi_RAX7574_seq1", "Lycodryas_gaimardi_JEC14279_seq1", "Lycodryas_pseudogranuliceps_RAN68841_seq1", "Madagascarophis_lolo_RAX12626_seq1", "Madagascarophis_ocellatus_RAN48383_seq1", "Madagascarophis_ocellatus_RAX13800_seq1", "Madagascarophis_meridionalis_MVZ238848_seq1", "Mehelya_guirali_AMCC117661_seq1", "Micropisthodon_ochraceus_B_JEC17332_seq1", "Naja_melanoleuca_AMCC106869_seq1", "Parastenophis_betsileanus_B_JEC15838_seq1", "Pareas_hamptoni_AMCC106642_seq1", "Phisalixella_arctifasciata_RAN42677_seq1", "Phisalixella_tulearensis_RAX00123_seq1", "Phisalixella_variabilis_RAN41925_seq1", "Pseudoxyrhopus_microps_cf_RAN38707_seq1", "Pseudoxyrhopus_analabe_RAX3486_seq1", "Pseudoxyrhopus_sp_B_FMNH259987_seq1", "Pseudoxyrhopus_oblectator_RAX12786_seq1", "Thamnosophis_mavotenda_RAN51171_seq1", "Thamnosophis_stumpfii_RAN39332_seq1", "Thamnosophis_martae_RAN38970_seq1") 
#tips we need - make a list

badtips <- setdiff(alltips, goodtips) #tips we don't need - make a list by iterating through all the names and adding the ones that aren't in 

newtree <- drop.tip(tree, badtips)
newtree$tip.label
plot.phylo(newtree, cex=0.2)
