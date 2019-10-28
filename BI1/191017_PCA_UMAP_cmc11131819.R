library(Seurat)
library(stringr)
resd1<-read.csv(file = '/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/04cmcpbmc/results/191016CMC011013018019_ENSG.csv',row.names=1, sep = ",", header=T)
colnames(resd1)<-str_replace_all(colnames(resd1),"CMC.018.","CMC.018_")
colnames(resd1)<-str_replace_all(colnames(resd1),"CMC.019.","CMC.019_")


cmc6<-subset(cmc6, subset = nFeature_RNA > 800)


cmc3 <-CreateSeuratObject(resd1, min.cells = 3, min.features = 200, project = "CMC")
cmc3[["percent.mt"]] <- PercentageFeatureSet(cmc3, pattern = "^MT-")

#### scale factor 1000 to 500 not good
scaleFactor=1000
dimN=6
#resolution low effect
res=0.5
resN=res*10

cmc6 <- NormalizeData(cmc3, normalization.method = "LogNormalize", scale.factor = scaleFactor)
cmc6<-subset(cmc6, subset = nFeature_RNA > 800)
cmc6 <- FindVariableFeatures(cmc6, selection.method = "vst")
all.genes <- rownames(cmc6)
cmc6 <- ScaleData(cmc6, features = all.genes)


cmc6 <- RunPCA(cmc6, features = VariableFeatures(object = cmc6), npcs = dimN)


cmc6 <- FindNeighbors(cmc6, dims = 1:dimN)
cmc6 <- FindClusters(cmc6, resolution = res)

cmc6 <- RunUMAP(cmc6, dims = 1:dimN)

pngF=sprintf("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/04cmcpbmc/results/PCAUMAPtotals%s_1_%s_0%s.png",scaleFactor,dimN,resN)
csvF=sprintf("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/04cmcpbmc/results/191017metaUMAP%s_1_%s.csv",scaleFactor,dimN)

png(filename=pngF,width = 400, height=300)
DimPlot(cmc6, reduction = "umap", label = TRUE)
dev.off()

write.csv(as.data.frame(cmc6@meta.data), 
          file=csvF)

##change order of sample
df1 <- read.table("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/04cmcpbmc/results/191016CMCPBMC_salmonTPM.csv")
df1 <- df1[c(10,1,2,3,4,5,6,7,8,9)]

