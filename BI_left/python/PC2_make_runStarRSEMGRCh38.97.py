
import os, glob, time
start=time.strftime("%y%m%d")
project_name="07SMC009_%s"%(start)

maindir="/media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/"

newTrimDir="%s02trim/%s"%(maindir,project_name)
newQCdir="%s01QC/%s"%(maindir,project_name)
newbeforeQCdir="%s01QC/%s/beforeQC"%(maindir,project_name)
newafterQCdir="%s01QC/%s/afterQC"%(maindir,project_name)
newStarDir="%s03star/%s"%(maindir,project_name)
newQualiDir="%s03qualimap/%s"%(maindir,project_name)
newRsemDir="%s04rsem/%s"%(maindir,project_name)
newLogDir="%s04rsem/log_%s"%(maindir,project_name)

if os.path.isdir(newTrimDir) == 0:
	os.system("mkdir %s"%(newTrimDir))

if os.path.isdir(newQCdir) == 0:
	os.system("mkdir %s"%(newQCdir))

if os.path.isdir(newbeforeQCdir) == 0:
	os.system("mkdir %s"%(newbeforeQCdir))

if os.path.isdir(newafterQCdir) == 0:
	os.system("mkdir %s"%(newafterQCdir))

if os.path.isdir(newStarDir) == 0:
	os.system("mkdir %s"%(newStarDir))

if os.path.isdir(newQualiDir) == 0:
	os.system("mkdir %s"%(newQualiDir))

if os.path.isdir(newRsemDir) == 0:
	os.system("mkdir %s"%(newRsemDir))

if os.path.isdir(newLogDir) == 0:
	os.system("mkdir %s"%(newLogDir))

##Create ouput file
import os, glob, time
start=time.strftime("%y%m%d")
project_name="07SMC009_%s"%(start)

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


## before trim qc
import os, glob, time
start=time.strftime("%y%m%d")
project_name="07SMC009_%s"%(start)
#project_name="07SMC009_191209"
maindir="/media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/"

newQCdir="%s01QC/%s"%(maindir,project_name)
newbeforeQCdir="%s01QC/%s/beforeQC"%(maindir,project_name)
newafterQCdir="%s01QC/%s/afterQC"%(maindir,project_name)
### import input file ###
#glob raw fastq file - .gz or not

#infFa=glob.glob("/home/cytogen-bi2/01raw/CMC-011_C1_32ea_190624/*_1.fastq.gz")

rawFa=glob.glob("/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/01raw/SMC009_30ea/*_1.fastq.gz")

oufname="%s00script/run/runbeforeQC%s.sh"%(maindir,project_name)
ouf=open(oufname,"w")
	 
lineNum=0
for tfile in rawFa:
	lineNum+=1
	#if lineNum == 1: continue
	print("#",lineNum)	
	if "fastq.gz" in tfile:
		fastq2= tfile.split("_1.fastq.gz")[0]+"_2.fastq.gz"
	else :
		fastq2= tfile.split("_1.fastq")[0]+"_2.fastq"
	
	#trfq2 = tfile.replace("_1_val_1.fq.gz","_2_val_2.fq.gz")
	cmtr="fastqc -o %s %s %s\n\n"%(newbeforeQCdir, tfile, fastq2)
	print(cmtr)
	ouf.write(cmtr)

ouf.close()

os.system("chmod 755 %s"%(oufname))

print("tail %s"%(oufname))


## after trim qc
import os, glob, time
start=time.strftime("%y%m%d")
project_name="07SMC009_%s"%(start)

#project_name="07SMC009_191209"
maindir="/media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/"

newQCdir="%s01QC/%s"%(maindir,project_name)
newbeforeQCdir="%s01QC/%s/beforeQC"%(maindir,project_name)
newafterQCdir="%s01QC/%s/afterQC"%(maindir,project_name)

