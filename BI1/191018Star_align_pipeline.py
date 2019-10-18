#=============================================
## trimming & Star mapping & salmon quant BI 1
#=============================================
##fastq.gz
import os, glob, time
start=time.strftime("%y%m%d")
project_name="06CMC018_019Merge"

### import input file ###

infFa=glob.glob("/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/*_1.fastq")
trimFa=glob.glob("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/01SMC1113/*.fq.gz")
### Create output folder & executable bash file ###

os.system("chmod 777 /home/cytogen-bi2/00script/run/%sTrimStar%s.sh"%(start,project_name))
newTrimDir="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/%s"%(project_name)
newStarDir="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/04sam/%s"%(project_name)
newSortBamDir="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/06sortedbam/%s"%(project_name)
newQuantDir="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/08star_salmon/%s"%(project_name)

if os.path.isdir(newTrimDir) == 0:
	os.system("mkdir %s"%(newTrimDir))


if os.path.isdir(newStarDir) == 0:
	os.system("mkdir %s"%(newStarDir))


if os.path.isdir(newSortBamDir) == 0:
	os.system("mkdir %s"%(newSortBamDir))


if os.path.isdir(newQuantDir) == 0:
	os.system("mkdir %s"%(newQuantDir))


ouf=open("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/00script/BI1/run/%sStar%s.sh"%(start,project_name),"w")

### Commands of Trimming with Trim_galore, Mapping with Star ###
for infile in infFa:
	if "fastq.gz" in infile:
		fastq2= infile.split("_1.fastq.gz")[0]+"_2.fastq.gz"
	else :
		fastq2= infile.split("_1.fastq")[0]+"_2.fastq"
	cm_trim = "/media/desktop-bi-16/D2C67EE7C67ECAED/BI/00source/TrimGalore-0.6.4/trim_galore %s %s --paired --phred33  -o /home/cytogen-bi2/02trim/%s\n\n\n"%(infile,fastq2,project_name)
	print cm_trim
	if "fastq.gz" in infile:
		fq=infile.split("/")[-1].split("_1.fastq.gz")[0]
	else :
		fq=infile.split("/")[-1].split("_1.fastq")[0]
	print fq

### Commands of Mapping with Star ###
for infile in trimFa:
	print infile
	print infile.split("/")[-1].split("_1_val_1.fq.gz")[0]
	trfq2 = infile.replace("_1_val_1.fq.gz","_2_val_2.fq.gz")
	cm_star="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/00source/STAR-2.7.2b/bin/Linux_x86_64_static/./STAR --genomeDir /media/desktop-bi-16/D2C67EE7C67ECAED/BI/02ref/STAR --readFilesIn %s,%s --outFileNamePrefix /media/desktop-bi-16/D2C67EE7C67ECAED/BI/04sam/%s/%s  --runThreadN 1 --outFilterType BySJout --outFilterMultimapNmax 20 --alignSJoverhangMin 8 --alignSJDBoverhangMin 1 --outFilterMismatchNmax 999 --outFilterMismatchNoverReadLmax 0.02 --alignIntronMin 20 --alignIntronMax 1000000 --alignMatesGapMax 1000000 --outSAMtype BAM Unsorted --readFilesCommand gunzip -c\n\n\n"%(infile, trfq2, project_name, infile.split("/")[-1].split("_1_val_1.fq.gz")[0])
	print cm_star
	cm_sort="samtools sort /media/desktop-bi-16/D2C67EE7C67ECAED/BI/05bam/%saligned.bam -o /media/desktop-bi-16/D2C67EE7C67ECAED/BI/06sortedbam/%s.sorted.bam\n\n\n"%(infile.split("_1_val_1.fq.gz")[0],infile.split("_1_val_1.fq.gz")[0])
	print cm_sort
	cm_salmon="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/00source/salmon-latest_linux_x86_64/bin/./salmon quant -t /media/desktop-bi-16/D2C67EE7C67ECAED/BI/BI/01reference/ensembl/Homo_sapiens.GRCh37.75.dna.primary_assembly.fa -l A -a /media/desktop-bi-16/D2C67EE7C67ECAED/BI/06sortedbam/%s.sorted.bam -o /media/desktop-bi-16/D2C67EE7C67ECAED/BI/08star_salmon/%s\n\n\n" %(infile.split("_1_val_1.fq.gz")[0],infile.split("_1_val_1.fq.gz")[0])
	print cm_salmon
	break
	#ouf.write(cm_trim)
	ouf.write(cm_star)
	#ouf.write(cm_salmon)
	#print cm_salmon

ouf.close()

