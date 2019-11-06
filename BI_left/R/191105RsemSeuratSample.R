library(Seurat)
library(tximport)
df1<-read.table("/home/cytogen-bi2/00ref/gtfgtmod2.txt")
names(df1)<-c("chr", "TXNAME", "GENEID")
tx2gene <-df1[,c(3,2)]

dir<-setwd("/home/cytogen-bi2/05rsem/06ENS3802_191105")


samples = list.files ("/home/cytogen-bi2/05rsem/06ENS3802_191105", pattern = "Quant.genes.results")
files <- file.path(dir, samples)
all(file.exists(files))

sample_name=gsub("scQuant.genes.results","",samples)
names(files)<-sample_name
txi<-tximport(files,type = "rsem", tx2gene = tx2gene)
