#==> 191211ExpressionSeurat_scater.R <==#
library(Seurat)

SMC-009_2​
SMC-009_4​
SMC-009_44​
SMC-009_61​
SMC-009_65​

resd1=read.csv("/media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/04rsem/07SMC009_191209/191211rsemTPMENSG_geneAnno.csv",header=T,row.names=1)

resd2=resd1[c("SMC_009.2", "SMC_009.4", "SMC_009.44", "SMC_009.61", "SMC_009.65")]

library(stringr)
#colnames(resd)<-str_replace_all(colnames(resd), "PBMC3.", "PBMC.3_")

cmc.data <-CreateSeuratObject(resd1, min.cells = 3, min.features = 200, project = "CMC")

cmc.data[["percent.mt"]] <- PercentageFeatureSet(cmc.data, pattern = "^MT-")



# Visualize QC metrics as a violin plot
png(filename="geneRNA_MT_violin_SMC009All.png",width = 800, height=600)

VlnPlot(cmc.data, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
dev.off()

##### Filtered  ###########
resd2=resd1[c("SMC_009.2", "SMC_009.4", "SMC_009.44", "SMC_009.61", "SMC_009.65")]

library(stringr)
#colnames(resd)<-str_replace_all(colnames(resd), "PBMC3.", "PBMC.3_")

cmc.data2 <-CreateSeuratObject(resd2, min.cells = 2, min.features = 200, project = "CMC")

cmc.data2[["percent.mt"]] <- PercentageFeatureSet(cmc.data2, pattern = "^MT-")



# Visualize QC metrics as a violin plot
png(filename="geneRNA_MT_violin_SMC009Filtered2.png",width = 800, height=600)

VlnPlot(cmc.data2, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
dev.off()

#==> 191128ExpressionSeurat_scater.R <==#

"""
CMC-011_08​
CMC-011_19​
CMC-011_33​
CMC-011_49​
CMC-011_58​
CMC-011_59​
CMC-011_60​
PBMC3-34
"""
cmc2=cmc1[c("CMC-011_08","CMC-011_19","CMC-011_33", "CMC-011_49", "CMC-011_58", "CMC-011_59","CMC-011_60","PBMC3-34")]

write.csv(cmc2,file="/dt2/04rsem/06ENS3803_Merge191120/191121rsemTPMcellFiltered/191121filterRsemTPMENSG.csv")


############
geneOnly<-read.csv("/dt2/04rsem/06ENS3803_Merge191120/191120rsemTPMENSG_geneAnno.csv",header = T)

geneWrite<-geneOnly[c("None","CMC.011_08","CMC.011_19","CMC.011_33", "CMC.011_49", "CMC.011_58", "CMC.011_59","CMC.011_60","PBMC3.34")]

names(geneWrite)[1]<-paste("Gene")

write.csv(geneWrite,file="/dt2/04rsem/06ENS3803_Merge191120/191121rsemTPMcellFiltered/191121filterRsemTPMGene.csv",row.names=FALSE)


############
gene_ENSG<-read.csv("/dt2/04rsem/06ENS3803_Merge191120/191120rsemTPMENSG_gene_ENSGAnno.csv",header = T)

gene_ENSGWrite<-gene_ENSG[c("None_","CMC.011_08","CMC.011_19","CMC.011_33", "CMC.011_49", "CMC.011_58", "CMC.011_59","CMC.011_60","PBMC3.34")]

names(gene_ENSGWrite)[1]<-paste("Gene")

write.csv(gene_ENSGWrite,file="/dt2/04rsem/06ENS3803_Merge191120/191121rsemTPMcellFiltered/191121filterRsemTPMGene_ENSG.csv",row.names=FALSE)


resd<-read.csv(file = "/dt2/04rsem/06ENS3803_Merge191120/191121rsemTPMcellFiltered/191121filterRsemTPMGene_ENSG.csv",row.names=1, sep = ",", header=T)


library(Seurat)
setwd("/dt2/04rsem/06ENS3803_Merge191120/191121rsemTPMBeforeFiltering")
getwd()
#[1] "/dt2/04rsem/06ENS3803_Merge191120"
load("filteredRSEMSeuratObject.RData")
ls()
#[1] "cmc.data"

##seurat input
resd<-read.csv(file = "/dt2/04rsem/06ENS3803_Merge191120/191120rsemTPMENSG_gene_ENSGAnno.csv",row.names=1, sep = ",", header=T)

library(stringr)
colnames(resd)<-str_replace_all(colnames(resd), "PBMC3.", "PBMC.3_")
colnames(resd)<-str_replace_all(colnames(resd), "PBMC4.", "PBMC.4_")
colnames(resd)<-str_replace_all(colnames(resd), "H2.", "H69.H2_")
colnames(resd)<-str_replace_all(colnames(resd), "H1.", "H69.H1_")

colnames(resd)<-str_replace_all(colnames(resd), "X2.BY1.", "H692.BY1_")
colnames(resd)<-str_replace_all(colnames(resd), "X2.BY2.", "H692.BY2_")
colnames(resd)<-str_replace_all(colnames(resd), "X2.BY3.", "H692.BY3_")

colnames(resd)<-str_replace_all(colnames(resd), "X2.JS1.", "H692.JS1_")
colnames(resd)<-str_replace_all(colnames(resd), "X2.JS2.", "H692.JS2_")
colnames(resd)<-str_replace_all(colnames(resd), "X2.JS3.", "H692.JS3_")

resd=resd[c("CMC.011_08","CMC.011_13","CMC.011_19","CMC.011_23","CMC.011_24","CMC.011_27","CMC.011_28","CMC.011_29","CMC.011_31","CMC.011_33","CMC.011_34","CMC.011_37","CMC.011_38","CMC.011_40","CMC.011_41","CMC.011_45","CMC.011_47","CMC.011_49","CMC.011_55","CMC.011_57","CMC.011_58","CMC.011_59","CMC.011_60","CMC.011_67","CMC.011_76","CMC.011_77","CMC.018_15","CMC.018_25","CMC.018_66","CMC.018_78","CMC.018_95","PBMC.3_34","H692.BY1_1","H692.BY1_3","H692.BY1_6","H692.BY1_7","H692.BY1_8","H692.BY2_1","H692.BY2_3","H692.BY2_4","H692.BY2_5","H692.BY2_7","H692.BY2_8","H692.BY3_1","H692.BY3_2","H692.BY3_3","H692.BY3_4","H692.BY3_5","H692.BY3_7","H692.BY3_8","H692.JS1_1","H692.JS1_2","H692.JS1_3","H692.JS1_4","H692.JS1_6","H692.JS1_7","H692.JS1_8","H692.JS2_1","H692.JS2_2","H692.JS2_3","H692.JS2_4","H692.JS2_6","H692.JS2_7","H692.JS2_8","H692.JS3_2","H692.JS3_3","H692.JS3_4","H692.JS3_5","H692.JS3_6","H692.JS3_7","H692.JS3_8","H69.H1_30","H69.H1_35","H69.H1_39","H69.H1_43","H69.H1_46","H69.H2_15","H69.H2_17","H69.H2_3","H69.H2_32","H69.H2_37","H69.H2_39","H69.H2_4","H69.H2_53","H69.H2_54","H69.H2_55","H69.H2_56","H69.H2_60","H69.H2_63","H69.H2_64","H69.H2_66","H69.H2_67","H69.H2_68","H69.H2_7","H69.H2_71","H69.H2_74","H69.H2_75","H69.H2_76","H69.H2_77","H69.H2_78","H69.H2_79","H69.H2_82","H69.H2_83","H69.H2_86","H69.H2_88","H69.H2_89","H69.H2_9","H69.H2_91","H69.H2_92","H69.H2_94","H69.H2_95")]

#경계값 추가 
resd=resd[c("CMC.011_08","CMC.011_13","CMC.011_18","CMC.011_19","CMC.011_23","CMC.011_24","CMC.011_27","CMC.011_28","CMC.011_29","CMC.011_31","CMC.011_33","CMC.011_34","CMC.011_35","CMC.011_37","CMC.011_38","CMC.011_40","CMC.011_41","CMC.011_45","CMC.011_47","CMC.011_49","CMC.011_55","CMC.011_57","CMC.011_58","CMC.011_59","CMC.011_60","CMC.011_67","CMC.011_76","CMC.011_77","CMC.018_15","CMC.018_25","CMC.018_66","CMC.018_78","CMC.018_95","PBMC.3_1","PBMC.3_34","PBMC.3_80","H692.BY1_1","H692.BY1_3","H692.BY1_6","H692.BY1_7","H692.BY1_8","H692.BY2_1","H692.BY2_3","H692.BY2_4","H692.BY2_5","H692.BY2_7","H692.BY2_8","H692.BY3_1","H692.BY3_2","H692.BY3_3","H692.BY3_4","H692.BY3_5","H692.BY3_7","H692.BY3_8","H692.JS1_1","H692.JS1_2","H692.JS1_3","H692.JS1_4","H692.JS1_5","H692.JS1_6","H692.JS1_7","H692.JS1_8","H692.JS2_1","H692.JS2_2","H692.JS2_3","H692.JS2_4","H692.JS2_6","H692.JS2_7","H692.JS2_8","H692.JS3_2","H692.JS3_3","H692.JS3_4","H692.JS3_5","H692.JS3_6","H692.JS3_7","H692.JS3_8","H69.H1_30","H69.H1_35","H69.H1_39","H69.H1_43","H69.H1_46","H69.H2_15","H69.H2_17","H69.H2_3","H69.H2_32","H69.H2_37","H69.H2_39","H69.H2_4","H69.H2_53","H69.H2_54","H69.H2_55","H69.H2_56","H69.H2_60","H69.H2_63","H69.H2_64","H69.H2_66","H69.H2_67","H69.H2_68","H69.H2_7","H69.H2_71","H69.H2_74","H69.H2_75","H69.H2_76","H69.H2_77","H69.H2_78","H69.H2_79","H69.H2_82","H69.H2_83","H69.H2_86","H69.H2_88","H69.H2_89","H69.H2_9","H69.H2_91","H69.H2_92","H69.H2_94","H69.H2_95")]

#5'-3'bias
resd=resd[c("CMC.011_08","CMC.011_19","CMC.011_33","CMC.011_49","CMC.011_58","CMC.011_59","CMC.011_60","H692.BY1_1","H692.BY1_3","H692.BY1_6","H692.BY1_7","H692.BY1_8","H692.BY2_1","H692.BY2_3","H692.BY2_4","H692.BY2_5","H692.BY2_7","H692.BY2_8","H692.BY3_1","H692.BY3_2","H692.BY3_3","H692.BY3_4","H692.BY3_5","H692.BY3_7","H692.BY3_8","H692.JS1_1","H692.JS1_2","H692.JS1_3","H692.JS1_4","H692.JS1_6","H692.JS1_7","H692.JS1_8","H692.JS2_2","H692.JS2_3","H692.JS2_4","H692.JS2_6","H692.JS2_7","H692.JS2_8","H692.JS3_2","H692.JS3_3","H692.JS3_4","H692.JS3_5","H692.JS3_6","H692.JS3_7","H692.JS3_8","H69.H1_30","H69.H1_35","H69.H1_39","H69.H1_43","H69.H1_46","H69.H2_15","H69.H2_17","H69.H2_3","H69.H2_32","H69.H2_37","H69.H2_39","H69.H2_4","H69.H2_53","H69.H2_54","H69.H2_55","H69.H2_56","H69.H2_60","H69.H2_63","H69.H2_64","H69.H2_66","H69.H2_67","H69.H2_68","H69.H2_7","H69.H2_71","H69.H2_74","H69.H2_75","H69.H2_76","H69.H2_77","H69.H2_78","H69.H2_79","H69.H2_82","H69.H2_83","H69.H2_86","H69.H2_88","H69.H2_89","H69.H2_9","H69.H2_91","H69.H2_92","H69.H2_94","H69.H2_95")]

#5'-3'bias
resd=resd[c("CMC.011_08","CMC.011_33","H692.BY1_1","H692.BY1_3","H692.BY1_6","H692.BY1_7","H692.BY1_8","H692.BY2_1","H692.BY2_3","H692.BY2_4","H692.BY2_5","H692.BY2_7","H692.BY2_8","H692.BY3_1","H692.BY3_2","H692.BY3_3","H692.BY3_4","H692.BY3_5","H692.BY3_7","H692.BY3_8","H692.JS1_1","H692.JS1_2","H692.JS1_3","H692.JS1_4","H692.JS1_6","H692.JS1_7","H692.JS1_8","H692.JS2_2","H692.JS2_3","H692.JS2_4","H692.JS2_6","H692.JS2_7","H692.JS2_8","H692.JS3_2","H692.JS3_3","H692.JS3_4","H692.JS3_5","H692.JS3_6","H692.JS3_7","H692.JS3_8","H69.H1_30","H69.H1_35","H69.H1_39","H69.H1_43","H69.H1_46","H69.H2_15","H69.H2_17","H69.H2_3","H69.H2_32","H69.H2_37","H69.H2_39","H69.H2_4","H69.H2_53","H69.H2_54","H69.H2_55","H69.H2_56","H69.H2_60","H69.H2_63","H69.H2_64","H69.H2_66","H69.H2_67","H69.H2_68","H69.H2_7","H69.H2_71","H69.H2_74","H69.H2_75","H69.H2_76","H69.H2_77","H69.H2_78","H69.H2_79","H69.H2_82","H69.H2_83","H69.H2_86","H69.H2_88","H69.H2_89","H69.H2_9","H69.H2_91","H69.H2_92","H69.H2_94","H69.H2_95")]


#cmc.data <-CreateSeuratObject(txi$counts, min.cells = 3, min.features = 200, project = "CMC")
cmc.data <-CreateSeuratObject(resd, min.cells = 3, min.features = 200, project = "CMC")

###QC and selecting cells for further analysis

cmc.data[["percent.mt"]] <- PercentageFeatureSet(cmc.data, pattern = "^MT-")

# Visualize QC metrics as a violin plot
png(filename="geneRNA_MT_violin3.png",width = 800, height=600)

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


#error
#cmc.data@meta.data[grep("PBMC",rownames(cmc.data@meta.data)),]["orig.ident"]="PBMC"

library(SingleCellExperiment)
counts_matrix <- as.matrix(resd)
sce <- SingleCellExperiment(assays = list(counts = counts_matrix))

sce <- scran::computeSumFactors(sce)
sce <- scater::logNormCounts(sce)

sce <- scater::perCellQCMetrics(sce)

