import os, glob, time
start=time.strftime("%y%m%d")
project_name="07SMC009_%s"%(start)

maindir="/media/cytogenbi1/D2C67EE7C67ECAED/"
newTrimDir="%s02trim/%s"%(maindir,project_name)
newStarDir="%s03star/%s"%(maindir,project_name)
newQualiDir="%s03qualimap/%s"%(maindir,project_name)
newRsemDir="%s04rsem/%s"%(maindir,project_name)
newLogDir="%s04rsem/log_%s"%(maindir,project_name)

if os.path.isdir(newTrimDir) == 0:
	os.system("mkdir %s"%(newTrimDir))

if os.path.isdir(newStarDir) == 0:
	os.system("mkdir %s"%(newStarDir))

if os.path.isdir(newQualiDir) == 0:
	os.system("mkdir %s"%(newQualiDir))

if os.path.isdir(newRsemDir) == 0:
	os.system("mkdir %s"%(newRsemDir))

if os.path.isdir(newLogDir) == 0:
	os.system("mkdir %s"%(newLogDir))

##Create ouput file

oufname="%s00script/run/trim%s.sh"%(maindir,project_name)
ouf=open(oufname,"w")

infFa=glob.glob("/media/cytogenbi1/D2C67EE7C67ECAED/BI/02raw/SMC008_12ea/*_1.fastq.gz")

lineNum=0
for infile in infFa:
	lineNum+=1
	#if lineNum == 1: continue
	print("#",lineNum)	
	if "fastq.gz" in infile:
		fastq2= infile.split("_1.fastq.gz")[0]+"_2.fastq.gz"
	else :
		fastq2= infile.split("_1.fastq")[0]+"_2.fastq"
	cm_trim = "trim_galore %s %s --paired --phred33  -o %s\n\n\n"%(infile,fastq2,newTrimDir)
    print(cm_trim)
    ouf.write("#%s\n"%lineNum)
    ouf.write(cm_trim)

#================================================================================================================
"""
#=============================================
## trimming & Star mapping Gencode Ref
#=============================================
##fastq.gz
import os, glob, time
start=time.strftime("%y%m%d")
project_name="05CMC018_019"

### import input file ###
#infFa=glob.glob("/home/cytogen-bi2/01raw/CMC-011_C1_32ea_190624/*_1.fastq.gz")
infFa=glob.glob("/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/*_1.fastq")

### Create output folder & executable bash file ###

os.system("chmod 777 /home/cytogen-bi2/00script/run/%sTrimStar%s.sh"%(start,project_name))
newTrimDir="/home/cytogen-bi2/02trim/%s"%(project_name)
newStarDir="/home/cytogen-bi2/03star/%s"%(project_name)

if os.path.isdir(newTrimDir) == 0:
	os.system("mkdir %s"%(newTrimDir))
elif os.path.isdir(newStarDir) == 0:
	os.system("mkdir %s"%(newStarDir))

ouf=open("/home/cytogen-bi2/00script/run/%sTrimStar%s.sh"%(start,project_name),"w")

### Commands of Trimming with Trim_galore, Mapping with Star ###
for infile in infFa:
	if "fastq.gz" in infile:
		fastq2= infile.split("_1.fastq.gz")[0]+"_2.fastq.gz"
	else :
		fastq2= infile.split("_1.fastq")[0]+"_2.fastq"
	cm_trim = "/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore %s %s --paired --phred33  -o /home/cytogen-bi2/02trim/%s\n\n\n"%(infile,fastq2,project_name)
	print cm_trim
	fq=infile.split("/")[-1].split("_1.fastq.gz")[0]
	print fq
	cm_salmon="salmon quant -i /home/cytogen-bi2/00ref/salmon/Homo_sapiens.GRCh37.75_quasi_index -l A -1 /home/cytogen-bi2/02trim/%s/%s_1_val_1.fq.gz -2 /home/cytogen-bi2/02trim/%s/%s_2_val_2.fq.gz -p 8 --validateMappings -o %s\n\n\n" %(project_name,fq,project_name,fq,fq)
	trfq2 = infile.replace("_1_val_1.fq.gz","_2_val_2.fq.gz")
	cm_star="STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn %s,%s --outFileNamePrefix /home/cytogen-bi2/03star/%s/%s  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c\n\n\n"%(infile, trfq2, project_name, infile.split("/")[-1].split("_1_val_1.fq.gz")[0].split("_")[0])
	print cm_star
	ouf.write(cm_trim)
	ouf.write(cm_star)
	#ouf.write(cm_salmon)
	#print cm_salmon

ouf.close()
"""
