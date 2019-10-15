#gtf=open("/media/desktop-bi-16/92E3-5E93/190910/EnsHGmod.txt")
gtf=open("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/02ref/EnsHGmod.txt")
gtfline=gtf.readlines()
geneD={}
for line in gtfline:
	if "gene_name" in line:
		print line.split('"')[5]
		geneD[line.split('"')[1]]=line.split('"')[5]

inf1=open("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/02pbmc/190920PBMC_salmonTPM.csv")
resline=inf1.readlines()
inf1.close(); gtf.close()

inf2=open('/media/desktop-bi-16/92E3-5E93/190926cmc_pbmc/beforeAnno/190920PBMC_salmonTPM.csv')
resline=inf1.readlines()
inf1.close(); gtf.close()
)
resline2=inf2.readlines()
inf2.close(); gtf.close()

#ouf=open("/media/desktop-bi-16/92E3-5E93/190916/190916_CMC1113_salmonGene2.csv","w")
#ouf=open("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/02pbmc/190916pbmc_salmonENSG.csv","w")


geneL=[]
for rline in resline:
	rkey=rline.split(",")[0].replace('"','')
	geneN = geneD.get(rkey)
	if geneN in geneL:
		geneN = geneN+"_"+rkey
	else :
		geneL.append(geneN)
	print geneN
	ouf.write('"%s",%s'%(geneN, ",".join(rline.split(",")[1:])))

ouf.close()

##ENSG
#ouf2=open("/media/desktop-bi-16/92E3-5E93/190916/190917_CMC1113_geneENSG.csv","w")
ouf2=open("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/02pbmc/190920pbmc_salmonENSG.csv","w")
ouf2=open("/media/desktop-bi-16/92E3-5E93/190926cmc_pbmc/190926ITG_PBMC_CMC.csv","w")
for rline in resline2:
	rkey=rline.split(",")[0].replace('"','')
	geneN = geneD.get(rkey)
	geneNa = str(geneN)+"_"+rkey
	ouf2.write('"%s",%s'%(geneNa, ",".join(rline.split(",")[1:])))

ouf2.close()

##singular
#ouf3=open("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/02pbmc/190916pbmc_salmonENSG.csv","w")
ouf3=open("/media/desktop-bi-16/92E3-5E93/190926cmc_pbmc/190926singPBMC.csv","w")
for rline in resline2:
	rkey=rline.split(",")[0].replace('"','')
	geneN = geneD.get(rkey)
	geneNa = rkey+"_"+str(geneN)
	ouf3.write('%s\t%s'%(geneNa, "\t".join(rline.split(",")[1:])))

ouf3.close()

########################R outer join
cmcf='/media/desktop-bi-16/92E3-5E93/190916/190917_CMC1113_ENSG.csv'
pbmcf='/media/desktop-bi-16/92E3-5E93/190926cmc_pbmc/190926singPBMC.csv'
cmcd=read.csv(file=cmcf, sep = ",", header=T)
pbmcd=read.csv(file=pbmcf, sep = "\t", header=T)

intd=merge(cmcd, pbmcd, by='X_None')
names(intd)[1]="Gene"

write.csv(as.data.frame(intd), 
          file="/media/desktop-bi-16/92E3-5E93/190926cmc_pbmc/190926SingPBMC_SMC_salmon.csv",row.names = FALSE)

write.table(intd, file = "/media/desktop-bi-16/92E3-5E93/190926cmc_pbmc/190926SingPBMC_SMC_salmon.txt", row.names = FALSE)

################################################################################
resf=open("/media/desktop-bi-16/92E3-5E93/190910/190916_CMC1113_salmonCounts.csv")
ouf=open("/media/desktop-bi-16/92E3-5E93/sclc_CMC_salmonCountsGene.txt","w")
resline=resf.readlines()
plist=[]
for rline in resline:
	if "GENE" in rline:
		continue
	akey=rline.split("\t")[0]
	print akey
	genename=geneD.get(akey)
	print genename
	print genename, "\t".join(rline.split("\t")[1:])
	ouf.write("%s\t%s"%(genename, "\t".join(rline.split("\t")[1:])))
	

	try:
		
		#pline= "%s/t%s"%(geneD[rline.split["/t"][0]], rline.split("/t")[1:])
		#plist.append(pline)
		
	except:
		print geneD[rline.split["/t"][0]]
	#print rline.split("/t")[0]
	#break
