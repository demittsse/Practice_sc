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

#ouf=open("/media/desktop-bi-16/92E3-5E93/190916/190916_CMC1113_salmonGene2.csv","w")
ouf=open("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/02pbmc/190916pbmc_salmonENSG.csv","w")

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
for rline in resline:
	rkey=rline.split(",")[0].replace('"','')
	geneN = geneD.get(rkey)
	geneNa = str(geneN)+"_"+rkey
	ouf2.write('"%s",%s'%(geneNa, ",".join(rline.split(",")[1:])))

ouf2.close()

##singular
ouf3=open("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/02pbmc/190916pbmc_salmonENSG.csv","w")

for rline in resline:
	rkey=rline.split(",")[0].replace('"','')
	geneN = geneD.get(rkey)
	ouf3.write('%s\t%s'%(geneN, "\t".join(rline.split(",")[1:])))

ouf3.close()


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
