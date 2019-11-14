# afp://mglee@DiskStation.local/바이오연구소/팀내%20공유%20폴더/바이오3팀/개인폴더/이명교/Code/ref

#PC1
inf1=open("/media/cytogenbi1/D2C67EE7C67ECAED/BI/02ref/ensembl38.97/Homo_sapiens.GRCh38.97.gtf")
lines=inf1.readlines()

inf1.close()


llist=[]
for num in range(5,len(lines)):
	line=lines[num]
	if "transcript_id" in line:
		chrnum=line.split("\t")[0]
		info=line.split("\t")[8]
		gene_id=info.split('gene_id "')[1].split('";')[0]
		gene_version=info.split('gene_version "')[1].split('";')[0]
		transcript_id=info.split('transcript_id "')[1].split('";')[0]
		transcript_version=info.split('transcript_version "')[1].split('";')[0]
		lline1="%s\t%s.%s\t%s.%s\n"%(chrnum, gene_id, gene_version, transcript_id,transcript_version)
		llist.append(lline1)
	else:
		continue

ouf=open("/media/cytogenbi1/D2C67EE7C67ECAED/BI/02ref/ensembl38.97/modGTF38/tx2geneWthversion.txt","w")
ouf.write("".join(llist))


llist2=[]
for num in range(5,len(lines)):
	line=lines[num]
	if "transcript_id" in line:
		chrnum=line.split("\t")[0]
		info=line.split("\t")[8]
		gene_id=info.split('gene_id "')[1].split('";')[0]
		gene_version=info.split('gene_version "')[1].split('";')[0]
		transcript_id=info.split('transcript_id "')[1].split('";')[0]
		transcript_version=info.split('transcript_version "')[1].split('";')[0]
		lline1="%s\t%s\t%s\n"%(chrnum, gene_id, transcript_id)
		llist2.append(lline1)
	else:
		print(line)


ouf=open("/media/cytogenbi1/D2C67EE7C67ECAED/BI/02ref/ensembl38.97/modGTF38/tx2geneEXversion.txt","w")
ouf.write("".join(llist2))


#=======================  test  ======================= #
num=2877401
line=lines[num]
chrnum=line.split("\t")[0]
print(chrnum)
info=line.split("\t")[8]
gene_id=info.split('gene_id "')[1].split('";')[0]
print(gene_id)
gene_version=info.split("gene_version "")[1].split("";")[0]
print(gene_version)
transcript_id=info.split("transcript_id "")[1].split("";")[0]
print(transcript_id)
transcript_version=info.split("transcript_version "")[1].split("";")[0]
print(transcript_version)
lline1="%s\t%s.%s\t%s.%s\n"%(chrnum, gene_id, gene_version, transcript_id,transcript_version)

#======================================================= #
