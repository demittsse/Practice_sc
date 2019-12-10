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

#================================================================================================================
### Mapping with Star, RSEM Quantification ###
#================================================================================================================
import os, glob, time
start=time.strftime("%y%m%d")
project_name="07SMC009_%s"%(start)


maindir="/media/cytogenbi1/D2C67EE7C67ECAED/"
trimFa=glob.glob("%s/02trim/07SMC009_191210/*_1_val_1.fq.gz"%maindir)
print("trimFa length = ", len(trimFa))

newTrimDir="%s02trim/%s"%(maindir,project_name)
newStarDir="%s03star/%s"%(maindir,project_name)
newQualiDir="%s03qualimap/%s"%(maindir,project_name)
newRsemDir="%s04rsem/%s"%(maindir,project_name)
newLogDir="%s04rsem/log_%s"%(maindir,project_name)

genomeDir="%s00ref/RSEM_STAR38"%(maindir)
sjdbGTFfile="%s00ref/ensembl38.97/Homo_sapiens.GRCh38.97.gtf"%(maindir)
rsemrefDir="%s00ref/RSEM_STAR38"%(maindir)

##Create ouput file

oufname="%s00script/run/starrsem%s.sh"%(maindir,project_name)
ouf=open(oufname,"w")

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


ouf.close()

os.system("chmod 755 %s"%(oufname))

print("tail %s"%(oufname))
print("%s>%s/%.log"%(oufname,newLogDir, project_name))

print("%s>%s/%.log"%(oufname,newLogDir, project_name))
#================================================================================================================
