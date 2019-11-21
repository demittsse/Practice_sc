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


#===================================================================================================#
191008selectSample.R
#===================================================================================================#

#df1<-read.table("/home/cytogen-bi2/analysis/CMCfiltered191008plus.csv",header = T, row.names = 1)
df2<-read.csv("/home/cytogen-bi2/analysis/CMCfiltered191008plus.csv",header = T, row.names = 1)

ctc=subset(df2,select=c(CMC.011_18,CMC.011_21,CMC.011_35,CMC.011_46))
pbmc=subset(df2,select=c(PBMC.03_34,PBMC.03_21,PBMC.03_46,PBMC.03_22,PBMC.03_32,PBMC.03_49,PBMC.03_4,PBMC.03_9,PBMC.03_15,PBMC.03_82,PBMC.03_55,PBMC.03_80,PBMC.03_1,PBMC.03_2,PBMC.03_14,PBMC.03_48))
cmc=subset(df2, select=c(CMC.011_08,CMC.011_11,CMC.011_13,CMC.011_19,CMC.011_23,CMC.011_24,CMC.011_27,CMC.011_28,CMC.011_29,CMC.011_31,CMC.011_33,CMC.011_34,CMC.011_37,CMC.011_38,CMC.011_40,CMC.011_41,CMC.011_45,CMC.011_47,CMC.011_49,CMC.011_55,CMC.011_57,CMC.011_58,CMC.011_59,CMC.011_67,CMC.011_76,CMC.011_77,CMC.013_40,CMC.011_22
))
dflog=log2(df2)
dflog[dflog == -Inf]<-0
dflog["sum"]=rowSums(dflog)
dfrm<-subset(dflog, sum>1)
write.table(dfrm,file="/home/cytogen-bi2/analysis/06.heatmap/00CMC191008total.csv", sep="\t", row.names=TRUE)

ctc["sum"]=rowSums(ctc)
ctcrm<-subset(ctc, sum>1)
write.csv(ctcrm,file="/home/cytogen-bi2/analysis/06.heatmap/01CMC191008ctc.csv")
write.csv(pbmc,file="/home/cytogen-bi2/analysis/CMCfiltered191008PBMC.csv",row.names = 1)

pbmc["sum"]=rowSums(pbmc)
pbmcrm<-subset(pbmc, sum>1)
write.csv(pbmcrm,file="/home/cytogen-bi2/analysis/06.heatmap/01CMC191008pbmc.csv")

cmc["sum"]=rowSums(cmc)
cmcrm<-subset(cmc, sum>1)
write.csv(cmcrm,file="/home/cytogen-bi2/analysis/06.heatmap/01CMC191008cmc.csv")

CMC.011_08,CMC.011_11,CMC.011_13,CMC.011_19,CMC.011_23,CMC.011_24,CMC.011_27,CMC.011_28,CMC.011_29,CMC.011_31,CMC.011_33,CMC.011_34,CMC.011_37,CMC.011_38,CMC.011_40,CMC.011_41,CMC.011_45,CMC.011_47,CMC.011_49,CMC.011_55,CMC.011_57,CMC.011_58,CMC.011_59,CMC.011_67,CMC.011_76,CMC.011_77,CMC.013_40,CMC.011_22

PBMC.03_34,PBMC.03_21,PBMC.03_46,PBMC.03_22,PBMC.03_32,PBMC.03_49,PBMC.03_4,PBMC.03_9,PBMC.03_15,PBMC.03_82,PBMC.03_55,PBMC.03_80,PBMC.03_1,PBMC.03_2,PBMC.03_14,PBMC.03_48
