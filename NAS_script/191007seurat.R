##geneCounts, Exon contents filtered

resd3<-read.csv(file = '/media/desktop-bi-16/92E3-5E93/191001/191001PBMC_SMCfiltered.csv',row.names=1, sep = ",", header=T)

sobj1<-CreateSeuratObject(resd3, min.cells = 3, min.features = 200, project = "CMC")
sobj1[["percent.mt"]] <- PercentageFeatureSet(sobj1, pattern = "^MT-")

png(filename="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/Analysis/191007/plot/vilolin1.png",width = 800, height=600)
VlnPlot(sobj1, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
dev.off()

sobj1 <- FindVariableFeatures(sobj1, selection.method = "vst", nfeatures = 2000)

top2000<-head(VariableFeatures(sobj1),2000)
write.csv(as.data.frame(top2000), 
          file="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/Analysis/191007/191007top2000.csv")

############################################# 
all.genes <- rownames(sobj1)
sobj1<- ScaleData(sobj1, features = all.genes)         
sobj1 <- RunPCA(sobj1, features = VariableFeatures(object = sobj1), npcs = 5)


sobj1 <- FindNeighbors(sobj1, dims = 1:5)
sobj1 <- FindClusters(sobj1, resolution = 0.5)

sobj1 <- RunUMAP(sobj1, dims = 1:5)

png(filename="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/Analysis/191007/plot/PCAUMAP1.png",width = 800, height=600)
DimPlot(sobj1, reduction = "umap")
dev.off()

write.csv(as.data.frame(sobj1@meta.data), 
          file="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/Analysis/191007/191007umap1.csv")

############################################
sobj2 <- RunPCA(sobj1, features = VariableFeatures(object = sobj1), npcs = 6)


sobj2 <- FindNeighbors(sobj2, dims = 1:6)
sobj2 <- FindClusters(sobj2, resolution = 0.5)

sobj2 <- RunUMAP(sobj2, dims = 1:6)

png(filename="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/Analysis/191007/plot/PCAUMAP2.png",width = 800, height=600)
DimPlot(sobj2, reduction = "umap")
dev.off()

write.csv(as.data.frame(sobj2@meta.data), 
          file="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/Analysis/191007/191007umap2.csv")


############################################
#> length(colnames(resd3))
#[1] 48

library(Seurat)
resd3<-read.csv(file = '/media/desktop-bi-16/92E3-5E93/191001/191001PBMC_SMCfiltered.csv',row.names=1, sep = ",", header=T)



sobj1<-CreateSeuratObject(resd3, min.cells = 3, min.features = 200, project = "CMC")
sobj1[["percent.mt"]] <- PercentageFeatureSet(sobj1, pattern = "^MT-")
sobj1 <- FindVariableFeatures(sobj1, selection.method = "vst", nfeatures = 2000)
all.genes <- rownames(sobj1)
sobj1<- ScaleData(sobj1, features = all.genes)      


sobj2 <- RunPCA(sobj1, features = VariableFeatures(object = sobj1), npcs = 4)


sobj2 <- FindNeighbors(sobj2, dims = 1:4)
sobj2 <- FindClusters(sobj2, resolution = 0.5)

sobj2 <- RunUMAP(sobj2, dims = 1:4)

png(filename="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/Analysis/191007/plot/PCAUMAP4_K4.png",width = 800, height=600)
DimPlot(sobj2, reduction = "umap")
dev.off()

write.csv(as.data.frame(sobj2@meta.data), 
          file="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/Analysis/191007/191007umap4_K4.csv")

##################
png(filename="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/Analysis/191007/plot/PCAgene.png",width = 1000, height=600)
VizDimLoadings(sobj2, dims = 1:2, reduction = "pca")
dev.off()
