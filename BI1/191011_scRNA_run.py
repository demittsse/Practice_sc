import os, glob, time
from datetime import date
prj1="CMC018_019_C1_191001"
snode=2
genomedir="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/02ref/STAR"
samoutdir="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/04sam/CMC018019"




infFa=glob.glob("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/02raw/%s/*_1.fastq.gz"%(prj1))
           
thisday=time.strftime("%y%m%d")
ouf=open("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/00script/run/trim%s.sh"%(thisday),"w")
for infile in infFa:
	fastq2= infile.split("_1.fastq.gz")[0]+"_2.fastq.gz"
	cm_trim = "/media/desktop-bi-16/D2C67EE7C67ECAED/BI/00source/TrimGalore-0.6.4/trim_galore %s %s --paired --phred33  -o /media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/04CMC1819/\n"%(infile,fastq2)
	print cm_trim
	fq=infile.split("/")[-1].split("_1.fastq.gz")[0]
	print fq
	cm_map="salmon quant -i /media/desktop-bi-16/D2C67EE7C67ECAED/BI/02ref/salmon/Homo_sapiens.GRCh37.75_quasi_index -l A -1 /media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/04CMC1819/%s_1_val_1.fq.gz -2 /media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/04CMC1819/%s_2_val_2.fq.gz -p 8 --validateMappings -o %s\n\n\n" %(fq,fq,fq)
	print cm_map
	cm_star = "STAR --runThreadN %s --genomeDir %s  --readFilesIn /media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/04CMC1819/%s_1_val_1.fq.gz,/media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/04CMC1819/%s_2_val_2.fq.gz --readFilesCommand zcat --outFileNamePrefix %s"%(snode, genomedir,fq,fq, samoutdir)
	print cm_star
	ouf.write(cm_trim)
	ouf.write(cm_map)

ouf.close()
	break

