#=============================================
##salmon import
#=============================================

df1<-read.table("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/gtfgtmod2.txt")
names(df1)<-c("chr", "TXNAME", "GENEID")
tx2gene <-df1[,c(3,2)]

setwd("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon")
dir <- system.file("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon", package = "tximportData")
list.files(dir)
#system.file(..., package = "base", lib.loc = NULL,mustWork = FALSE)
dir<-"/media/desktop-bi-16/D2C67EE7C67ECAED/BI/"
#samples=c("2-BY1-1","2-BY2-1","CMC-013_40")
samples=c("CMC-011_35", "2-BY1-1", "2-BY2-1", "CMC-011_08", "CMC-011_11", "CMC-011_13", "CMC-011_18", "CMC-011_19", "CMC-011_21", "CMC-011_22", "CMC-011_23", "CMC-011_24", "CMC-011_27", "CMC-011_28", "CMC-011_29", "CMC-011_31", "CMC-011_33", "CMC-011_34", "CMC-011_37", "CMC-011_38", "CMC-011_40", "CMC-011_41", "CMC-011_45", "CMC-011_46", "CMC-011_47", "CMC-011_49", "CMC-011_55", "CMC-011_57", "CMC-011_58", "CMC-011_59", "CMC-011_60", "CMC-011_67", "CMC-011_76", "CMC-011_77", "CMC-013_40")
files <- file.path(dir, "07salmon", samples, "quant.sf")
names(files)<-samples
#names(files) <- paste0("sample", 1:6)
all(file.exists(files))

library(tximport)
txi<-tximport(files,type = "salmon", tx2gene = tx2gene)
names(txi)
head(txi$counts)
#write.csv(as.data.frame(txi$counts), 
          file="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/results/sclc_CMC_salmonCounts.csv")
          
write.csv(as.data.frame(txi$counts), 
          file="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/results/190916_CMC1113_salmonCounts.csv")

cmc.data <-CreateSeuratObject(txi$counts, min.cells = 3, min.features = 200, project = "CMC")

## transcript level
txi.tx <- tximport(files, type = "salmon", txOut = TRUE)
txi.sum <- summarizeToGene(txi.tx, tx2gene)
all.equal(txi$counts, txi.sum$counts)



library(DESeq2)

sampleTable <- data.frame(condition = factor(c("SCLC","SCLC", "CMC")))
rownames(sampleTable) <- colnames(txi$counts)

dds <- DESeq(dds)
res <- results(dds)

Plot dispersions:

plotDispEsts(dds, main="Dispersion plot")

For clustering and heatmaps, we need to log transform our data:

rld <- rlogTransformation(dds)
head(assay(rld))


library(RColorBrewer)
library(gplots)

mycols <- brewer.pal(8, "Dark2")[1:length(unique(sampleTable$condition))]
sampleDists <- as.matrix(dist(t(assay(rld))))
heatmap.2(as.matrix(sampleDists), key=F, trace="none",
          col=colorpanel(100, "black", "white"),
          ColSideColors=mycols[sampleTable$condition],
          RowSideColors=mycols[sampleTable$condition],
          margin=c(10, 10), main="Sample Distance Matrix")
          
table(res$padj<0.05)
res <- res[order(res$padj), ]
resdata <- merge(as.data.frame(res), as.data.frame(counts(dds, normalized=TRUE)), by="row.names", sort=FALSE)
names(resdata)[1] <- "Gene"
head(resdata)

hist(res$pvalue, breaks=50, col="grey")
DESeq2::plotMA(dds, ylim=c(-1,1), cex=1)

# Volcano plot
with(res, plot(log2FoldChange, -log10(pvalue), pch=20, main="Volcano plot", xlim=c(-2.5,2)))
with(subset(res, padj<.05 ), points(log2FoldChange, -log10(pvalue), pch=20, col="red"))

plotMA(res, ylim=c(-2,2))
resLFC <- lfcShrink(dds, coef="condition_SCLC_vs_CMC", type="apeglm")
plotMA(resLFC, ylim=c(-2,2))

#결과 저장
resOrdered <- res[order(res$pvalue),]

write.csv(as.data.frame(resOrdered), 
          file="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/08deseq/sclc_CMC_results.csv")
          
resSig <- subset(resOrdered, padj < 0.1)

ddsMF <- dds

vsd <- vst(dds, blind=FALSE)
rld <- rlog(dds, blind=FALSE)
head(assay(vsd), 3)

# this gives log2(n + 1)
ntd <- normTransform(dds)
BiocManager::install("vsn")
BiocManager::install("hexbin")
library("vsn")
meanSdPlot(assay(ntd))

BiocManager::install("ReportingTools")
BiocManager::install("scater")

