resd1<-read.csv(file = '/media/desktop-bi-16/92E3-5E93/190926cmc_pbmc/190926Seurat_PBMC_SMC_salmon.csv',row.names=1, sep = ",", header=T)
resd1=subset(resd1, select=-c(X2.BY1.1,X2.BY2.1))
subset(cmc3, pattern = "^MT-")
samples1=c("CMC.011_35","CMC.011_08","CMC.011_11","CMC.011_13","CMC.011_18","CMC.011_19","CMC.011_21","CMC.011_23","CMC.011_24","CMC.011_27", "CMC.011_28","CMC.011_29","CMC.011_31","CMC.011_33","CMC.011_34","CMC.011_37","CMC.011_38","CMC.011_40","CMC.011_41","CMC.011_45", "CMC.011_46","CMC.011_47","CMC.011_49","CMC.011_55","CMC.011_57","CMC.011_58","CMC.011_59","CMC.011_67","CMC.011_76","CMC.011_77","CMC.013_40", "CMC.011_22","PBMC3.34","PBMC3.21","PBMC3.46","PBMC3.22","PBMC3.32","PBMC3.49","PBMC3.4","PBMC3.9","PBMC3.15","PBMC3.82","PBMC3.55","PBMC3.80","PBMC3.1","PBMC3.2","PBMC3.14","PBMC3.48")
resd2=subset(resd1, select=samples1)
samples2=c("CMC.011_35","CMC.011_08","CMC.011_11","CMC.011_13","CMC.011_18","CMC.011_19","CMC.011_21","CMC.011_23","CMC.011_24","CMC.011_27", "CMC.011_28","CMC.011_29","CMC.011_31","CMC.011_33","CMC.011_34","CMC.011_37","CMC.011_38","CMC.011_40","CMC.011_41","CMC.011_45", "CMC.011_46","CMC.011_47","CMC.011_49","CMC.011_55","CMC.011_57","CMC.011_58","CMC.011_59","CMC.011_67","CMC.011_76","CMC.011_77","CMC.011_340", "CMC.011_22","PBMC.03_34","PBMC.03_21","PBMC.03_46","PBMC.03_22","PBMC.03_32","PBMC.03_49","PBMC.03_4","PBMC.03_9","PBMC.03_15","PBMC.03_82","PBMC.03_55","PBMC.03_80","PBMC.03_1","PBMC.03_2","PBMC.03_14","PBMC.03_48")
colnames(resd2)=samples2

############################################################
cmc3 <-CreateSeuratObject(resd2, min.cells = 3, min.features = 200, project = "CMC")
cmc3[["percent.mt"]] <- PercentageFeatureSet(cmc3, pattern = "^MT-")
subset(resd2, grep("^MT-"))

write.csv(as.data.frame(resd2), 
          file="/media/desktop-bi-16/92E3-5E93/191001/191001PBMC_SMCfiltered.csv",row.names = TRUE)

