install.packages('devtools')
devtools::install_github(repo = 'satijalab/seurat', ref = 'develop')
library(Seurat)

#=============================================
##salmon import
#=============================================

df1<-read.table("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/gtfgtmod2.txt")
names(df1)<-c("chr", "TXNAME", "GENEID")
tx2gene <-df1[,c(3,2)]

setwd("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon")
#dir <- system.file("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/02pbmc", package = "tximportData")
list.files(dir)
#system.file(..., package = "base", lib.loc = NULL,mustWork = FALSE)

plf=glob.glob('/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/03plate/*/quant.sf')


dir<-"/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon"
#=============================================
##sample elemination
#=============================================
resd1=subset(resd1, select=-c(X2.BY1.1,X2.BY2.1))






#=============================================


#samples=c("2-BY1-1","2-BY2-1","CMC-013_40")
#samples=c("CMC-011_35", "2-BY1-1", "2-BY2-1", "CMC-011_08", "CMC-011_11", "CMC-011_13", "CMC-011_18", "CMC-011_19", "CMC-011_21", "CMC-011_22", "CMC-011_23", "CMC-011_24", "CMC-011_27", "CMC-011_28", "CMC-011_29", "CMC-011_31", "CMC-011_33", "CMC-011_34", "CMC-011_37", "CMC-011_38", "CMC-011_40", "CMC-011_41", "CMC-011_45", "CMC-011_46", "CMC-011_47", "CMC-011_49", "CMC-011_55", "CMC-011_57", "CMC-011_58", "CMC-011_59", "CMC-011_60", "CMC-011_67", "CMC-011_76", "CMC-011_77", "CMC-013_40")

#samples=c("01135", "2-BY1-1", "2-BY2-1", "01108", "01111", "01113", "01118", "01119", "01121", "01122", "01123", "01124", "01127", "01128", "01129", "01131", "01133", "01134", "01137", "01138", "01140", "01141", "01145", "01146", "01147", "01149", "01155", "01157", "01158", "01159", "01160", "01167", "01176", "01177", "01340")
samples=c('PBMC3-82', 'PBMC3-1', 'PBMC3-14', 'PBMC3-15', 'PBMC3-2', 'PBMC3-20', 'PBMC3-21', 'PBMC3-22', 'PBMC3-25', 'PBMC3-32', 'PBMC3-33', 'PBMC3-34', 'PBMC3-4', 'PBMC3-42', 'PBMC3-46', 'PBMC3-47', 'PBMC3-48', 'PBMC3-49', 'PBMC3-55', 'PBMC3-80', 'PBMC3-9', 'PBMC4-10', 'PBMC4-12', 'PBMC4-13', 'PBMC4-16', 'PBMC4-18', 'PBMC4-2', 'PBMC4-23', 'PBMC4-24', 'PBMC4-25', 'PBMC4-35', 'PBMC4-4', 'PBMC4-43', 'PBMC4-45', 'PBMC4-49', 'PBMC4-54', 'PBMC4-55', 'PBMC4-58', 'PBMC4-63', 'PBMC4-8')

samples1=c("CMC-011_35", "CMC-011_08", "CMC-011_11", "CMC-011_13", "CMC-011_18", "CMC-011_19", "CMC-011_21", "CMC-011_22", "CMC-011_23", "CMC-011_24", "CMC-011_27", "CMC-011_28", "CMC-011_29", "CMC-011_31", "CMC-011_33", "CMC-011_34", "CMC-011_37", "CMC-011_38", "CMC-011_40", "CMC-011_41", "CMC-011_45", "CMC-011_46", "CMC-011_47", "CMC-011_49", "CMC-011_55", "CMC-011_57", "CMC-011_58", "CMC-011_59", "CMC-011_60", "CMC-011_67", "CMC-011_76", "CMC-011_77", "CMC-011_340","PBMC.03_82",   "PBMC.03_1", "PBMC.03_14","PBMC.03_15","PBMC.03_2","PBMC.03_20",   "PBMC.03_21","PBMC.03_22","PBMC.03_25","PBMC.03_32","PBMC.03_33","PBMC.03_34",  
 "PBMC.03_4","PBMC.03_42","PBMC.03_46","PBMC.03_47","PBMC.03_48", 
 "PBMC.03_49","PBMC.03_55","PBMC.03_80","PBMC.03_9","PBMC.04_10",
"PBMC.04_12","PBMC.04_13","PBMC.04_16","PBMC.04_18","PBMC.04_2", 
"PBMC.04_23","PBMC.04_24","PBMC.04_25","PBMC.04_35","PBMC.04_4", 
 "PBMC.04_43","PBMC.04_45","PBMC.04_49","PBMC.04_54","PBMC.04_55",
 "PBMC.04_58","PBMC.04_63","PBMC.04_8")
