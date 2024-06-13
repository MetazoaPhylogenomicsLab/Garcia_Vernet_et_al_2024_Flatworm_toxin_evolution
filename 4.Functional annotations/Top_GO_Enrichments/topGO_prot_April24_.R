
BiocManager::install("topGO")
library(topGO)
library(DBI)

setwd("PATH/")

geneID2GO <- readMappings(file="gopredsim_SPECIES_rklon_prott5_1_all_noiso_PROT.txt")
str(head(geneID2GO))


geneNames <- names(geneID2GO)
head(geneNames)

geneIds <- readLines("SET_INTEREST.txt")
myInterestingGenes <- as.character(geneIds)
geneList <- factor(as.integer(geneNames %in% myInterestingGenes))
str(geneList)
names(geneList) <- geneNames
str(geneList)

GOdata_BP <- new("topGOdata", ontology = "BP", allGenes = geneList, annot = annFUN.gene2GO, gene2GO = geneID2GO)
GOdata_BP
GOdata_MF <- new("topGOdata", ontology = "MF", allGenes = geneList, annot = annFUN.gene2GO, gene2GO = geneID2GO)
GOdata_MF
GOdata_CC <- new("topGOdata", ontology = "CC", allGenes = geneList, annot = annFUN.gene2GO, gene2GO = geneID2GO)
GOdata_CC

resultFis_BP <- runTest(GOdata_BP, algorithm = "elim", statistic = "fisher")
resultFis_BP
resultFis_MF <- runTest(GOdata_MF, algorithm = "elim", statistic = "fisher")
resultFis_MF
resultFis_CC <- runTest(GOdata_CC, algorithm = "elim", statistic = "fisher")
resultFis_CC

head(score(resultFis_BP))
head(score(resultFis_MF))
head(score(resultFis_CC))

allRes_BP <-GenTable(GOdata_BP, p.value = resultFis_BP, topNodes=50)
allRes_MF <-GenTable(GOdata_MF, p.value = resultFis_MF, topNodes=20)
allRes_CC <-GenTable(GOdata_CC, p.value = resultFis_CC, topNodes=20)

#showSigOfNodes(GOdata, score(resultFis2), firstSigNodes = 5, useInfo = 'all')

#allRes_BP$p.value <- gsub("< 1e-30", "1e-31", allRes_BP$p.value)
allRes_BP$p.value <- as.numeric(allRes_BP$p.value)
goEnrichment_BP <- allRes_BP[allRes_BP$p.value<0.01,]
write.table(goEnrichment_BP, file = "RESULTS_BP.txt", sep = "\t", row.names = FALSE)
goEnrichment_BP <- goEnrichment_BP[,c("GO.ID","Term","p.value")]
goEnrichment_BP

allRes_MF$p.value <- as.numeric(allRes_MF$p.value)
goEnrichment_MF <- allRes_MF[allRes_MF$p.value<0.01,]
write.table(goEnrichment_MF, file = "RESULTS_MF.txt", sep = "\t", row.names = FALSE)
goEnrichment_MF <- goEnrichment_MF[,c("GO.ID","Term","p.value")]
goEnrichment_MF

allRes_CC$p.value <- as.numeric(allRes_CC$p.value)
goEnrichment_CC <- allRes_CC[allRes_CC$p.value<0.01,]
write.table(goEnrichment_CC, file = "RESULTS_CC.txt", sep = "\t", row.names = FALSE)
goEnrichment_CC <- goEnrichment_CC[,c("GO.ID","Term","p.value")]
goEnrichment_CC