trimFa=glob.glob("%s/02trim/07SMC009_191209/*_1_val_1.fq.gz"%maindir)
oufname="%s00script/run/runafterQC%s.sh"%(maindir,project_name)
ouf=open(oufname,"w")

lineNum=0
for tfile in trimFa:
	lineNum+=1
	#if lineNum == 1: continue
	print("#",lineNum)	
	fastq2 = tfile.replace("_1_val_1.fq.gz","_2_val_2.fq.gz")
	cmtr="fastqc -o %s %s %s\n\n"%(newafterQCdir, tfile, fastq2)
	print(cmtr)
	ouf.write(cmtr)

ouf.close()

os.system("chmod 755 %s"%(oufname))

print("tail %s"%(oufname))



# for file in `ls *.zip`; do unzip "${file}" -d "${file:0:-4}"; done


qcf =glob.glob("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/03qc/*/*/summary.txt")
qcline=[]
for files in qcf:
	qcff=open(files)
	qcline.append(qcff.readlines())

failD={}
qctotal =[]
for aa in qcline:
	for bb in aa:
		qctotal.append(bb)
			if "fail" in bb:
			
		break
ouf=open("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/03qc/resQC190917.txt","w")
for aaa in qctotal:
	if "FAIL" in aaa:
		wrine = "%s:%s\n"%(aaa.split("\t")[2].strip("\n"),aaa.split("\t")[1])
		print aaa.split("\t")[2].strip("\n"),":",aaa.split("\t")[1]
		ouf.write(wrine)
ouf.close()
		failD[aaa.split("\t")[2]]=aaa.split("\t")[1]
	
#trimmed

trim1=glob.glob("%s/03trim/01CMC1113/*_1_val_1.fq.gz"%maindir)
print(len(trim1))
trim2=glob.glob("%s/03trim/02pbmc/*_1_val_1.fq.gz"%maindir)
print(len(trim2))
trim3=glob.glob("%s/03trim/03H69plate/*_1_val_1.fq.gz"%maindir)
print(len(trim3))
trim4=glob.glob("%s/03trim/04CMC1819/*_1_val_1.fq.gz"%maindir)
print(len(trim4))
trim5=glob.glob("%s/03trim/03H69C1/*_1_val_1.fq.gz"%maindir)
print(len(trim5))

## check every file processed for each step ; check "/" after path
rawfile_Extension="_1.fastq"
trimfile_Extension="_1_val_1.fq.gz"
rsemQuant_Extension="scQuant.genes.results"
def compRaw(merge,rawPath,rawExtension,outPath,outExtension):
	import glob
	outFiles=glob.glob("%s*%s"%(outPath,outExtension))
	outsample=[a.split("/")[-1].split(outExtension)[0] for a in outFiles]
	if merge == 0:
		raw=glob.glob("%s*%s*"%(rawPath, rawExtension))
	elif merge == 1:
		raw=rawPath
	rawsample=[r.split("/")[-1].split(rawExtension)[0] for r in raw]
	outset=set(outsample)
	missing=[x for x in rawsample if x not in outset]
	misPath=[line for line in missing if line in outFiles]
	print(",".join(missing))
	print("\n".join(misPath))
	return "\n".join(misPath)


compRaw(1,trimFa, "_1_val_1.fq.gz", "/dt2/04rsem/06ENS3803_191111/", "scQuant.genes.results")


trimFa=trim1+trim2+trim3+trim4+trim5

maindir="/media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/"
trimFa=glob.glob("%s/02trim/07SMC009_191209/*_1_val_1.fq.gz"%maindir)
print("trimFa length = ", len(trimFa))
print("sum of trim1...trimN = ", len(trim1)+len(trim2)+len(trim3)+len(trim4)+len(trim5))
### Create output folder & executable bash file ###

