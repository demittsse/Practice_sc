# cd /media/desktop-bi-16/D2C67EE7C67ECAED/BI/02ref/kallisto
# kallisto index Homo_sapiens.GRCh38.cdna.all.fa -i Ens38.96 
# mv Ens38.96 kallisto.ref.Ens38.96.idx

#==========================================================
## trimming & Star mapping & kallisto quant BI 1 GRch38.96
#==========================================================
##fastq.gz
import os, glob, time
start=time.strftime("%y%m%d")
project_name="kallisto38_%s"%(start)

### import input file ###

#infFa=glob.glob("/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/*_1.fastq")
#trimFa=glob.glob("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/02pbmc/PBMC3*_1_val_1.fq.gz")

trim1=glob.glob("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/01CMC1113/*_1_val_1.fq.gz")
print len(trim1)
trim2=glob.glob("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/02pbmc/*_1_val_1.fq.gz")
print len(trim2)
trim3=glob.glob("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/03plate/*_1_val_1.fq.gz")
print len(trim3)
trim4=glob.glob("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/04CMC1819/*_1_val_1.fq.gz")
print len(trim4)
trim5=glob.glob("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim*_1_val_1.fq.gz")
print len(trim5)

#trimFa=trim1+trim2+trim3+trim4+trim5
trimFa=trim1+trim4
print "trimFa length = ", len(trimFa)
print "sum of trim1...trimN = ", len(trim1)+len(trim2)+len(trim3)+len(trim4)+len(trim5)

### Create output folder & executable bash file ###

maindir="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/"

newKallistoDir="%s07kallisto/%s"%(maindir,project_name)
if os.path.isdir(newKallistoDir) == 0:
	os.system("mkdir %s"%(newKallistoDir))

ouf=open("%s00script/BI1/run/runKallisto_%s.sh"%(maindir,project_name),"w")
	
### Commands of Mapping with Star ###
linenum=0
for infile in trimFa:
	linenum+=1
	#if linenum == 1: 
	#	continue
	#print infile
	#print infile.split("/")[-1].split("_1_val_1.fq.gz")[0]
	trfq2 = infile.replace("_1_val_1.fq.gz","_2_val_2.fq.gz")
	cm_kallisto="kallisto quant -i /media/desktop-bi-16/D2C67EE7C67ECAED/BI/02ref/kallisto/kallisto.ref.Ens38.96.idx -o %s/%s --bias %s %s\n\n\n"%(newKallistoDir,infile.split("/")[-1].split("_1_val_1.fq.gz")[0],infile, trfq2)
	print cm_kallisto
	ouf.write(cm_kallisto)


ouf.close()
os.system("chmod 777 %s00script/BI1/run/runKallisto_%s.sh"%(maindir,project_name))
print "%s00script/BI1/run/runKallisto_%s.sh"%(maindir,project_name)
	