files <- file.path(dir, "03plate", samples, "quant.sf")
files <- file.path(dir, "01cmc1113", samples, "quant.sf")
files <- file.path(dir, "04cmcpbmc", samples, "quant.sf")

names(files)<-samples
#names(files) <- paste0("sample", 1:6)
all(file.exists(files))

library(tximport)
txi<-tximport(files,type = "salmon", tx2gene = tx2gene)
names(txi)
head(txi$counts)
#write.csv(as.data.frame(txi$counts), tab delimited로 개선 해야함 
          file="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/results/sclc_CMC_salmonCounts.csv")
          
write.csv(as.data.frame(txi$counts), 
          file="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/02pbmc/190920PBMC_salmonTPM.csv")
          
write.csv(as.data.frame(txi$counts), 
          file="/media/desktop-bi-16/92E3-5E93/190917/190920PBMC_salmonTPM.csv")
write.csv(as.data.frame(cmc.data@meta.data), 
          file="/media/desktop-bi-16/92E3-5E93/190917/190917_CMC1113_cntFtrMt.csv")
          
write.csv(as.data.frame(cmc@meta.data), 
          file="/media/desktop-bi-16/92E3-5E93/190930/190930metaUMAP.csv")
##seurat input
#resd<-read.csv(file = "/media/desktop-bi-16/92E3-5E93/190916/190917_CMC1113_geneENSG.csv",row.names=1, sep = ",", header=T)

resd<-read.csv(file = '/media/desktop-bi-16/92E3-5E93/190926cmc_pbmc/190926Seurat_PBMC_SMC_salmon.txt',row.names=1, sep = ",", header=T)

cmc.mt<-CreateSeuratObject(resd, min.cells = 3, min.features = 200, project = "CMC")
cmcf='/media/desktop-bi-16/92E3-5E93/190916/190917_CMC1113_geneENSG.csv'
pbmcf='/media/desktop-bi-16/92E3-5E93/190926cmc_pbmc/190926singPBMC.csv''
cmcd=read.csv(file=cmcf, sep = ",", header=T)
pbmcd=read.csv(file=pbmcf, sep = ",", header=T)

intd=merge(cmcd, pbmcd, by='None_')

write.csv(as.data.frame(intd), 
          file="/media/desktop-bi-16/92E3-5E93/190926cmc_pbmc/190926PBMC_SMC_salmon.csv",row.names = FALSE)

write.table(intd, file = "/media/desktop-bi-16/92E3-5E93/190926cmc_pbmc/190926PBMC_SMC_salmon.txt", row.names = FALSE)

write.table(as.data.frame(cmc.mt@meta.data), file = "/media/desktop-bi-16/92E3-5E93/190930/190926PBMC_SMC_MT.txt", row.names = TRUE)

/media/desktop-bi-16/92E3-5E93/190926cmc_pbmc/190926PBMC_SMC_salmon.csv

#cmc.data <-CreateSeuratObject(txi$counts, min.cells = 3, min.features = 200, project = "CMC")
#=============================================
## Run PCA
#=============================================


cmc<- CreateSeuratObject(counts = txi$counts , min.cells = 3, min.features = 200, project = "cmc")
cmc1<- CreateSeuratObject(counts = txi$counts , min.cells = 3, min.features = 200, project = "cmc")

#cmc <-CreateSeuratObject(resd, min.cells = 3, min.features = 200, project = "CMC")
cmc <-CreateSeuratObject(resd1, min.cells = 3, min.features = 200, project = "CMC")


cmc <- NormalizeData(cmc, normalization.method = "LogNormalize", scale.factor = 10000)
cmc <- FindVariableFeatures(cmc, selection.method = "vst", nfeatures = 800)

cmc1 <- NormalizeData(cmc1, normalization.method = "LogNormalize", scale.factor = 10000)
cmc1 <- FindVariableFeatures(cmc1, selection.method = "vst", nfeatures = 800)
all.genes <- rownames(cmc1)
cmc1 <- ScaleData(cmc1, features = all.genes)

all.genes <- rownames(cmc)
cmc <- ScaleData(cmc, features = all.genes)

#cmc <- RunPCA(cmc, features = VariableFeatures(object = cmc))
cmc <- RunPCA(cmc, features = VariableFeatures(object = cmc), npcs = 5)


