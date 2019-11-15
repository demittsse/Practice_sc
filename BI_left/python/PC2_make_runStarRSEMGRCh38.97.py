
#! Edited 2019.11.15
#================================================================================================================
## trimming & Star mapping ENSEMBL 38.97 # samtools 1.9
#================================================================================================================
##fastq.gz
import os, glob, time
start=time.strftime("%y%m%d")
project_name="06ENS3803_%s"%(start)


### import input file ###
#glob raw fastq file - .gz or not

#infFa=glob.glob("/home/cytogen-bi2/01raw/CMC-011_C1_32ea_190624/*_1.fastq.gz")
infFa=glob.glob("/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/*_1.fastq")

#trimmed

trim1=glob.glob("/dt1/03trim/01CMC1113/*_1_val_1.fq.gz")
print(len(trim1))
trim2=glob.glob("/dt1/03trim/02pbmc/*_1_val_1.fq.gz")
print(len(trim2))
trim3=glob.glob("/dt1/03trim/03H69plate/*_1_val_1.fq.gz")
print(len(trim3))
trim4=glob.glob("/dt1/03trim/04CMC1819/*_1_val_1.fq.gz")
print(len(trim4))
trim5=glob.glob("/dt1/03trim/03H69C1/*_1_val_1.fq.gz")
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
#newQuantDir="/home/cytogen-bi2/04star_salmon/%s"%(project_name)

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
##Create ouput file
#================================================================================================================
oufname="/home/cytogenbi2/00script/BI_left/run/%s.sh"%(project_name)
ouf=open(oufname,"w")
# conda activate scrna

#================================================================================================================
### Commands of Trimming with Trim_galore, Mapping with Star ###
#================================================================================================================
maindir="/dt2/"
newTrimDir="%s02trim/%s"%(maindir,project_name)
newStarDir="%s03star/%s"%(maindir,project_name)
newQualiDir="%s03qualimap/%s"%(maindir,project_name)
newRsemDir="%s04rsem/%s"%(maindir,project_name)

genomeDir=maindir+"/00ref/STAR38" 
sjdbGTFfile=maindir+"00ref/ensembl/GRCh38/Homo_sapiens.GRCh38.97.gtf"
rsemrefDir=maindir+"00ref/STAR38/RSEM"
newStarDir="/dt2/03star/06ENS3803_191111"

lineNum=0
for infile in trimFa:
	lineNum+=1
	if lineNum == 1: continue
	print("#",lineNum)	
	trfq2 = infile.replace("_1_val_1.fq.gz","_2_val_2.fq.gz")
	sample = infile.split("/")[-1].split("_1_val_1.fq.gz")[0]
	star_out_file="%s/%s"%(newStarDir, sample)
	quali_out_dir="%s/%s"%(newQualiDir, sample)
	rsem_out_file="%s/%s"%(newRsemDir, sample)
	cm_trimmed_star="STAR --runThreadN 2 --genomeDir %s --sjdbGTFfile %s --sjdbOverhang 150 --outFilterType BySJout --outFilterMultimapNmax 20 --alignSJoverhangMin 8 --alignSJDBoverhangMin 1 --outFilterMismatchNmax 999 --outFilterMismatchNoverReadLmax 0.02 --alignIntronMin 20 --outFileNamePrefix %s --alignIntronMax 1000000 --alignMatesGapMax 1000000 --readFilesIn %s,%s --readFilesCommand zcat --quantMode TranscriptomeSAM\n\n\n"%(str(genomeDir), str(sjdbGTFfile), star_out_file, infile, trfq2)
	cm_qualimap="qualimap rnaseq -outdir %s -a proportional -bam %sAligned.out.sam -gtf %s --java-mem-size=8G \n\n\n"%(quali_out_dir, star_out_file,sjdbGTFfile)
	cm_rsem="rsem-calculate-expression --bam --no-bam-output --single-cell-prior -p 1 %sAligned.toTranscriptome.out.bam %s %sscQuant> %sscrsem.log\n\n\n"%(star_out_file, str(rsemrefDir), rsem_out_file, rsem_out_file)
	#print(cm_trimmed_star)
	print(cm_qualimap)
	#print(cm_rsem)
	#ouf.write(cm_trimmed_star)
	#ouf.write("echo %s %s star alignment done!\n"%(project_name, sample))
	ouf.write(cm_qualimap)
	ouf.write("echo %s %s Qualimap done!\n"%(project_name, sample))
	#ouf.write(cm_rsem)
	#ouf.write("echo %s %s rsem done!\n"%(project_name, sample))

ouf.close()

os.system("chmod 755 /home/cytogenbi2/00script/BI_left/run/qualimap%s.sh"%(project_name))

print("tail %s"%(ouf_name))
print("%s>%s/%.log"%(ouf_name,newLogDir, project_name))

print("%s>%s/%.log"%(ouf_name,newLogDir, project_name))




#================================================================================================================
## Find "ALL DONE!"
#================================================================================================================

import glob
import re

s = str(input('Input Searching Text : '))

p = re.compile(s)
n=0
for i in glob.glob(r'/home/cytogen-bi2/03star/06ENS3801_191028/*Log.progress.out'):
    with open(i, 'r') as f:
        for x, y in enumerate(f.readlines(),1):
            m = p.findall(y)
            if m:
            	n+=1
                print('%s File %s [ %d ] Line Searching : %s' %(n,i,x,m))
                print('Full Line Text : %s' %y)
        print()


#================================================================================================================
## Trimming
#================================================================================================================

	if "fastq.gz" in infile:
		fastq2= infile.split("_1.fastq.gz")[0]+"_2.fastq.gz"
	else :
		fastq2= infile.split("_1.fastq")[0]+"_2.fastq"
	cm_trim = "/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore %s %s --paired --phred33  -o /home/cytogen-bi2/02trim/%s\n\n\n"%(infile,fastq2,project_name)	
	print cm_trim

