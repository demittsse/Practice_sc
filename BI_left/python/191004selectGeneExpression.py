import os, system
inf1=open("/home/cytogen-bi2/analysis/191002/191001filteredRPSMT_INMT.txt")
inf1r=inf1.readlines();inf1.close()
genef=open("/home/cytogen-bi2/analysis/191004/191004selectGene_sec")
genef1r=genef.readlines()
geneD={}
for gene in genef1r:
	try:
		geneD[str(gene.split("\t")[0])]=str(gene.split("\t")[1].strip("\n"))
	except IndexError:
		print gene

wLine=[]
wLine2=[]
for inline in inf1r:
	cdgene=str(inline.split("\t")[0].split("_ENSG")[0])
	if cdgene in geneD.keys():
		#print inline
		wLine1="%s\t%s\t%s\t%s"%(inline.split("\t")[0],cdgene,geneD[cdgene],"\t".join(inline.split('\t')[1:]))
		print wLine1
		wLine.append(inline)
		wLine2.append(wLine1)


ouf1=open("/home/cytogen-bi2/analysis/191004/191004gene_filtered_raw.txt","w")
ouf1.write(inf1r[0])
ouf1.write("".join(wLine))
ouf1.close()

ouf2=open("/home/cytogen-bi2/analysis/191004/191004gene_filtered_labeled.txt","w")
ouf2.write("ENSG\tGene\tlabel\t%s"%inf1r[0].split("Gene")[1])
ouf2.write("".join(wLine2))
ouf2.close()

comp1=[]
for inline1 in inf1r:
	cdgene=str(inline.split("\t")[0].split("_ENSG")[0])
	if cdgene not in comp1:
		comp1.append(cdgene) 

#=============================================
## grep
#=============================================
  413  grep "ENSG00000282040" /home/cytogen-bi2/analysis/191002/191001filteredRPSMT_INMT.txt>>IDH_Tcell.txt
  414  grep "ENSG00000259903" /home/cytogen-bi2/analysis/191002/191001filteredRPSMT_INMT.txt>>IDH_Tcell.txt
  415  head Tissue_CHOL.txt
  416  cut -f2,3 IDH_Tcell.txt|sort|uniq 
  417  head IDH_Tcell.txt|sort|uniq 
  418  grep "TRBV7" /home/cytogen-bi2/analysis/191002/191001filteredRPSMT_INMT.txt>>IDH_Tcell.txt

#=============================================
## R ggplot - bubble plot '/home/cytogen-bi2/00script/191002BubbleGene.R'
#=============================================
select="/home/cytogen-bi2/analysis/191002/191002gene_filtered_raw.txt"
label="/home/cytogen-bi2/analysis/191002/191002gene_filtered_labeled.txt"
df1<-read.table(select, header=T, row.names = 1)

CMC.011_35:PBMC.03_48

df5<-read.table("~/analysis/191002/191002gene_filtered_labeled_sum1000_filtered.txt", header = T, row.names = 1)
#df5_rem<-df5[,c(3:50)]

png(filename="/home/cytogen-bi2/analysis/191004/GeneExpression_xlabel.png",width = 800, height=600)
df5 %>%
  gather(GeneExpression, TPM, CMC.011_35:PBMC.03_48) %>%
  ggplot(aes(GeneExpression, Gene, size = TPM))+
  geom_point(col="#69b3a2")+theme(axis.text.x=element_text(angle=90, hjust=1))

dev.off()
######

df5<-read.table("/home/cytogen-bi2/analysis/04.191004SelectGene2nd/191004gene_filtered_labeled.txt", header = T, row.names = 1)
#df5_rem<-df5[,c(3:50)]
df5rem2=subset(df5, select=-c(CMC.011_08,CMC.011_13,CMC.011_19,CMC.011_22,CMC.011_27,CMC.011_28,CMC.011_31,CMC.011_34,CMC.011_41,CMC.011_58,CMC.011_59,CMC.011_67,CMC.011_77))

png(filename="/home/cytogen-bi2/analysis/04.191004SelectGene2nd/Bubble_GeneExpression_xlabel.png",width = 800, height=600)
df5rem2 %>%
  gather(Cell, TPM, CMC.011_35:PBMC.03_48) %>%
  ggplot(aes(Cell, Gene, size = TPM))+
  geom_point(col="#69b3a2")+theme(axis.text.x=element_text(angle=90, hjust=1))

dev.off()
######




library(RColorBrewer)
library(ggplot2)
library(dplyr)

df6<-read.table("~/analysis/191004/191004gene_filtered_labeled.txt", header = T, row.names = 2)
head(df6rem,1)
df6rem=df6[,c(3:50)]

data4=as.matrix(df6rem)

png(filename="/home/cytogen-bi2/analysis/191004/GeneExpression_xlabel.png",width = 800, height=600)
heatmap(data4, scale="column",col= colorRampPalette(brewer.pal(8, "Blues"))(25))
dev.off()