> meanSdPlot(assay(ntd))
> meanSdPlot(assay(vsd))
> meanSdPlot(assay(rld))

BiocManager::install("pheatmap")
library("pheatmap")
select <- order(rowMeans(counts(dds,normalized=TRUE)),
                decreasing=TRUE)[1:20]
# df <- as.data.frame(colData(dds)[,c("condition","type")])
df <- as.data.frame(colData(dds)[,c("condition")])
pheatmap(assay(ntd)[select,], cluster_rows=FALSE, show_rownames=FALSE,
         cluster_cols=FALSE, annotation_col=df)
         
plotPCA(vsd, intgroup=c("condition"))

ddsCustom <- dds
useForMedian <- mcols(ddsCustom)$dispGeneEst > 1e-7
medianDisp <- median(mcols(ddsCustom)$dispGeneEst[useForMedian],
                     na.rm=TRUE)
dispersionFunction(ddsCustom) <- function(mu) medianDisp
ddsCustom <- estimateDispersionsMAP(ddsCustom)

metadata(res)$alpha
metadata(res)$filterThreshold

png(filename="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/08deseq/plot/noRejection190910.png",width = 800, height=600)
plot(metadata(res)$filterNumRej, 
     type="b", ylab="number of rejections",
     xlab="quantiles of filter")
lines(metadata(res)$lo.fit, col="red")
abline(v=metadata(res)$filterTheta)

dev.off()
####################################################
png(filename="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/08deseq/plot/log2fchTest190910.png",width = 800, height=600)

#test log2 fold change
par(mfrow=c(2,2),mar=c(2,2,1,1))
ylim <- c(-2.5,2.5)
resGA <- results(dds, lfcThreshold=.5, altHypothesis="greaterAbs")
resLA <- results(dds, lfcThreshold=.5, altHypothesis="lessAbs")
resG <- results(dds, lfcThreshold=.5, altHypothesis="greater")
resL <- results(dds, lfcThreshold=.5, altHypothesis="less")
drawLines <- function() abline(h=c(-.5,.5),col="dodgerblue",lwd=2)
plotMA(resGA, ylim=ylim); drawLines()
plotMA(resLA, ylim=ylim); drawLines()
plotMA(resG, ylim=ylim); drawLines()
plotMA(resL, ylim=ylim); drawLines()

dev.off()

normFactors <- normFactors / exp(rowMeans(log(normFactors)))
#Count outlier detection
png(filename="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/08deseq/plot/countout190910.png",width = 800, height=600)

W <- res$stat
maxCooks <- apply(assays(dds)[["cooks"]],1,max)
idx <- !is.na(W)
plot(rank(W[idx]), maxCooks[idx], xlab="rank of Wald statistic", 
     ylab="maximum Cook's distance per gene",
     ylim=c(0,5), cex=.4, col=rgb(0,0,0,.3))
m <- ncol(dds)
p <- 3
abline(h=qf(.99, p, m - p))

dev.off()

#plot the −log10 p values from all genes over the normalized mean counts:
png(filename="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/08deseq/plot/countout190910.png",width = 800, height=600)
plot(res$baseMean+1, -log10(res$pvalue),
     log="x", xlab="mean of normalized counts",
     ylab=expression(-log[10](pvalue)),
     ylim=c(0,30),
     cex=.4, col=rgb(0,0,0,.3))
dev.off()
###Histogram of p values for all tests. The area shaded in blue indicates the subset of those that pass the filtering, the area in khaki those that do not pass:
png(filename="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/08deseq/plot/pvalHist190910.png",width = 800, height=600)
use <- res$baseMean > metadata(res)$filterThreshold
h1 <- hist(res$pvalue[!use], breaks=0:50/50, plot=FALSE)
h2 <- hist(res$pvalue[use], breaks=0:50/50, plot=FALSE)
colori <- c(`do not pass`="khaki", `pass`="powderblue")

barplot(height = rbind(h1$counts, h2$counts), beside = FALSE,
        col = colori, space = 0, main = "", ylab="frequency")
text(x = c(0, length(h1$counts)), y = 0, label = paste(c(0,1)),
     adj = c(0.5,1.7), xpd=NA)
legend("topright", fill=rev(colori), legend=rev(names(colori)))
dev.off()


# Why after VST are there still batches in the PCA plot?
png(filename="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/08deseq/plot/vsdBatch190910.png",width = 800, height=600)
mat <- assay(vsd)
mat <- limma::removeBatchEffect(mat, vsd$batch)
assay(vsd) <- mat
plotPCA(vsd)
####################################################


/media/desktop-bi-16/D2C67EE7C67ECAED/BI/08deseq/plot

##kallisto import
#=============================================
