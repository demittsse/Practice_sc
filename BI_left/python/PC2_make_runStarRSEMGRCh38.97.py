
import os, glob, time
start=time.strftime("%y%m%d")
project_name="07SMC009_%s"%(start)


### import input file ###
#glob raw fastq file - .gz or not

#infFa=glob.glob("/home/cytogen-bi2/01raw/CMC-011_C1_32ea_190624/*_1.fastq.gz")
infFa=glob.glob("/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/*_1.fastq")

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
maindir="/dt2/"
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
### Commands of Trimming with Trim_galore, Mapping with Star ###
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
oufname="/home/cytogenbi2/00script/BI_left/run/%sstar.sh"%(project_name)
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
