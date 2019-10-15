
#=============================================
## trimming 
#=============================================

import os, glob, time
infFa=glob.glob("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/02raw/NCI-H69_platebased_190614/*_1.fastq.gz")
ouf=open("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/03plate/runsal190923_plate.sh","w")
for infile in infFa:
	fastq2= infile.split("_1.fastq.gz")[0]+"_2.fastq.gz"
	cm_trim = "/media/desktop-bi-16/D2C67EE7C67ECAED/BI/00source/TrimGalore-0.6.4/trim_galore %s %s --paired --phred33  -o /media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/03plate/\n"%(infile,fastq2)
	#print cm_trim
	fq=infile.split("/")[-1].split("_1.fastq.gz")[0]
	print fq
	cm_map="salmon quant -i /media/desktop-bi-16/D2C67EE7C67ECAED/BI/02ref/salmon/Homo_sapiens.GRCh37.75_quasi_index -l A -1 /media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/03plate/%s_1_val_1.fq.gz -2 /media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/03plate/%s_2_val_2.fq.gz -p 8 --validateMappings -o %s\n\n\n" %(fq,fq,fq)
	print cm_map
	cm_star = "STAR --runThreadN %s --genomeDir %s  --readFilesIn %s,%s --outFileNamePrefix %s"%(snode, genomeDir,infile,fastq2, samoutdir)
	#ouf.write(cm_trim)
	#ouf.write(cm_map)

cm_trim="%s00source/TrimGalore-0.6.4/trim_galore %s_1%s %s_2%s --paired --phred33 --fastqc_args \"--outdir %s03qc/\" -o %s03trim/"%(basedir,sample_name,fqform,sample_name,fqform,basedir, basedir)
#cm_trim = "/media/desktop-bi-16/D2C67EE7C67ECAED/BI/00source/TrimGalore-0.6.4/trim_galore %s %s --paired --phred33 --fastqc_args \"--outdir /media/desktop-bi-16/D2C67EE7C67ECAED/BI/03qc/\" -o /media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/\n"%(infile,fastq2)
print cm_trim
#=============================================
## FastQC
#=============================================	
trFa=glob.glob("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/*_1_val_1.fq.gz")
ouf=open("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/runQC190917.sh","w")
for tfile in trFa:
	trfq2 = tfile.replace("_1_val_1.fq.gz","_2_val_2.fq.gz")
	cmtr="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/00source/FastQC/./fastqc -o /media/desktop-bi-16/D2C67EE7C67ECAED/BI/03qc %s %s\n\n"%(tfile, trfq2)
	print cmtr
	ouf.write(cmtr)

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
#=============================================
## Mapping
#=============================================
salFa=glob.glob("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/CMC-011*_1.*.gz")

for salf in salFa:
	fq2=salf.split("_1.fq.gz")[0]
"salmon quant -i /media/desktop-bi-16/D2C67EE7C67ECAED/BI/02ref/salmon/Homo_sapiens.GRCh37.75_quasi_index -l A \
         -1 %s \
         -2 %s \
         -p 8 --validateMappings -o 2-BY2-1" %(salf, fq2)
         

qfile=glob.glob("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/*/quant.sf")
infFa=glob.glob("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/02raw/CMC-011_C1_32ea_190624/*_1.fastq.gz")

fqlist=[]
for infile in infFa:
     fastq2= infile.split("_1.fastq.gz")[0].split("/")[-1]
     fqlist.append(fastq2)

>>> salist=[]
>>> for sline in qfile:
...     fq3=sline.split("/")[-2]
...     salist.append(fq3)
... 
>>> for aa in salist:
...     if aa not in fqlist:
...             print aa


cm_mapping = "STAR --runThreadN %s --genomeDir %s  --readFilesIn %s --outFileNamePrefix %s"%(snode, genomeDir,fastqpath, samoutdir)
print cm_mapping
#os.system(cm_mapping)

#=============================================
## Mapping rate
#=============================================
import os, glob

#qcf =glob.glob("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/01cmc1113/*/logs/salmon_quant.log")
qcf =glob.glob("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/04cmcpbmc/*/logs/salmon_quant.log")
qcline=[]
for files in qcf:
	qcff=open(files)
	for fline in qcff:
		if "Mapping rate = " in fline:
			print files.split("/")[-3],"|",fline.split("Mapping rate = ")[1].split("\n")[0]
		#apline="%s%s%s"%(files.split("/")[-3],"\n","".join(qcff.readlines()))
	qcline.append(apline)

totRD={}
qctotal =[]
for files in qcf:
	qcff=open(files)
	totRD[files.split("/")[-3]]="".join(qcff.readlines())
	
for item in totRD:
	if "Mapping rate = " in item:
		print item
		break
		#print key, item.split("Mapping rate = ")[1].split("\n")[0]
	
				
		break
