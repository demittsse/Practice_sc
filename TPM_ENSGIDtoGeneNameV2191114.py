#===================================================================================
# step annotation
#===================================================================================
inputTPM="/media/cytogenbi1/D2C67EE7C67ECAED/BI/07kallisto/results/191114CMC11_19kallisto_raw.csv"
def ENSG2GeneName(inputTPM):
	import os
	file1="/media/cytogenbi1/D2C67EE7C67ECAED/BI/02ref/ensembl38.97/GeneE38_97Wthversion.txt"
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