png(filename="/home/cytogen-bi2/analysis/191004/GeneExpression_xlabelden.png",width = 800, height=1000)
heatmap(data4, scale="column",col= colorRampPalette(brewer.pal(8, "Blues"))(25))
dev.off()

df6rem2=subset(df6rem, select=-c(CMC.011_08,CMC.011_13,CMC.011_19,CMC.011_22,CMC.011_27,CMC.011_28,CMC.011_31,CMC.011_34,CMC.011_41,CMC.011_58,CMC.011_59,CMC.011_67,CMC.011_77))

data42=as.matrix(df6rem2)
png(filename="/home/cytogen-bi2/analysis/191004/GeneExpression_g800.png",width = 800, height=600)
heatmap(data42, scale="column",col= colorRampPalette(brewer.pal(8, "Blues"))(25))
dev.off()


ctcf="/home/cytogen-bi2/analysis/04.191004SelectGene2nd/CTC_Expression.txt"
tissuef="/home/cytogen-bi2/analysis/04.191004SelectGene2nd/Tissue_CHOL.txt"
idhf="/home/cytogen-bi2/analysis/04.191004SelectGene2nd/IDH_Tcell.txt"

####################
df7<-read.table(ctcf, header = T, row.names = 2)
df7rem=df7[,c(3:50)]

data5=as.matrix(df7rem)
png(filename="/home/cytogen-bi2/analysis/191004/GeneExpression_ctc.png",width = 1200, height=1100)
heatmap(data5, scale="column",col= colorRampPalette(brewer.pal(8, "Blues"))(25))
dev.off()


df7rem2=subset(df7rem, select=-c(CMC.011_08,CMC.011_13,CMC.011_19,CMC.011_22,CMC.011_27,CMC.011_28,CMC.011_31,CMC.011_34,CMC.011_41,CMC.011_58,CMC.011_59,CMC.011_67,CMC.011_77))
data52=as.matrix(df7rem2)
png(filename="/home/cytogen-bi2/analysis/191004/GeneExpression_ctc_g800.png",width = 800, height=600)
heatmap(data52, scale="column",col= colorRampPalette(brewer.pal(8, "Blues"))(25))
dev.off()
#####################
rm(df5)
rm(df5rem2)
df5<-read.table(idhf, header = T)
#df5_rem<-df5[,c(3:50)]
df5rem2=subset(df5, select=-c(CMC.011_08,CMC.011_13,CMC.011_19,CMC.011_22,CMC.011_27,CMC.011_28,CMC.011_31,CMC.011_34,CMC.011_41,CMC.011_58,CMC.011_59,CMC.011_67,CMC.011_77))

png(filename="/home/cytogen-bi2/analysis/04.191004SelectGene2nd/Bubble_GeneExpression_IDH.png",width = 800, height=600)
df5rem2 %>%
  gather(Cell, TPM, CMC.011_35:PBMC.03_48) %>%
  ggplot(aes(Cell, Gene, size = TPM))+
  geom_point(col="#69b3a2")+theme(axis.text.x=element_text(angle=90, hjust=1))

dev.off()


##################
df8<-read.table(tissuef, header = T, row.names = 2)
df8rem=df8[,c(3:50)]
data6=as.matrix(df8rem)
png(filename="/home/cytogen-bi2/analysis/191004/GeneExpression_tissue.png",width = 1200, height=1100)
heatmap(data6, scale="column",col= colorRampPalette(brewer.pal(8, "Blues"))(25))
dev.off()

df8rem2=subset(df8rem, select=-c(CMC.011_08,CMC.011_13,CMC.011_19,CMC.011_22,CMC.011_27,CMC.011_28,CMC.011_31,CMC.011_34,CMC.011_41,CMC.011_58,CMC.011_59,CMC.011_67,CMC.011_77))
data82=as.matrix(df8rem2)
png(filename="/home/cytogen-bi2/analysis/191004/GeneExpression_tissue_g800.png",width = 1200, height=1100)
heatmap(data82, scale="column",col= colorRampPalette(brewer.pal(8, "Blues"))(25))
dev.off()
####################
df9<-read.table(idhf, header = T, row.names = 1)
#df9rem=df9[,c(3:50)]
data7=as.matrix(df9)
png(filename="/home/cytogen-bi2/analysis/191004/GeneExpression_IDH.png",width = 1200, height=800)
heatmap(data7, scale="column",col= colorRampPalette(brewer.pal(8, "Blues"))(25))
dev.off()

df9rem2=subset(df9, select=-c(CMC.011_08,CMC.011_13,CMC.011_19,CMC.011_22,CMC.011_27,CMC.011_28,CMC.011_31,CMC.011_34,CMC.011_41,CMC.011_58,CMC.011_59,CMC.011_67,CMC.011_77))
data92=as.matrix(df9rem2)
png(filename="/home/cytogen-bi2/analysis/191004/GeneExpression_IDH_g800.png",width = 1200, height=1100)
heatmap(data92, scale="column",col= colorRampPalette(brewer.pal(8, "Blues"))(25))
dev.off()







