library(Seurat)
library(tximport)
df1<-read.table("/home/cytogen-bi2/00ref/gtfgtmod2.txt")
names(df1)<-c("chr", "TXNAME", "GENEID")
tx2gene <-df1[,c(3,2)]

dir<-setwd("/home/cytogen-bi2/04star_salmon/06ENS3801_191031")
samples<-list.files(dir)

files <- file.path(dir, samples, "quant.sf")
all(file.exists(files))
txi<-tximport(files,type = "salmon", tx2gene = tx2gene)


