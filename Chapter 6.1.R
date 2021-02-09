# Groups a set of compounds by Tanimoto coefficient.

BiocManager::install("ChemmineR")
library("ChemmineR")
library("gplots")

mdata <- read.csv("Table6.1.csv") #read our table of data

compounds <- pubchemCidToSDF(as.numeric(mdata$CID)) #use the Chemical ID number to retrieve information about our compounds

apset <- sdf2ap(compounds) #convert the information to atom pair

dummy <- cmp.cluster(db=apset, cutoff=0.7, save.distances="distmat.rda", quiet=TRUE) #cluster the data by Tanimoto coefficient. 
load("distmat.rda")
heatmap.2(1-distmat, col=colorpanel(40, "darkblue", "yellow", "white"),  density.info="none", trace="none", 
          cexRow = 0.05 + 1/log10(2*nrow(mdata)), cexCol = 0.05 + 1/log10(2*nrow(mdata)),labCol =  mdata$Name, 
          labRow =  mdata$Name, margins = c(8, 8))

# Notes: I played around with the size of the row and column text and the margins to get the names to work in the heatmap.
# If you want to adjust these try the cexRow, cexCol, and margins sizes.
# If you would like either  the row or column labels to be CID numbers change labCol or labRow to mdata$CID