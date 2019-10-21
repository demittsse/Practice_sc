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
#wLine2=[]
for inline in inf1r:
	cdgene=str(inline.split("\t")[0].split("_ENSG")[0])
	if cdgene in geneD.keys():
		#print inline
		wLine1="%s\t%s\t%s\t%s"%(inline.split("\t")[0],cdgene,geneD[cdgene],"\t".join(inline.split('\t')[1:]))
		print wLine1
		wLine.append(inline)
		#wLine2.append(wLine1)
		#break
		#

ouf1=open("/home/cytogen-bi2/analysis/191002/191002gene_filtered_raw.txt","w")
ouf1.write(inf1r[0])
ouf1.write("".join(wLine))
ouf1.close()

ouf2=open("/home/cytogen-bi2/analysis/191002/191002gene_filtered_labeled.txt","w")
ouf2.write("ENSG\tGene\tlabel\t%s"%inf1r[0].split("Gene")[1])
ouf2.write("".join(wLine2))
ouf2.close()

#=============================================
## R ggplot - bubble plot '/home/cytogen-bi2/00script/191002BubbleGene.R'
#=============================================
select="/home/cytogen-bi2/analysis/191002/191002gene_filtered_raw.txt"
label="/home/cytogen-bi2/analysis/191002/191002gene_filtered_labeled.txt"
df1<-read.table(select, header=T, row.names = 1)

CMC.011_35:PBMC.03_48

df5<-read.table("~/analysis/191002/191002gene_filtered_labeled_sum1000_filtered.txt", header = T, row.names = 1)
#df5_rem<-df5[,c(3:50)]

png(filename="/home/cytogen-bi2/analysis/191002/GeneExpression_xlabel.png",width = 800, height=600)
df5 %>%
  gather(GeneExpression, TPM, CMC.011_35:PBMC.03_48) %>%
  ggplot(aes(GeneExpression, Gene, size = TPM))+
  geom_point(col="#69b3a2")+theme(axis.text.x=element_text(angle=90, hjust=1))

dev.off()


