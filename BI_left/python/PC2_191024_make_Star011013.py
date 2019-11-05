#========================================================
## trimming & Star mapping Gencode Ref # samtools 1.9
#========================================================
##fastq.gz
import os, glob, time
start=time.strftime("%y%m%d")
project_name="01CMC011013_ENS"

### import input file ###
#glob raw fastq file - .gz or not

#infFa=glob.glob("/home/cytogen-bi2/01raw/CMC-011_C1_32ea_190624/*_1.fastq.gz")
infFa=glob.glob("/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/*_1.fastq")

#trimmed
trimFa=glob.glob("/home/cytogen-bi2/03trim/01CMC1113/*_1_val_1.fq.gz")


### Create output folder & executable bash file ###

#os.system("chmod 777 /home/cytogen-bi2/00script/BI_left/run/%sTrimStar%s.sh"%(start,project_name))
newTrimDir="/home/cytogen-bi2/02trim/%s"%(project_name)
newStarDir="/home/cytogen-bi2/03star/%s"%(project_name)
newBamDir="/home/cytogen-bi2/04bam/%s"%(project_name)
newSortDir="/home/cytogen-bi2/04sort/%s"%(project_name)

if os.path.isdir(newTrimDir) == 0:
	os.system("mkdir %s"%(newTrimDir))

if os.path.isdir(newStarDir) == 0:
	os.system("mkdir %s"%(newStarDir))

if os.path.isdir(newBamDir) == 0:
	os.system("mkdir %s"%(newBamDir))

if os.path.isdir(newSortDir) == 0:
	os.system("mkdir %s"%(newSortDir))



##Create output file
##ouf=open("/home/cytogen-bi2/00script/BI_left/run/%sTrimStar%s.sh"%(start,project_name),"w")

#salmon source bin path

salmon_path="/home/cytogen-bi2/00source/salmon-latest_linux_x86_64/bin"


### Commands of Trimming with Trim_galore, Mapping with Star ###
lineNum=0
for infile in trimFa:
	lineNum+=1
	if lineNum == 1:
		continue
	print "#",lineNum	
	trfq2 = infile.replace("_1_val_1.fq.gz","_2_val_2.fq.gz")
	cm_trimmed_star="STAR --genomeDir /home/cytogen-bi2/00ref/STAR --readFilesIn %s,%s --outFileNamePrefix /home/cytogen-bi2/03star/%s/%s  --runThreadN 1 --outFilterType BySJout --outFilterMultimapNmax 20 --alignSJoverhangMin 8 --alignSJDBoverhangMin 1 --outFilterMismatchNmax 999 --outFilterMismatchNoverReadLmax 0.02 --alignIntronMin 20 --alignIntronMax 1000000 --alignMatesGapMax 1000000--outSAMtype BAM Unsorted --readFilesCommand gunzip -c\n\n\n"%(infile,trfq2, project_name, infile.split("/")[-1].split("_1_val_1.fq.gz")[0])
	print cm_trimmed_star
	break
	ouf.write(cm_trimmed_star)
	#ouf.write(cm_trim)
	#ouf.write(cm_star)
	#ouf.write(cm_salmon)
	#print cm_salmon

ouf.close()

## bam to sam && sort bam
#glob samfile
import os, glob, time
samFa=glob.glob("/home/cytogen-bi2/03star/01CMC011013_ENS/*.sam")

for infile in samFa:
	cm_bam2sam="samtools view -S -b %s > %s/%s_aligned.bam\n\n\n"%(infile,newBamDir,infile.split("/")[-1].split("Aligned.out.sam")[0])
	cm_sort="samtools sort %s/%s_aligned.bam -o %s/%s.sorted.bam\n\n\n"%(newBamDir,infile.split("/")[-1].split("Aligned.out.sam")[0],newSortDir,infile.split("/")[-1].split("Aligned.out.sam")[0])
	print cm_bam2sam
	print cm_sort



	if "fastq.gz" in infile:
		fastq2= infile.split("_1.fastq.gz")[0]+"_2.fastq.gz"
	else :
		fastq2= infile.split("_1.fastq")[0]+"_2.fastq"
	cm_trim = "/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore %s %s --paired --phred33  -o /home/cytogen-bi2/02trim/%s\n\n\n"%(infile,fastq2,project_name)
	print cm_trim
	fq=infile.split("/")[-1].split("_1.fastq.gz")[0]
	print fq
	cm_salmon="salmon quant -i /home/cytogen-bi2/00ref/salmon/Homo_sapiens.GRCh37.75_quasi_index -l A -1 /home/cytogen-bi2/02trim/%s/%s_1_val_1.fq.gz -2 /home/cytogen-bi2/02trim/%s/%s_2_val_2.fq.gz -p 8 --validateMappings -o %s\n\n\n" %(project_name,fq,project_name,fq,fq)
	cm_star="STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/02trim/%s/%s_1_val_1.fq.gz,/home/cytogen-bi2/02trim/%s/%s_2_val_2.fq.gz --outFileNamePrefix /home/cytogen-bi2/03star/%s/%s  --runThreadN 1 --outSAMtype BAM Unsorted --readFilesCommand gunzip -c\n\n\n"%(project_name,fq,project_name,fq, project_name, infile.split("/")[-1].split("_1_val_1.fq.gz")[0].split("_")[0])

	#cm_trimmed_star="STAR --genomeDir /home/cytogen-bi2/00ref/STAR --readFilesIn %s,%s --outFileNamePrefix /home/cytogen-bi2/03star/%s/%s  --runThreadN 1 --outSAMtype BAM Unsorted --readFilesCommand gunzip -c\n\n\n"%(infile,trfq2, project_name, infile.split("/")[-1].split("_1_val_1.fq.gz")[0].split("_")[0])
