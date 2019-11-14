#===================================================================================
# step 2 annotation
#===================================================================================
inputTPM="/media/cytogenbi1/D2C67EE7C67ECAED/BI/07kallisto/results/191114CMC11_19kallisto_raw.csv"
def ENSG2GeneName(inputTPM):
	import os
	file1="/media/cytogenbi1/D2C67EE7C67ECAED/BI/02ref/ensembl38.97/GeneE38_97EXversion.txt"
	file2="/dt1/00ref/modGTF38/GeneE38_97Wthversion.txt"
	if os.path.isfile(file1):
		inf1=open(file1)
		glines=inf1.readlines()
	elif os.path.isfile(file2):
		inf1=open(file2)
		glines=inf1.readlines()
	else :
		print("There's no gtf file!!")
	inf1.close()
	geneD={}
	for line in glines:
		geneD[line.split("\t")[1]]=line.split("\t")[3].strip("\n")
	res1=open("%s"%(str(inputTPM)))
	resline=res1.readlines()
	res1.close()
	outputFile=inputTPM.split(".csv")[0]+"_geneAnno.csv"
	ouf=open("%s"%(str(outputFile)),"w")
	for rline in resline:
		rkey=rline.split(",")[0].replace('"','')
		geneN = geneD.get(rkey)
		print(geneN,"_",rkey)
		geneNa = str(geneN)+"_"+rkey
		ouf.write('"%s",%s'%(geneNa, ",".join(rline.split(",")[1:])))
	ouf.close()
#===================================================================================
	

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

	
##########################################
def ENSG2GeneName(inputTPM,outputFile):
	gtf=open("/home/cytogen-bi2/02ref/EnsHGmod.txt")
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