cmc <- FindNeighbors(cmc, dims = 1:5)
cmc <- FindClusters(cmc, resolution = 0.5)

cmc <- RunUMAP(cmc, dims = 1:5)

png(filename="/media/desktop-bi-16/92E3-5E93/190930/PCAUMAP.png",width = 800, height=600)
DimPlot(cmc, reduction = "umap")

png
###QC and selecting cells for further analysis

cmc.data[["percent.mt"]] <- PercentageFeatureSet(cmc.data, pattern = "^MT-")
cmc.mt[["percent.mt"]] <- PercentageFeatureSet(cmc.mt, pattern = "^MT-")
cmc[["percent.mt"]] <- PercentageFeatureSet(cmc, pattern = "^MT-")
cmc[["percent.mt"]] <- PercentageFeatureSet(cmc, pattern = "^MT-")
cmc2[["percent.mt"]] <- PercentageFeatureSet(cmc2, pattern = "^MT-")

# Visualize QC metrics as a violin plot
png(filename="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/08seurat/plot//190917/geneRNA_MT_violin.png",width = 800, height=600)

png(filename="/media/desktop-bi-16/92E3-5E93/190930/MT_violin2.png",width = 800, height=600)

VlnPlot(cmc, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
VlnPlot(cmc2, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
VlnPlot(cmc1, features = c("nFeature_RNA", "nCount_RNA"), ncol = 2)
VlnPlot(cmc.mt, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
VlnPlot(cmc.mt, features =  "percent.mt")
dev.off()


samples2=c("CMC-011_35", "CMC-011_08", "CMC-011_11", "CMC-011_13", "CMC-011_18", "CMC-011_19", "CMC-011_21", "CMC-011_22", "CMC-011_23", "CMC-011_24", "CMC-011_27", "CMC-011_28", "CMC-011_29", "CMC-011_31", "CMC-011_33", "CMC-011_34", "CMC-011_37", "CMC-011_38", "CMC-011_40", "CMC-011_41", "CMC-011_45", "CMC-011_46", "CMC-011_47", "CMC-011_49", "CMC-011_55", "CMC-011_57", "CMC-011_58", "CMC-011_59", "CMC-011_60", "CMC-011_67", "CMC-011_76", "CMC-011_77", "CMC-011_340","PBMC.0382",   "PBMC.031", "PBMC.0314","PBMC.0315","PBMC.032","PBMC.0320",   "PBMC.0321","PBMC.0322","PBMC.0325","PBMC.0332","PBMC.0333","PBMC.0334",  
"PBMC.034","PBMC.0342","PBMC.0346","PBMC.0347","PBMC.0348", 
"PBMC.0349","PBMC.0355","PBMC.0380","PBMC.039","PBMC.0410",
"PBMC.0412","PBMC.0413","PBMC.0416","PBMC.0418","PBMC.042", 
"PBMC.0423","PBMC.0424","PBMC.0425","PBMC.0435","PBMC.044", 
"PBMC.0443","PBMC.0445","PBMC.0449","PBMC.0454","PBMC.0455",
"PBMC.0458","PBMC.0463","PBMC.048")

colnames(resd1)=samples2
> colnames(resd1)

cmc3 <-CreateSeuratObject(resd1, min.cells = 3, min.features = 200, project = "CMC")
cmc3[["percent.mt"]] <- PercentageFeatureSet(cmc3, pattern = "^MT-")
png(filename="/media/desktop-bi-16/92E3-5E93/190930/MT_violinPBMC.png",width = 800, height=600)
VlnPlot(cmc3, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
dev.off()
#############

resd5=subset(resd, select=-c(X2.BY1.1,X2.BY2.1,CMC.011_08,CMC.011_13,CMC.011_19,CMC.011_22,CMC.011_27,CMC.011_28,CMC.011_31,CMC.011_34,CMC.011_41,CMC.011_58,CMC.011_59,CMC.011_60,CMC.011_67)),CMC.011_77​))
samples800=c("CMC.011_35","CMC.011_11","CMC.011_18","CMC.011_21","CMC.011_23","CMC.011_24","CMC.011_29","CMC.011_33","CMC.011_37","CMC.011_38","CMC.011_40","CMC.011_45","CMC.011_46","CMC.011_47","CMC.011_49","CMC.011_55","CMC.011_57","CMC.011_76","CMC.011_340","PBMC.034_382","PBMC.034_31","PBMC.034_314","PBMC.034_315","PBMC.034_32","PBMC.034_320","PBMC.034_321","PBMC.034_322","PBMC.034_325","PBMC.034_332","PBMC.034_333","PBMC.034_334","PBMC.034_34","PBMC.034_342","PBMC.034_346","PBMC.034_347","PBMC.034_348","PBMC.034_349","PBMC.034_355","PBMC.034_380","PBMC.034_39", "PBMC.034_410","PBMC.034_412","PBMC.034_413","PBMC.034_416","PBMC.034_418","PBMC.034_42","PBMC.034_423","PBMC.034_424","PBMC.034_425","PBMC.034_435","PBMC.034_44","PBMC.034_443","PBMC.034_445","PBMC.034_449","PBMC.034_454","PBMC.034_455","PBMC.034_458","PBMC.034_463","PBMC.034_48")
spl_cut1=c()
> length(colnames(resd5))
[1] 59
> length(samples800)
[1] 59
colnames(resd5)=samples800

cmc5 <-CreateSeuratObject(resd5, min.cells = 3, min.features = 200, project = "CMC")
cmc5[["percent.mt"]] <- PercentageFeatureSet(cmc5, pattern = "^MT-")
png(filename="/media/desktop-bi-16/92E3-5E93/190930/MT_violinfilter1_2.png",width = 800, height=600)
VlnPlot(cmc5, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
dev.off()


cmc6 <- NormalizeData(cmc5, normalization.method = "LogNormalize", scale.factor = 10000)
cmc6 <- FindVariableFeatures(cmc6, selection.method = "vst", nfeatures = 800)
all.genes <- rownames(cmc6)
cmc6 <- ScaleData(cmc6, features = all.genes)

cmc6 <- RunPCA(cmc6, features = VariableFeatures(object = cmc6), npcs = 5)


cmc6 <- FindNeighbors(cmc6, dims = 1:5)
cmc6 <- FindClusters(cmc6, resolution = 0.5)

cmc6 <- RunUMAP(cmc6, dims = 1:5)

png(filename="/media/desktop-bi-16/92E3-5E93/190930/PCAUMAPfilter1.png",width = 800, height=600)
DimPlot(cmc6, reduction = "umap")
############################################################

samples2=c("CMC-011_35", "CMC-011_08", "CMC-011_11", "CMC-011_13", "CMC-011_18", "CMC-011_19", "CMC-011_21", "CMC-011_22", "CMC-011_23", "CMC-011_24", "CMC-011_27", "CMC-011_28", "CMC-011_29", "CMC-011_31", "CMC-011_33", "CMC-011_34", "CMC-011_37", "CMC-011_38", "CMC-011_40", "CMC-011_41", "CMC-011_45", "CMC-011_46", "CMC-011_47", "CMC-011_49", "CMC-011_55", "CMC-011_57", "CMC-011_58", "CMC-011_59", "CMC-011_60", "CMC-011_67", "CMC-011_76", "CMC-011_77", "CMC-011_340","PBMC-034_0382",   "PBMC-034_031", "PBMC-034_0314","PBMC-034_0315","PBMC-034_032","PBMC-034_0320",   "PBMC-034_0321","PBMC-034_0322","PBMC-034_0325","PBMC-034_0332","PBMC-034_0333","PBMC-034_0334",  
"PBMC-034_034","PBMC-034_0342","PBMC-034_0346","PBMC-034_0347","PBMC-034_0348", 
"PBMC-034_0349","PBMC-034_0355","PBMC-034_0380","PBMC-034_039","PBMC-034_0410",
"PBMC-034_0412","PBMC-034_0413","PBMC-034_0416","PBMC-034_0418","PBMC-034_042", 
"PBMC-034_0423","PBMC-034_0424","PBMC-034_0425","PBMC-034_0435","PBMC-034_044", 
"PBMC-034_0443","PBMC-034_0445","PBMC-034_0449","PBMC-034_0454","PBMC-034_0455",
"PBMC-034_0458","PBMC-034_0463","PBMC-034_048")

colnames(resd1)=samples2
> colnames(resd1)

cmc3 <-CreateSeuratObject(resd1, min.cells = 3, min.features = 200, project = "CMC")
cmc3[["percent.mt"]] <- PercentageFeatureSet(cmc3, pattern = "^MT-")
png(filename="/media/desktop-bi-16/92E3-5E93/190930/MT_violinPBMC.png",width = 800, height=600)
VlnPlot(cmc3, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
dev.off()

############################################################

samples1=c("CMC-011_35", "CMC-011_08", "CMC-011_11", "CMC-011_13", "CMC-011_18", "CMC-011_19", "CMC-011_21", "CMC-011_22", "CMC-011_23", "CMC-011_24", "CMC-011_27", "CMC-011_28", "CMC-011_29", "CMC-011_31", "CMC-011_33", "CMC-011_34", "CMC-011_37", "CMC-011_38", "CMC-011_40", "CMC-011_41", "CMC-011_45", "CMC-011_46", "CMC-011_47", "CMC-011_49", "CMC-011_55", "CMC-011_57", "CMC-011_58", "CMC-011_59", "CMC-011_60", "CMC-011_67", "CMC-011_76", "CMC-011_77", "CMC-011_340","PBMC.03_82",   "PBMC.03_1", "PBMC.03_14","PBMC.03_15","PBMC.03_2","PBMC.03_20",   "PBMC.03_21","PBMC.03_22","PBMC.03_25","PBMC.03_32","PBMC.03_33","PBMC.03_34",  
 "PBMC.03_4","PBMC.03_42","PBMC.03_46","PBMC.03_47","PBMC.03_48", 
 "PBMC.03_49","PBMC.03_55","PBMC.03_80","PBMC.03_9","PBMC.04_10",
"PBMC.04_12","PBMC.04_13","PBMC.04_16","PBMC.04_18","PBMC.04_2", 
"PBMC.04_23","PBMC.04_24","PBMC.04_25","PBMC.04_35","PBMC.04_4", 
 "PBMC.04_43","PBMC.04_45","PBMC.04_49","PBMC.04_54","PBMC.04_55",
 "PBMC.04_58","PBMC.04_63","PBMC.04_8")

colnames(resd1)=samples1
cmc4 <-CreateSeuratObject(resd1, min.cells = 3, min.features = 200, project = "CMC")
cmc4[["percent.mt"]] <- PercentageFeatureSet(cmc4, pattern = "^MT-")
png(filename="/media/desktop-bi-16/92E3-5E93/190930/MT_violincmc13.png",width = 800, height=600)
VlnPlot(cmc4, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
dev.off()



#VlnPlot(cmc.data, features = "percent.mt", split.by = "groups")

png(filename="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/08seurat/plot/190917/geneRNA_MT_scatter.png",width = 800, height=600)

plot1 <- FeatureScatter(cmc.data, feature1 = "nCount_RNA", feature2 = "percent.mt")
plot2 <- FeatureScatter(cmc.data, feature1 = "nCount_RNA", feature2 = "nFeature_RNA")
CombinePlots(plots = list(plot1, plot2))

dev.off()

cmc1 <- subset(cmc.data, subset = nFeature_RNA > 200 & nFeature_RNA < 2500 & percent.mt < 5)
cmc.nrm1 <- NormalizeData(cmc.data, normalization.method = "LogNormalize", scale.factor = 10000)


cmc.val1 <- FindVariableFeatures(cmc.nrm1, selection.method = "vst", nfeatures = 2000)

# Identify the 10 most highly variable genes
top20 <- head(VariableFeatures(cmc.val1), 20)

# plot variable features with and without labels
png(filename="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/08seurat/plot/190917/gene2top10.png",width = 800, height=600)
plot1 <- VariableFeaturePlot(cmc.val)
plot2 <- LabelPoints(plot = plot1, points = top20, repel = TRUE)
CombinePlots(plots = list(plot1, plot2))

dev.off()


write.csv(as.data.frame(top100), 
          file="//media/desktop-bi-16/92E3-5E93/190917/190916_CMC1113_top100.csv")
          

all.genes <- rownames(cmc.val1)
cmc.scale <-ScaleData(cmc.val1, features = all.genes)
cmc.scale <-ScaleData(cmc.val1, vars.to.regress = "percent.mt")


cmc.scale <- RunPCA(cmc.scale, features = VariableFeatures(object = cmc.scale))
cmc.scale <- RunPCA(cmc.scale, features = VariableFeatures(object = cmc.scale) assay = NULL,\ 
  npcs = 50, rev.pca = FALSE, weight.by.var = TRUE, verbose = TRUE,\
  ndims.print = 1:5, nfeatures.print = 30, reduction.name = "pca",\
  reduction.key = "PC_", seed.use = 42, ...)

### picard 
java -jar picard.jar CollectRnaSeqMetrics \
      I=input.bam \
      O=output.RNA_Metrics \
      REF_FLAT=ref_flat.txt \
      STRAND=SECOND_READ_TRANSCRIPTION_STRAND \
      RIBOSOMAL_INTERVALS=ribosomal.interval_list\
      --CHART_OUTPUT

