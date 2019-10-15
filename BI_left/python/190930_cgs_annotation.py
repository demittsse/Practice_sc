t1f=open("/media/cytogen-bi2/92E3-5E93/190926cmc_pbmc/CancerGeneCensus_tier1GRCH37.txt")
t2f=open("/media/cytogen-bi2/92E3-5E93/190926cmc_pbmc/CancerGeneCensus_tier2GRCH37.txt")
t1rl=t1f.readlines()
t2rl=t2f.readlines()

tier1 = {}
tier2 = {}

for t1line in t1rl:
	try :
		if "ENSG" in t1line.split(" ")[-3]:
			tier1[t1line.split(" ")[-3]]=t1line
		else :
			print t1line
	except :
		print t1line

	
