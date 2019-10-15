inf1=open("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/BI/01reference/ensembl/Homo_sapiens.GRCh37.75.gtf")
lines=inf1.readlines()
for line in lines:
	if "#!" in line:
		continue
	print line()
inf1.close()


n=0
for line in inf1:
	n+=1	
	if "#!" in line:
		continue
	try:
		if len(line.split("/t")[1])>=1:
			print line.split("/t")
		elif n>10:
			break
	 
	
	except IndexError:
		print "IndexError"


