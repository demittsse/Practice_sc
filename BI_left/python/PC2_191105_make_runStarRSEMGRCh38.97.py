#================================================================================================================
## trimming & Star mapping ENSEMBL 38.97 # samtools 1.9
#================================================================================================================
##fastq.gz
import os, glob, time
start=time.strftime("%y%m%d")
project_name="06ENS3802_%s"%(start)


### import input file ###
#glob raw fastq file - .gz or not

#infFa=glob.glob("/home/cytogen-bi2/01raw/CMC-011_C1_32ea_190624/*_1.fastq.gz")
infFa=glob.glob("/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/*_1.fastq")

#trimmed

trim1=glob.glob("/home/cytogen-bi2/03trim/01CMC1113/*_1_val_1.fq.gz")
print len(trim1)
trim2=glob.glob("/home/cytogen-bi2/03trim/02pbmc/*_1_val_1.fq.gz")
print len(trim2)
trim3=glob.glob("/home/cytogen-bi2/03trim/03H69plate/*_1_val_1.fq.gz")
print len(trim3)
trim4=glob.glob("/home/cytogen-bi2/03trim/04CMC1819/*_1_val_1.fq.gz")
print len(trim4)
trim5=glob.glob("/home/cytogen-bi2/03trim/03H69C1/*_1_val_1.fq.gz")
print len(trim5)

## check every file processed for each step ; check "/" after path
def compRaw(rawpath,expath):
	import glob
	trim=glob.glob("%s*_1_val_1.fq.gz"%(expath))
	trimsample=[a.split("/")[-1].split("_1_val_1.fq.gz")[0] for a in trim]
	raw=glob.glob("%s*_1.fastq*"%(rawpath))
	rawsample=[r.split("/")[-1].split("_1.fastq")[0] for r in raw]
	trimset=set(trimsample)
	missing=[x for x in rawsample if x not in trimset]
	misPath=[line for line in missing if line in trim]
	print ",".join(missing)
	print "\n".join(misPath)
	return "\n".join(misPath)

expath1="/home/cytogen-bi2/03trim/03H69plate/"
rawpath1="/home/cytogen-bi2/01raw/NCI_H69_platebased_190614/"

trimFa=trim1+trim2+trim3+trim4+trim5
print "trimFa length = ", len(trimFa)
print "sum of trim1...trimN = ", len(trim1)+len(trim2)+len(trim3)+len(trim4)+len(trim5)
### Create output folder & executable bash file ###

#os.system("chmod 777 /home/cytogen-bi2/00script/BI_left/run/%sTrimStar%s.sh"%(start,project_name))
newTrimDir="/home/cytogen-bi2/02trim/%s"%(project_name)
newStarDir="/home/cytogen-bi2/03star/%s"%(project_name)
newBamDir="/home/cytogen-bi2/04bam/%s"%(project_name)
newSortDir="/home/cytogen-bi2/04sort/%s"%(project_name)
newQuantDir="/home/cytogen-bi2/05rsem/%s"%(project_name)
#newQuantDir="/home/cytogen-bi2/04star_salmon/%s"%(project_name)

##make trim directory
if os.path.isdir(newTrimDir) == 0:
	os.system("mkdir %s"%(newTrimDir))

if os.path.isdir(newStarDir) == 0:
	os.system("mkdir %s"%(newStarDir))

if os.path.isdir(newBamDir) == 0:
	os.system("mkdir %s"%(newBamDir))

if os.path.isdir(newSortDir) == 0:
	os.system("mkdir %s"%(newSortDir))

if os.path.isdir(newQuantDir) == 0:
	os.system("mkdir %s"%(newQuantDir))


#================================================================================================================
##Create ouput file
#================================================================================================================

ouf=open("/home/cytogen-bi2/00script/BI_left/run/%sTrimStar%s.sh"%(start,project_name),"w")
conda activate starrsem

#================================================================================================================
### Commands of Trimming with Trim_galore, Mapping with Star ###
#================================================================================================================

lineNum=0
for infile in trimFa:
	lineNum+=1
	if lineNum == 1:
		continue
	print "#",lineNum	
	trfq2 = infile.replace("_1_val_1.fq.gz","_2_val_2.fq.gz")
	sample = infile.split("/")[-1].split("_1_val_1.fq.gz")[0]
	star_out_file="/home/cytogen-bi2/03star/%s/%s"%(project_name, sample)
	rsem_out_file="/home/cytogen-bi2/05rsem/%s/%s"%(project_name, sample)
	cm_trimmed_star="STAR --runThreadN 2 --genomeDir /home/cytogen-bi2/00ref/STAR38 --sjdbGTFfile /home/cytogen-bi2/00ref/ensembl/GRCh38/Homo_sapiens.GRCh38.97.gtf --sjdbOverhang 150 --outFilterType BySJout --outFilterMultimapNmax 20 --alignSJoverhangMin 8 --alignSJDBoverhangMin 1 --outFilterMismatchNmax 999 --outFilterMismatchNoverReadLmax 0.02 --alignIntronMin 20 --outFileNamePrefix %s --alignIntronMax 1000000 --alignMatesGapMax 1000000 --readFilesIn %s,%s --readFilesCommand zcat --quantMode TranscriptomeSAM\n\n\n"%(star_out_file, infile, trfq2)
	cm_rsem="rsem-calculate-expression --bam --no-bam-output --single-cell-prior -p 1 %sAligned.toTranscriptome.out.bam /home/cytogen-bi2/00ref/STAR38/RSEM %sscQuant> %scrsem.log\n\n\n"%(star_out_file, rsem_out_file, rsem_out_file)
	print cm_trimmed_star
	print cm_rsem
	break
	ouf.write(cm_trimmed_star)
	ouf.write(cm_rsem)

ouf.close()

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

