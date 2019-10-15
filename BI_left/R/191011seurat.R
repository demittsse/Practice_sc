install.packages('devtools')
devtools::install_github(repo = 'satijalab/seurat', ref = 'develop')
remotes::install_github("satijalab/seurat", ref="0e070c1878f5301421bd0dae0c6cde32c29da1f1")
library(Seurat)

#=============================================
##salmon import
#=============================================

df1<-read.table("/home/cytogen-bi2/00ref/gtfgtmod2.txt")
names(df1)<-c("chr", "TXNAME", "GENEID")
tx2gene <-df1[,c(3,2)]

setwd("/home/cytogen-bi2/03salmon/")
#dir <- system.file("/home/cytogen-bi2/03salmon/", package = "tximportData")
dir<-setwd("/home/cytogen-bi2/03salmon")
list.files(dir)
#system.file(..., package = "base", lib.loc = NULL,mustWork = FALSE)


#samples=c("2-BY1-1","2-BY2-1","CMC-013_40")
#samples=c("ENSG","CMC-011_35", "2-BY1-1", "2-BY2-1", "CMC-011_08", "CMC-011_11", "CMC-011_13", "CMC-011_18", "CMC-011_19", "CMC-011_21", "CMC-011_22", "CMC-011_23", "CMC-011_24", "CMC-011_27", "CMC-011_28", "CMC-011_29", "CMC-011_31", "CMC-011_33", "CMC-011_34", "CMC-011_37", "CMC-011_38", "CMC-011_40", "CMC-011_41", "CMC-011_45", "CMC-011_46", "CMC-011_47", "CMC-011_49", "CMC-011_55", "CMC-011_57", "CMC-011_58", "CMC-011_59", "CMC-011_60", "CMC-011_67", "CMC-011_76", "CMC-011_77", "CMC-013_40")

#samples=c("01135", "2-BY1-1", "2-BY2-1", "01108", "01111", "01113", "01118", "01119", "01121", "01122", "01123", "01124", "01127", "01128", "01129", "01131", "01133", "01134", "01137", "01138", "01140", "01141", "01145", "01146", "01147", "01149", "01155", "01157", "01158", "01159", "01160", "01167", "01176", "01177", "01340")
#samples=c('PBMC3-82', 'PBMC3-1', 'PBMC3-14', 'PBMC3-15', 'PBMC3-2', 'PBMC3-20', 'PBMC3-21', 'PBMC3-22', 'PBMC3-25', 'PBMC3-32', 'PBMC3-33', 'PBMC3-34', 'PBMC3-4', 'PBMC3-42', 'PBMC3-46', 'PBMC3-47', 'PBMC3-48', 'PBMC3-49', 'PBMC3-55', 'PBMC3-80', 'PBMC3-9', 'PBMC4-10', 'PBMC4-12', 'PBMC4-13', 'PBMC4-16', 'PBMC4-18', 'PBMC4-2', 'PBMC4-23', 'PBMC4-24', 'PBMC4-25', 'PBMC4-35', 'PBMC4-4', 'PBMC4-43', 'PBMC4-45', 'PBMC4-49', 'PBMC4-54', 'PBMC4-55', 'PBMC4-58', 'PBMC4-63', 'PBMC4-8')
samples<-list.files(dir)
files <- file.path(dir, samples, "quant.sf")
> files=files[1:45]
> samples=samples[1:45]

names(files)<-samples
#names(files) <- paste0("sample", 1:6)
files<-c(files[1:6], files[8:45])

all(file.exists(files))

library(tximport)
txi<-tximport(files,type = "salmon", tx2gene = tx2gene)
names(txi)
head(txi$counts)
write.csv(as.data.frame(cmc.fr)
          file="/home/cytogen-bi2/results/CMCfiltered190924.csv")
          
write.csv(as.data.frame(txi$counts), 
          file="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/02pbmc/190920PBMC_salmonTPM.csv")
          
write.csv(as.data.frame(txi$counts), 
          file="/home/cytogen-bi2/results/190925C1_salmonTPM.csv")
write.csv(as.data.frame(cmc.data@meta.data), 
          file="/media/desktop-bi-16/92E3-5E93/190917/190917_CMC1113_cntFtrMt.csv")
##seurat input
resd<-read.csv(file = "/home/cytogen-bi2/results/190916/190917_CMC1113_geneENSG.csv",row.names=1, sep = ",", header=T)

#cmc.data <-CreateSeuratObject(txi$counts, min.cells = 3, min.features = 200, project = "CMC")
cmc.data <-CreateSeuratObject(resd, min.cells = 3, min.features = 200, project = "CMC")

###QC and selecting cells for further analysis

cmc.data[["percent.mt"]] <- PercentageFeatureSet(cmc.data, pattern = "^MT-")

# Visualize QC metrics as a violin plot
png(filename="/home/cytogen-bi2/results/plot/190924/geneRNA_MT_violin.png",width = 800, height=600)

VlnPlot(cmc.data, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
dev.off()

#VlnPlot(cmc.data, features = "percent.mt", split.by = "groups")

png(filename="/home/cytogen-bi2/results/plot/190924/geneRNA_MT_scatter.png",width = 800, height=600)

plot1 <- FeatureScatter(cmc.data, feature1 = "nCount_RNA", feature2 = "percent.mt")
plot2 <- FeatureScatter(cmc.data, feature1 = "nCount_RNA", feature2 = "nFeature_RNA")
CombinePlots(plots = list(plot1, plot2))

dev.off()

cmc.fr=data.frame(cmc.data@meta.data)
cmc1 <- subset(cmc.data, subset = nFeature_RNA > 200 & nFeature_RNA < 2500 & percent.mt < 5)

write.csv(as.data.frame(cmc.fr),file="/home/cytogen-bi2/results/CMCfiltered190924.csv")
###########################################################
######## error
###########################################################
cmc.nrm1 <- NormalizeData(cmc1, normalization.method = "LogNormalize", scale.factor = 10000)


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


