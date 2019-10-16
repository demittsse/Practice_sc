def ENSG2GeneName(inputTPM,outputFile):
	gtf=open("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/02ref/EnsHGmod.txt")
	gtfline=gtf.readlines()
	geneD={}
	for line in gtfline:
		if "gene_name" in line:
			print line.split('"')[5]
			geneD[line.split('"')[1]]=line.split('"')[5]		
	inf1=open("%s"%(str(inputTPM)))
	resline=inf1.readlines()
	inf1.close(); gtf.close()
	ouf=open("%s"%(str(outputFile)),"w")
	for rline in resline:
		rkey=rline.split(",")[0].replace('"','')
		geneN = geneD.get(rkey)
		geneNa = str(geneN)+"_"+rkey
		ouf.write('"%s",%s'%(geneNa, ",".join(rline.split(",")[1:])))
	ouf.close()
