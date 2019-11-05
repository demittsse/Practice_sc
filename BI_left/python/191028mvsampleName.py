trimD=glob.glob("/home/cytogen-bi2/03trim/04CMC1819/*.fq.gz")
for a in trimD:
	if "018-" in a:
		print "mv ",a," ",a.replace("018-","018_")
	else :
		print "mv ",a," ",a.replace("019-","019_")

