library(Seurat)
## make data-frame of meta.data
meta1<-data.frame(matrix(nrow=length(colnames(df1)), ncol=3))
colnames(meta1)=c("Sample","tech","celltype")
meta1["Sample"]=colnames(df1)

meta1["tech"]="fluidigmC1"

meta1[grep("CMC",meta1$Sample),]["tech"]="fluidigmC1"
meta1[grep("PBMC",meta1$Sample),]["tech"]="smartSeq"

meta1[grep("CMC",meta1$Sample),]["celltype"]="CMC"
meta1[grep("PBMC",meta1$Sample),]["celltype"]="PBMC"


rownames(meta1)=meta1$Sample
meta1=meta1[2:3]

#df=subset(df, df$Celltype != "NA")
C1 <-CreateSeuratObject(counts=df1,meta.data=meta1)
