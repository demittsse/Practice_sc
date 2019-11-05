#========================================================
## trimming & Star mapping Gencode Ref # samtools 1.9
#========================================================
##fastq.gz
import os, glob, time
start=time.strftime("%y%m%d")
project_name="05CMC018_019"

### import input file ###
#infFa=glob.glob("/home/cytogen-bi2/01raw/CMC-011_C1_32ea_190624/*_1.fastq.gz")
#infFa=glob.glob("/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/*_1.fastq")
#trimmed
infFa=glob.glob("/home/cytogen-bi2/03trim/04CMC1819/*_1_val_1.fq.gz")
samFa=glob.glob("/home/cytogen-bi2/03star/05CMC018_019/*.sam")
### Create output folder & executable bash file ###

#os.system("chmod 777 /home/cytogen-bi2/00script/BI_left/run/%sTrimStar%s.sh"%(start,project_name))
newTrimDir="/home/cytogen-bi2/02trim/%s"%(project_name)
newStarDir="/home/cytogen-bi2/03star/%s"%(project_name)
newBamDir="/home/cytogen-bi2/04bam/%s"%(project_name)
newSortDir="/home/cytogen-bi2/04sort/%s"%(project_name)

if os.path.isdir(newBamDir) == 0:
	os.system("mkdir %s"%(newBamDir))

if os.path.isdir(newSortDir) == 0:
	os.system("mkdir %s"%(newSortDir))



if os.path.isdir(newTrimDir) == 0:
	os.system("mkdir %s"%(newTrimDir))

if os.path.isdir(newStarDir) == 0:
	os.system("mkdir %s"%(newStarDir))

##Create ouf file
##ouf=open("/home/cytogen-bi2/00script/BI_left/run/%sTrimStar%s.sh"%(start,project_name),"w")
/home/cytogen-bi2/00source/salmon-latest_linux_x86_64/bin

### Commands of Trimming with Trim_galore, Mapping with Star ###
for infile in samFa:
	trfq2 = infile.replace("_1_val_1.fq.gz","_2_val_2.fq.gz")
	cm_bam2sam="samtools view -S -b %s > %s/%s_aligned.bam\n\n\n"%(infile,newBamDir,infile.split("/")[-1].split("Aligned.out.sam")[0])
	cm_sort="samtools sort %s/%s_aligned.bam -o %s/%s.sorted.bam\n\n\n"%(newBamDir,infile.split("/")[-1].split("Aligned.out.sam")[0],newSortDir,infile.split("/")[-1].split("Aligned.out.sam")[0])
	print cm_bam2sam
	print cm_sort


for infile in infFa:
	trfq2 = infile.replace("_1_val_1.fq.gz","_2_val_2.fq.gz")
	cm_sort="samtools sort /media/desktop-bi-16/D2C67EE7C67ECAED/BI/05bam/%saligned.bam -o /home/cytogen-bi2/04sort/%s.sorted.bam\n\n\n"%(infile.split("_1_val_1.fq.gz")[0],infile.split("_1_val_1.fq.gz")[0])
	cm_trimmed_star="STAR --genomeDir /home/cytogen-bi2/00ref/STAR --readFilesIn %s,%s --outFileNamePrefix /home/cytogen-bi2/03star/%s/%s  --runThreadN 1 --outFilterType BySJout --outFilterMultimapNmax 20 --alignSJoverhangMin 8 --alignSJDBoverhangMin 1 --outFilterMismatchNmax 999 --outFilterMismatchNoverReadLmax 0.02 --alignIntronMin 20 --alignIntronMax 1000000 --alignMatesGapMax 1000000--outSAMtype BAM Unsorted --readFilesCommand gunzip -c\n\n\n"%(infile,trfq2, project_name, infile.split("/")[-1].split("_1_val_1.fq.gz")[0].split("_")[0])

	print cm_sort
	
	print cm_trimmed_star
	break
	ouf.write(cm_trimmed_star)
	#ouf.write(cm_trim)
	#ouf.write(cm_star)
	#ouf.write(cm_salmon)
	#print cm_salmon

ouf.close()


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
