#===================================================================================
##Example IDs (file): [ENST00000631435.1, ENST00000434970.2, ENST00000448914.1, ...]
#===================================================================================

#PC2
inf1=open("/home/cytogenbi2/00ref/ensembl/GRCh38/Homo_sapiens.GRCh38.97.gtf")
#PC1
inf1=open("/media/cytogenbi1/D2C67EE7C67ECAED/BI/02ref/ensembl38.97/Homo_sapiens.GRCh38.97.gtf")
lines=inf1.readlines()
for line in lines:
	if "#!" in line:
		continue
	print line
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

['KI270713.1', 'ensembl', 'stop_codon', '35914', '35916', '.', '+', '0', 'gene_id "ENSG00000268674"; gene_version "2"; transcript_id "ENST00000601199"; transcript_version "2"; exon_number "1"; gene_name "AC213203.1"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "AC213203.1-201"; transcript_source "ensembl"; transcript_biotype "protein_coding"; tag "basic"; transcript_support_level "NA";\n']

