#=============================================
##salmon import
#=============================================
library(Seurat)
df1<-read.table("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/gtfgtmod2.txt")
names(df1)<-c("chr", "TXNAME", "GENEID")
tx2gene <- df1[,c(3,2)]

dir<-"/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/04cmcpbmc"
samples <- list.files(dir)

######!!!!!Caution!!!!!!!########
# check the file names
samples
samples <- samples[1:97]
#################################

files <- file.path(dir, samples, "quant.sf")

all(file.exists(files))
names(files)<-samples

library(tximport)
txi<-tximport(files,type = "salmon", tx2gene = tx2gene)
names(txi)
head(txi$counts)

write.csv(as.data.frame(txi$counts), 
          file="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/04cmcpbmc/results/191016CMCPBMC_salmonTPM.csv")


#=============================================
##salmon import
#=============================================
library(Seurat)
df1<-read.table("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/gtfgtmod2.txt")
names(df1)<-c("chr", "TXNAME", "GENEID")
tx2gene <- df1[,c(3,2)]

dir<-"/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/03plate"
samples <- list.files(dir)
samples <- samples[1:46]
files <- file.path(dir, samples, "quant.sf")
names(files)<-samples
all(file.exists(files))

library(tximport)
txi<-tximport(files,type = "salmon", tx2gene = tx2gene)
names(txi)
head(txi$counts)

write.csv(as.data.frame(txi$counts), 
          file="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/03plate/results/191015BY_salmonCounts.csv")
          
library(Seurat)
library(stringr)
resd1<-read.csv(file = '/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/04cmcpbmc/results/191016CMC011013018019_ENSG.csv',row.names=1, sep = ",", header=T)
colnames(resd1)<-str_replace_all(colnames(resd1),"CMC.018.","CMC.018_")
colnames(resd1)<-str_replace_all(colnames(resd1),"CMC.019.","CMC.019_")

df1<-read.csv("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/04cmcpbmc/results/191016CMCPBMC_salmonTPM.csv")

colnames(df1)<-str_replace_all(colnames(df1),"CMC.018.","CMC.018_")
colnames(df1)<-str_replace_all(colnames(df1),"CMC.019.","CMC.019_")

df3<-df1[c("X","CMC.011_18", "CMC.011_21", "CMC.011_35", "CMC.011_46","CMC.018_02", "CMC.018_63", "CMC.018_65", "CMC.018_70", "CMC.018_75", "PBMC.03_1", "PBMC.03_2", "PBMC.03_4", "PBMC.03_9", "PBMC.03_14", "PBMC.03_15", "PBMC.03_20", "PBMC.03_21", "PBMC.03_22", "PBMC.03_25", "PBMC.03_32", "PBMC.03_33", "PBMC.03_34", "PBMC.03_42", "PBMC.03_46", "PBMC.03_47", "PBMC.03_48", "PBMC.03_49", "PBMC.03_55", "PBMC.03_80", "PBMC.03_82", "CMC.011_29", "CMC.011_55", "CMC.018_16", "CMC.018_25", "CMC.018_26", "CMC.018_49", "CMC.019_42", "CMC.019_44", "CMC.011_08", "CMC.011_13", "CMC.011_19", "CMC.011_22", "CMC.011_23", "CMC.011_27", "CMC.011_28", "CMC.011_31", "CMC.011_33", "CMC.011_34", "CMC.011_37", "CMC.011_38", "CMC.011_40", "CMC.011_41", "CMC.011_45", "CMC.011_49", "CMC.011_57", "CMC.011_58", "CMC.011_59", "CMC.011_67", "CMC.011_76", "CMC.011_77", "CMC.018_14", "CMC.018_79", "CMC.018_15", "CMC.018_66", "CMC.018_96", "CMC.018_61", "CMC.018_72", "CMC.018_95", "CMC.011_11", "CMC.011_24", "CMC.011_47", "CMC.011_60", "CMC.013_40", "CMC.018_78", "CMC.018_88", "CMC.018_91", "CMC.019_30", "CMC.019_36","PBMC.04_10", "PBMC.04_12", "PBMC.04_13", "PBMC.04_16", "PBMC.04_18", "PBMC.04_2", "PBMC.04_23", "PBMC.04_24", "PBMC.04_25", "PBMC.04_35", "PBMC.04_4", "PBMC.04_43", "PBMC.04_45", "PBMC.04_49", "PBMC.04_54", "PBMC.04_55", "PBMC.04_58", "PBMC.04_63", "PBMC.04_8")]
write.csv(df3, file="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/04cmcpbmc/results/191018CMC011013018019_orderMorphology.csv")

