library(Seurat)
library(tximport)
df1<-read.table("/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/00ref/modGTF38/tx2geneWthversion.txt")
names(df1)<-c("chr", "TXNAME", "GENEID")
tx2gene <-df1[,c(3,2)]

dir<-setwd("/media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/04rsem/06ENS3803_191111")


samples = list.files ("/media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/04rsem/06ENS3803_191111", pattern = "Quant.genes.results")
files <- file.path(dir, samples)
all(file.exists(files))

sample_name=gsub("scQuant.genes.results","",samples)
names(files)<-sample_name
txi<-tximport(files,type = "rsem", tx2gene = tx2gene)

write.csv(as.data.frame(txi$counts), 
          file="/media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/04rsem/06ENS3803_Merge191120/191120rsemTPMENSG.csv")
