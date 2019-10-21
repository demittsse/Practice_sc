library(RColorBrewer)
library(ggplot2)
library(dplyr)

ctcf="/home/cytogen-bi2/analysis/04.191004SelectGene2nd/CTC_Expression.txt"
tissuef="/home/cytogen-bi2/analysis/04.191004SelectGene2nd/Tissue_CHOL.txt"
idhf="/home/cytogen-bi2/analysis/04.191004SelectGene2nd/IDH_Tcell.txt"
mesenf="/home/cytogen-bi2/analysis/05.191007SelectGene3rd/191007res_mesen_label.txt"
sh5f="/home/cytogen-bi2/analysis/05.191007SelectGene3rd/191007res5_label2.txt"
cancer1="/home/cytogen-bi2/analysis/05.191007SelectGene3rd/191007rescancer_labelmod.txt"
BTcell1="/home/cytogen-bi2/analysis/05.191007SelectGene3rd/191007resBTcell_label.txt"
cholf="/home/cytogen-bi2/analysis/05.191007SelectGene3rd/191007reschol_label.txt"
supf="/home/cytogen-bi2/analysis/05.191007SelectGene3rd/191007ressup_label.txt"
insilf="/home/cytogen-bi2/analysis/05.191007SelectGene3rd/191008insil_labelminusHLA.txt"
totalf="/home/cytogen-bi2/analysis/191002/191001filteredRPSMT_INMT.txt"



#df7<-read.table(totalf, header = T, row.names = 1)
df7<-read.table(insilf, header = T, row.names = 2)
names(df7)[names(df7) == "CMC.011_340"] <- c("CMC.013_40") 
#df7rem2=subset(df7, select=-c(CMC.011_08,CMC.011_11,CMC.011_13,CMC.011_19,CMC.011_22,CMC.011_27,CMC.011_28,CMC.011_31,CMC.011_34,CMC.011_41,CMC.011_58,CMC.011_59,CMC.011_67,CMC.011_77))

write.csv(df7,file="/home/cytogen-bi2/analysis/CMCfiltered191008plus.csv")

df7rem2=df7rem2[,c(3:36)]


data5=as.matrix(df7rem2)
data5=log2(data5)
data5[data5 == -Inf]<-0

png(filename="/home/cytogen-bi2/analysis/05.191007SelectGene3rd/insillog.png",width = 1200, height=1100)
heatmap(data5, scale="column",col=colorRampPalette(brewer.pal(8, "Blues"))(25))
dev.off()


#coul <- colorRampPalette(brewer.pal(8, "PiYG"))(25)
coul <- colorRampPalette(brewer.pal(11,"RdBu"))(25)
heatmap(df, scale="column", col = coul, dendrogram='none', Rowv=FALSE)
dev.off()

heatmap(data5, scale="column",col= colorRampPalette(brewer.pal(8, "Blues"))(25))





 require(graphics); require(grDevices)
     x  <- as.matrix(mtcars)
     rc <- rainbow(nrow(x), start = 0, end = .3)
     cc <- rainbow(ncol(x), start = 0, end = .3)
     hv <- heatmap(x, col = cm.colors(256), scale = "column",
                   RowSideColors = rc, ColSideColors = cc, margins = c(5,10),
                   xlab = "specification variables", ylab =  "Car Models",
                   main = "heatmap(<Mtcars data>, ..., scale = \"column\")")
     utils::str(hv) # the two re-ordering index vectors
     
     ## no column dendrogram (nor reordering) at all:
     heatmap(x, Colv = NA, col = cm.colors(256), scale = "column",
             RowSideColors = rc, margins = c(5,10),
             xlab = "specification variables", ylab =  "Car Models",
             main = "heatmap(<Mtcars data>, ..., scale = \"column\")")
     
     ## "no nothing"
     heatmap(x, Rowv = NA, Colv = NA, scale = "column",
             main = "heatmap(*, NA, NA) ~= image(t(x))")
     
     
     round(Ca <- cor(attitude), 2)
     symnum(Ca) # simple graphic
     heatmap(Ca,               symm = TRUE, margins = c(6,6)) # with reorder()
     heatmap(Ca, Rowv = FALSE, symm = TRUE, margins = c(6,6)) # _NO_ reorder()
     ## slightly artificial with color bar, without and with ordering:
     cc <- rainbow(nrow(Ca))
     heatmap(Ca, Rowv = FALSE, symm = TRUE, RowSideColors = cc, ColSideColors = cc,
             margins = c(6,6))
     heatmap(Ca,             symm = TRUE, RowSideColors = cc, ColSideColors = cc,
             margins = c(6,6))
     
     ## For variable clustering, rather use distance based on cor():
     symnum( cU <- cor(USJudgeRatings) )
     
     hU <- heatmap(cU, Rowv = FALSE, symm = TRUE, col = topo.colors(16),
                  distfun = function(c) as.dist(1 - c), keep.dendro = TRUE)
     ## The Correlation matrix with same reordering:
     round(100 * cU[hU[[1]], hU[[2]]])
     ## The column dendrogram:
     utils::str(hU$Colv)
     