#ouf=open("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/03qc/resQC190917.txt","w")
ouf=open("/media/desktop-bi-16/92E3-5E93/190930/190926PBMC_SMCresQC190917.txt","w")
for aaa in qctotal:
	if "FAIL" in aaa:
		wrine = "%s:%s\n"%(aaa.split("\t")[2].strip("\n"),aaa.split("\t")[1])
		print aaa.split("\t")[2].strip("\n"),":",aaa.split("\t")[1]
		ouf.write(wrine)
ouf.close()

for line in totRD.items():
     print str(line).split("Mapping rate = ")[1].split("%")[0]

#=============================================
## star
#=============================================

import os, glob, time

import os, glob, time

##input path
start=time.strftime("%y%m%d_%H%M")
basedir="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/"
project="NCI-H69_plate\ based_190614"
stardir=basedir+"00source/STAR-2.7.2b/bin/Linux_x86_64_static"
snode = 2
genomeDir = basedir+"02ref/STAR"
fastadir = basedir+"02raw/"+project+"/"

process = "map"
sample_name = "CMC-013_40"
fqform=".fastq.gz"

pairE = fastadir+sample_name+"_1"+fqform+","+fastadir+sample_name+"_2"+fqform
singleE =".fastq"
fastqpath = pairE

infFa=glob.glob("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/02raw/CMC-011_C1_32ea_190624/*_1.fastq.gz")




##sam output path
samdir=basediir+"04sam/"
samoutdir=samdir+sample_name+"/"
os.system("mkdir %s"%samoutdir)
##bam output path
bamdir = basedir+"05bam/"
bamOfile = bamdir+sample_name+"_trim_aligned.bam"
##sort bam output path
sortdir = basedir+"06sortedbam/"
sortOfile = sortdir+sample_name+".trim.sorted.bam"

import os, glob

ouf=open("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/04star/run190924_cmc1.sh","w")

trFa=glob.glob("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/01SMC1113/*_1_val_1.fq.gz")

for tfile in trFa:
	trfq2 = tfile.replace("_1_val_1.fq.gz","_2_val_2.fq.gz")
	cmtr="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/00source/STAR-2.7.2b/bin/Linux_x86_64/./STAR --genomeDir /media/desktop-bi-16/D2C67EE7C67ECAED/BI/02ref/STAR --readFilesIn %s,%s --outFileNamePrefix /media/desktop-bi-16/D2C67EE7C67ECAED/BI/04sam/%s  --runThreadN 1 --outFilterType BySJout --outFilterMultimapNmax 1 --alignSJoverhangMin 8 --alignSJDBoverhangMin 1 --outFilterMismatchNmax 999 --alignIntronMin 20 --alignIntronMax 1000000 --alignMatesGapMax 1000000 --outSAMtype BAM Unsorted --quantMode GeneCounts --readFilesCommand gunzip -c\n\n"%(tfile, trfq2, tfile.split("/")[-1].split("_1_val_1.fq.gz")[0])
	print cmtr
	ouf.write(cmtr)
	#ouf.write(cm_trim)
	#ouf.write(cm_map)

ouf.close()	


	#


cmtr="/home/desktop-bi/BI/00source/STAR-2.7.2b/bin/Linux_x86_64_static/./STAR --genomeDir /media/D2C67EE7C67ECAED/BI/02ref/STAR --readFilesIn %s,%s --outFileNamePrefix /home/desktop-bi/BI/04sam12/%s  --runThreadN 1 --outFilterType BySJout --outFilterMultimapNmax 1 --alignSJoverhangMin 8 --alignSJDBoverhangMin 1 --outFilterMismatchNmax 999 --alignIntronMin 20 --alignIntronMax 1000000 --alignMatesGapMax 1000000 --outSAMtype BAM Unsorted --quantMode GeneCounts\n\n"%(tfile, trfq2, tfile.split("/")[-1].split("_1_val_1.fq.gz")[0])

./STAR --genomeDir /media/desktop-bi-16/D2C67EE7C67ECAED/BI/02ref/STAR --readFilesIn %s,%s --outFileNamePrefix /media/desktop-bi-16/D2C67EE7C67ECAED/BI/04sam/%s  --runThreadN 4 --outFilterType BySJout --outFilterMultimapNmax 1 --alignSJoverhangMin 8 --alignSJDBoverhangMin 1 --outFilterMismatchNmax 999 --alignIntronMin 20 --alignIntronMax 1000000 --alignMatesGapMax 1000000 --outSAMtype BAM Unsorted --quantMode GeneCounts\n\n"%(tfile, trfq2, tfile.split("_1_val_1.fq.gz")[0])
	print cmtr
	ouf.write(cmtr)
	#ouf.write(cm_trim)
	#ouf.write(cm_map)

ouf.close()	
#=============================================
## sam to bam
#=============================================

cm_sam2bam = "samtools view -S -b %sAligned.out.sam > %s"%(samoutdir,bamOfile)
print cm_sam2bam
#os.system(cm_sam2bam)


#=============================================
## sorting bam
#=============================================
cm_sort = "samtools sort %s -o %s"%(bamOfile, sortOfile)
print cm_sort
#os.system(cm_sort)

#=============================================
## bam to sam
#=============================================
cm_bam2sam = "samtools view -h "