png(filename="/media/desktop-bi-16/92E3-5E93/191001/MT_violinPBMC.png",width = 800, height=600)
VlnPlot(cmc3, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
dev.off()

cmc6 <- NormalizeData(cmc3, normalization.method = "LogNormalize", scale.factor = 10000)
cmc6 <- FindVariableFeatures(cmc6, selection.method = "vst", nfeatures = 800)
all.genes <- rownames(cmc6)
cmc6 <- ScaleData(cmc6, features = all.genes)

cmc6 <- RunPCA(cmc6, features = VariableFeatures(object = cmc6), npcs = 5)


cmc6 <- FindNeighbors(cmc6, dims = 1:5)
cmc6 <- FindClusters(cmc6, resolution = 0.5)

cmc6 <- RunUMAP(cmc6, dims = 1:5)

png(filename="/media/desktop-bi-16/92E3-5E93/191001/PCAUMAPfilter1.png",width = 800, height=600)
DimPlot(cmc6, reduction = "umap")
dev.off()

write.csv(as.data.frame(cmc6@meta.data), 
          file="/media/desktop-bi-16/92E3-5E93/191001/191001metaUMAP.csv")
          
png(filename="/media/desktop-bi-16/92E3-5E93/191001/Combinefilter1.png",width = 1000, height=800)          

plot1 <- FeatureScatter(cmc6, feature1 = "nCount_RNA", feature2 = "percent.mt")
plot2 <- FeatureScatter(cmc6, feature1 = "nCount_RNA", feature2 = "nFeature_RNA")
CombinePlots(plots = list(plot1, plot2))
dev.off()


 cat /media/desktop-bi-16/92E3-5E93/191001/191001PBMC_SMCfiltered.csv |grep "RPS"|grep -v "MRPS","PRPS","TRPS"|cut -d"," -f1 |sort|uniq >/media/desktop-bi-16/92E3-5E93/191001/filteredRPS.txt

#############################################################################

inf1=open("/media/desktop-bi-16/92E3-5E93/191001/191001PBMC_SMCfiltered.csv")
rpsf=open("/media/desktop-bi-16/92E3-5E93/191001/filteredRPS.txt")

infl=inf1.readlines();inf1.close()
rpsl=rpsf.readlines();rpsf.close()

rpsmod=[]
rpsmod=[rpline.strip("\n") for rpline in rpsl]
modl=[]

wrline=[] 
wrline2=[]
for wline1 in infl:
	modline=str(wline1.split(",")[0].strip('"'))
	modl.append(modline)
	print modline
	if modline not in rpsmod:
		print wline1
	elif "Mt-" in wline1:
		print 
	else :
		wrline2.append(wline1)
		
		
ouf=open("/media/desktop-bi-16/92E3-5E93/191001/filteredRPS.csv","w")
ouf.write("".join(wrline))
ouf.close()

cat filteredRPS.csv |grep -v "MT-">191001filteredRPSMT.csv
cat 191001filteredRPSMT.csv >191001filteredRPSMT_INMT.csv
cat filteredRPS.csv |grep "INMT-">>191001filteredRPSMT_INMT.csv
####################################################################################
# RPS, MT- filtered analysis
####################################################################################
library(Seurat)
resd2<-read.csv(file = '/media/desktop-bi-16/92E3-5E93/191001/191001filteredRPSMT_INMT.csv',row.names=1, sep = ",", header=T)

cmc3 <-CreateSeuratObject(resd2, min.cells = 3, min.features = 200, project = "CMC")


#png(filename="/media/desktop-bi-16/92E3-5E93/191001/Filterd1_MT_violinPBMC.png",width = 800, height=600)
#VlnPlot(cmc3, features = c("nFeature_RNA", "nCount_RNA"), ncol = 2)
#dev.off()

cmc6 <- NormalizeData(cmc3, normalization.method = "LogNormalize", scale.factor = 10000)
cmc6 <- FindVariableFeatures(cmc6, selection.method = "vst", nfeatures = 800)
all.genes <- rownames(cmc6)
cmc6 <- ScaleData(cmc6, features = all.genes)
###########################################################################################
cmc6 <- RunPCA(cmc6, features = VariableFeatures(object = cmc6), npcs = 5)


cmc6 <- FindNeighbors(cmc6, dims = 1:5)
cmc6 <- FindClusters(cmc6, resolution = 0.5)

cmc6 <- RunUMAP(cmc6, dims = 1:5)
#TSNE
cmc6 <- RunTSNE(cmc6, dims = 1:5, perplexity = 5)
png(filename="/media/desktop-bi-16/92E3-5E93/191001/TSNEfilter_RPSMT15.png",width = 800, height=600)
DimPlot(cmc6, reduction = "tsne")
dev.off()
##############
cmc6 <- RunPCA(cmc6, features = VariableFeatures(object = cmc6), npcs = 8)


cmc6 <- FindNeighbors(cmc6, dims = 1:8)
cmc6 <- FindClusters(cmc6, resolution = 0.5)

cmc6 <- RunUMAP(cmc6, dims = 1:8)

png(filename="/media/desktop-bi-16/92E3-5E93/191001/PCAUMAPfilter_RPSMT18_2.png",width = 800, height=600)
DimPlot(cmc6, reduction = "umap")
dev.off()



##############
cmc6 <- RunPCA(cmc6, features = VariableFeatures(object = cmc6), npcs = 7)


cmc6 <- FindNeighbors(cmc6, dims = 1:7)
cmc6 <- FindClusters(cmc6, resolution = 0.5)

cmc6 <- RunUMAP(cmc6, dims = 1:7)

png(filename="/media/desktop-bi-16/92E3-5E93/191001/PCAUMAPfilter_RPSMT17_2.png",width = 800, height=600)
DimPlot(cmc6, reduction = "umap")
dev.off()

#TSNE
cmc6 <- RunPCA(cmc6, features = VariableFeatures(object = cmc6), npcs = 7)
cmc6 <- RunTSNE(cmc6, dims = 1:7, perplexity = 7)
png(filename="/media/desktop-bi-16/92E3-5E93/191001/TSNEfilter_RPSMT17.png",width = 800, height=600)
DimPlot(cmc6, reduction = "tsne")
dev.off()

##############
cmc6 <- RunPCA(cmc6, features = VariableFeatures(object = cmc6), npcs = 6)


cmc6 <- FindNeighbors(cmc6, dims = 1:6)
cmc6 <- FindClusters(cmc6, resolution = 0.5)

cmc6 <- RunUMAP(cmc6, dims = 1:6)

png(filename="/media/desktop-bi-16/92E3-5E93/191001/PCAUMAPfilter_RPSMT16_2.png",width = 800, height=600)
DimPlot(cmc6, reduction = "umap")
dev.off()

#TSNE
cmc6 <- RunPCA(cmc6, features = VariableFeatures(object = cmc6), npcs = 4)
cmc6 <- RunTSNE(cmc6, dims = 1:4, perplexity = 4)
png(filename="/media/desktop-bi-16/92E3-5E93/191001/TSNEfilter_RPSMT14.png",width = 800, height=600)
DimPlot(cmc6, reduction = "tsne")
dev.off()

#TSNE
cmc6 <- RunPCA(cmc6, features = VariableFeatures(object = cmc6), npcs = 3)
cmc6 <- RunTSNE(cmc6, dims = 1:3, perplexity = 3)
png(filename="/media/desktop-bi-16/92E3-5E93/191001/TSNEfilter_RPSMT13.png",width = 800, height=600)
DimPlot(cmc6, reduction = "tsne")
dev.off()
##############
cmc6 <- RunPCA(cmc6, features = VariableFeatures(object = cmc6), npcs = 4)


cmc6 <- FindNeighbors(cmc6, dims = 1:4)
cmc6 <- FindClusters(cmc6, resolution = 0.5)

cmc6 <- RunUMAP(cmc6, dims = 1:4)

png(filename="/media/desktop-bi-16/92E3-5E93/191001/PCAUMAPfilter_RPSMT14_2.png",width = 800, height=600)
DimPlot(cmc6, reduction = "umap")
dev.off()
##########################################

write.csv(as.data.frame(cmc6@meta.data), 
          file="/media/desktop-bi-16/92E3-5E93/191001/191001filteredRPSMT_metaUMAP.csv")
# Identify the 10 most highly variable genes
top10 <- head(VariableFeatures(cmc6), 10)
top10=c("VDAC3","ESAM","CXCR2P1","FRMD4B","SPARC","ICAM2","TRDC","CD74","SH3GLB1","CA2")
# plot variable features with and without labels
png(filename="/media/desktop-bi-16/92E3-5E93/191001/featureSelection_filter_RPSMT_mod.png",width = 800, height=600)
plot1 <- VariableFeaturePlot(cmc6)
plot2 <- LabelPoints(plot = plot1, points = top10, repel = TRUE)
CombinePlots(plots = list(plot1, plot2))



cmc7 <- RunPCA(cmc6, features = VariableFeatures(object = cmc6), npcs=6)



png(filename="/media/desktop-bi-16/92E3-5E93/191001/Dimloading_filter_RPSMT_mod.png",width = 800, height=600)
VizDimLoadings(cmc7, dims = 1:2, reduction = "pca")
dev.off()

png(filename="/media/desktop-bi-16/92E3-5E93/191001/PCA_filter_RPSMT_mod.png",width = 800, height=600)
DimPlot(cmc7, reduction = "pca")
dev.off()
write.csv(as.data.frame(cmc7@meta.data), 
          file="/media/desktop-bi-16/92E3-5E93/191001/191001metaPCA.csv")

png(filename="/media/desktop-bi-16/92E3-5E93/191001/Heat_RPSMT_1.png",width = 1000, height=800)

DimHeatmap(cmc7, dims = 1, cells = 500, balanced = TRUE)
dev.off()


png(filename="/media/desktop-bi-16/92E3-5E93/191001/Heat_RPSMT_1_15.png",width = 1000, height=800)
DimHeatmap(cmc7, dims = 1:6, cells = 500, balanced = TRUE)
dev.off()

cmc7 <- RunPCA(cmc6, features = VariableFeatures(object = cmc6), npcs=8)

#########################################
cmc8<-RunUMAP(cmc7, dims = 1:8)
png(filename="/media/desktop-bi-16/92E3-5E93/191001/Umap_RPSMT_1_8.png",width = 1000, height=800)
DimPlot(cmc8, reduction = "umap")

cmc3 <- RunPCA(cmc3, features = VariableFeatures(object = cmc6), npcs = 8)
cmc3 <- RunTSNE(cmc3, dims = 1:3)
#########################################
cmc6 <- RunPCA(cmc6, features = VariableFeatures(object = cmc6), npcs = 7)
cmc7<-RunUMAP(cmc6, dims = 1:7)
png(filename="/media/desktop-bi-16/92E3-5E93/191001/Umap_RPSMT_1_7.png",width = 1000, height=800)
DimPlot(cmc7, reduction = "umap")
dev.off()
#########################################
cmc6 <- RunPCA(cmc6, features = VariableFeatures(object = cmc6), npcs = 6)
cmc6<-RunUMAP(cmc6, dims = 1:6)
png(filename="/media/desktop-bi-16/92E3-5E93/191001/Umap_RPSMT_1_6.png",width = 1000, height=800)
DimPlot(cmc6, reduction = "umap")
dev.off()

#########################################
cmc5 <- RunPCA(cmc6, features = VariableFeatures(object = cmc6), npcs = 5)
cmc5<-RunUMAP(cmc5, dims = 1:5)
png(filename="/media/desktop-bi-16/92E3-5E93/191001/Umap_RPSMT_1_5.png",width = 1000, height=800)
DimPlot(cmc5, reduction = "umap")
dev.off()


#########################################
cmc5 <- RunPCA(cmc6, features = VariableFeatures(object = cmc6), npcs = 5)
cmc5<-RunUMAP(cmc5, dims = 1:5)
png(filename="/media/desktop-bi-16/92E3-5E93/191001/Umap_RPSMT_1_5.png",width = 1000, height=800)
DimPlot(cmc5, reduction = "umap")
dev.off()

#########################################
cmc4 <- RunPCA(cmc6, features = VariableFeatures(object = cmc6), npcs = 4)
cmc4<-RunUMAP(cmc4, dims = 1:4)
png(filename="/media/desktop-bi-16/92E3-5E93/191001/Umap_RPSMT_1_4.png",width = 1000, height=800)
DimPlot(cmc4, reduction = "umap")
dev.off()
######################### umap total run ################
library(Seurat)
resd2<-read.csv(file = '/media/desktop-bi-16/92E3-5E93/191001/191001filteredRPSMT_INMT.csv',row.names=1, sep = ",", header=T)
cmc3 <-CreateSeuratObject(resd2, min.cells = 3, min.features = 200, project = "CMC")
cmc6 <- NormalizeData(cmc3, normalization.method = "LogNormalize", scale.factor = 10000)
cmc6 <- FindVariableFeatures(cmc6, selection.method = "vst", nfeatures = 800)
all.genes <- rownames(cmc6)
cmc6 <- ScaleData(cmc6, features = all.genes)

cmc3 <- RunPCA(cmc6, features = VariableFeatures(object = cmc6), npcs = 3)
cmc3<-RunUMAP(cmc3, dims = 1:3)
png(filename="/media/desktop-bi-16/92E3-5E93/191001/Umap_RPSMT_1_3.png",width = 1000, height=800)
DimPlot(cmc3, reduction = "umap")
dev.off()



cluster1.markers <- FindMarkers(cmc7, ident.1 = 1, min.pct = 0.25)
cmc.markers <- FindAllMarkers(cmc7, only.pos = TRUE, min.pct = 0.25, logfc.threshold = 0.25)
cmc.markers %>% group_by(cluster) %>% top_n(n = 2, wt = avg_logFC)
#########################################