#os.system("chmod 777 /home/cytogen-bi2/00script/BI_left/run/%sTrimStar%s.sh"%(start,project_name))
maindir="/media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/"
newTrimDir="%s02trim/%s"%(maindir,project_name)
newStarDir="%s03star/%s"%(maindir,project_name)
newQualiDir="%s03qualimap/%s"%(maindir,project_name)
newRsemDir="%s04rsem/%s"%(maindir,project_name)
newLogDir="%s04rsem/log_%s"%(maindir,project_name)


##make trim directory
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


#================================================================================================================
### Commands of Mapping with Star ###
#================================================================================================================
import os, glob, time
start=time.strftime("%y%m%d")
project_name="07SMC009_%s"%(start)


maindir="/media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/"
newTrimDir="%s02trim/%s"%(maindir,project_name)
newStarDir="%s03star/%s"%(maindir,project_name)
newQualiDir="%s03qualimap/%s"%(maindir,project_name)
newRsemDir="%s04rsem/%s"%(maindir,project_name)

genomeDir="/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/00ref/STAR38" 
sjdbGTFfile="/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/00ref/ensembl/GRCh38/Homo_sapiens.GRCh38.97.gtf"
rsemrefDir="/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/00ref/STAR38/RSEM"

trimFa=glob.glob("%s/02trim/07SMC009_191209/*_1_val_1.fq.gz"%maindir)

#================================================================================================================
##Create ouput file
#================================================================================================================
oufname="/home/cytogenbi2/00script/run/%sstar.sh"%(project_name)
ouf=open(oufname,"w")
# conda activate scrna

lineNum=0
for infile in trimFa:
	lineNum+=1
	#if lineNum == 1: continue
	print("#",lineNum)	
	trfq2 = infile.replace("_1_val_1.fq.gz","_2_val_2.fq.gz")
	sample = infile.split("/")[-1].split("_1_val_1.fq.gz")[0]
	star_out_file="%s/%s"%(newStarDir, sample)
	quali_out_dir="%s/%s"%(newQualiDir, sample)
	rsem_out_file="%s/%s"%(newRsemDir, sample)
	cm_trimmed_star="STAR --runThreadN 2 --genomeDir %s --sjdbGTFfile %s --sjdbOverhang 150 --outFilterType BySJout --outFilterMultimapNmax 20 --alignSJoverhangMin 8 --alignSJDBoverhangMin 1 --outFilterMismatchNmax 999 --outFilterMismatchNoverReadLmax 0.02 --alignIntronMin 20 --outFileNamePrefix %s --alignIntronMax 1000000 --alignMatesGapMax 1000000 --readFilesIn %s,%s --readFilesCommand zcat --quantMode TranscriptomeSAM\n\n\n"%(str(genomeDir), str(sjdbGTFfile), star_out_file, infile, trfq2)
	cm_qualimap="qualimap rnaseq -outdir %s -a proportional -bam %sAligned.out.sam -gtf %s --java-mem-size=8G \n\n\n"%(quali_out_dir, star_out_file,sjdbGTFfile)
	cm_rsem="rsem-calculate-expression --bam --no-bam-output --single-cell-prior -p 1 %sAligned.toTranscriptome.out.bam %s %sscQuant> %sscrsem.log\n\n\n"%(star_out_file, str(rsemrefDir), rsem_out_file, rsem_out_file)
	print(cm_trimmed_star)
	print(cm_qualimap)
	print(cm_rsem)
	ouf.write(cm_trimmed_star)
	ouf.write("echo %s %s star alignment done!\n"%(project_name, sample))
	ouf.write(cm_qualimap)
	ouf.write("echo %s %s Qualimap done!\n"%(project_name, sample))
	ouf.write(cm_rsem)
	ouf.write("echo %s %s rsem done!\n"%(project_name, sample))

ouf.close()

os.system("chmod 755 %s"%(oufname))

print("tail %s"%(oufname))
print("%s>%s/%.log"%(oufname,newLogDir, project_name))

print("%s>%s/%.log"%(ouf_name,newLogDir, project_name))
