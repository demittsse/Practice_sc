#=============================================
## kallisto import
#=============================================

if (!requireNamespace("BiocManager", quietly = TRUE))
     install.packages("BiocManager")
     
BiocManager::install("tximport")
BiocManager::install("rhdf5")

library(tximport)

df1<-read.table("/media/cytogenbi1/D2C67EE7C67ECAED/BI/02ref/ensembl38.97/tx2geneWthversion.txt")
names(df1)<-c("chr", "TXNAME", "GENEID")
tx2gene <- df1[,c(3,2)]


dir<-"/media/cytogenbi1/D2C67EE7C67ECAED/BI/07kallisto/kallisto38_191106"


samples <- list.files(dir)

"""
library(tximportData)
files <- file.path(dir, "kallisto", samples, "abundance.tsv")
txi <- tximport(files, type = "kallisto", tx2gene = tx2gene)
"""

######!!!!!Caution!!!!!!!########
# check the file names
samples
samples <- samples[1:78]
#################################

files <- file.path(dir, samples, "abundance.tsv")


all(file.exists(files))
names(files)<-samples

library(tximport)
txi<-tximport(files,type = "kallisto", tx2gene = tx2gene)
names(txi)
head(txi$counts)

write.csv(as.data.frame(txi$counts), 
          file="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07kallisto/191029CMCPBMC_seuratTPM.csv")
setwd("/media/cytogenbi1/D2C67EE7C67ECAED/BI/07kallisto/results")
write.csv(as.data.frame(txi$counts), file="191114CMC11_19kallisto_raw.csv")
##################################################################
library(stringr)
resd1<-read.csv(file = '/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/04cmcpbmc/results/191016CMC011013018019_ENSG.csv',row.names=1, sep = ",", header=T)
colnames(resd1)<-str_replace_all(colnames(resd1),"CMC.018.","CMC.018_")
colnames(resd1)<-str_replace_all(colnames(resd1),"CMC.019.","CMC.019_")

df1<-read.csv("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/04cmcpbmc/results/191016CMCP
BMC_salmonTPM.csv")

colnames(df1)<-str_replace_all(colnames(df1),"CMC.018.","CMC.018_")
colnames(df1)<-str_replace_all(colnames(df1),"CMC.019.","CMC.019_")


