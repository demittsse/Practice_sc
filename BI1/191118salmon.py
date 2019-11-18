import os, glob, time
from datetime import date

snode=2

salmonref="/media/cytogenbi1/D2C67EE7C67ECAED/BI/02ref/salmon38"

           
thisday=time.strftime("%y%m%d")
inputdir="/media/cytogenbi1/D2C67EE7C67ECAED/BI/03trim/04CMC1819"
#infFa=glob.glob("%s/*_1.fastq.gz"%(inputdir))
salmonoutdir="/media/cytogenbi1/D2C67EE7C67ECAED/BI/07salmon/06ENS38"
infFa=glob.glob("%s/*_1_val_1.fq.gz"%(inputdir))

ouf=open("/media/cytogenbi1/D2C67EE7C67ECAED/BI/00script/BI1/run/salmon%s.sh"%(thisday),"w")
for infile in infFa:
	if "fastq" in infile:
		fq=infile.split("/")[-1].split("_1.fastq.gz")[0]
	elif "_val_" in infile:
		fq=infile.split("/")[-1].split("_1_val_1.fq.gz")[0]
	print(fq)
	cm_map="salmon quant -i %s -l A -1 %s/%s_1_val_1.fq.gz -2 %s/%s_2_val_2.fq.gz -p 8 --validateMappings -o %s/%s\n\n\n" %(salmonref,inputdir,fq,inputdir,fq,salmonoutdir,fq)
	print(cm_map)
	ouf.write(cm_map)

ouf.close()
	break


prj1="CMC018_019_C1_191001"
genomedir="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/02ref/STAR"
samoutdir="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/04sam/CMC018019"

cm_trim = "/media/desktop-bi-16/D2C67EE7C67ECAED/BI/00source/TrimGalore-0.6.4/trim_galore %s %s --paired --phred33  -o /media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/04CMC1819/\n"%(infile,fastq2)

	ouf.write(cm_trim)

salmon quant -i /media/cytogenbi1/D2C67EE7C67ECAED/BI/02ref/salmon38 -l A -1 /media/cytogenbi1/D2C67EE7C67ECAED/BI/03trim/04CMC1819/CMC-018-14_1_val_1.fq.gz -2 /media/cytogenbi1/D2C67EE7C67ECAED/BI/03trim/04CMC1819/CMC-018-14_2_val_2.fq.gz -p 8 --validateMappings -o /media/cytogenbi1/D2C67EE7C67ECAED/BI/07salmon/06ENS38/CMC-018-14
