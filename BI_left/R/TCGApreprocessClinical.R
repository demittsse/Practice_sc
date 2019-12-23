library(dplyr)
library(ggplot2)
library(stringr)

#library(rhdf5)
#library(preprocessCore)

#----------------------------------------------------------------------------------------------#
### read TCGA Expression file and Meta file ###
#----------------------------------------------------------------------------------------------#
TCGAall=read.csv("191217TCGAAllcancer.csv", row.names=1, sep = ",", header = T)
meta1=read.csv("191217modTCGACllinical.csv", header = T)

# number of sample by cancertype

ggplot(data = meta1, aes(x = Cancertype)) +geom_bar()+theme_bw()+theme(axis.text.x=element_text(angle=90, hjust=1))

ggplot(meta1, aes( x = reorder(Cancertype,Cancertype,function(x)-length(x)))) + geom_bar() + theme_bw() + theme(axis.text.x=element_text(angle=90, hjust=1))

extractmeta1=meta1[,c('Cancertype','Sampletype')]
extractmeta1["Freq"]=1
freqSampletype=aggregate(Freq ~ Cancertype + Sampletype, data = extractmeta1, sum)
write.csv(freqSampletype,file="freqSampletype.csv")
## Sampletype X Cancertype

ggplot(extractmeta1, aes(fill=Sampletype, y=Freq, x=Cancertype))+
	geom_bar(position="stack", stat="identity") +
	theme(axis.text.x=element_text(angle=90, hjust=1))

## Sampletype X Cancertype with order
ggplot(extractmeta1, aes(fill=Sampletype, y=Freq, x=reorder(Cancertype,-extractmeta1$Freq,sum)))+
	geom_bar(position="stack", stat="identity") +
	theme(axis.text.x=element_text(angle=90, hjust=1))

## Sampletype X Cancertype with order
ggplot(extractmeta1, aes(fill=Sampletype, y=Freq, x=reorder(Cancertype,-extractmeta1$Freq,sum))) + 
	geom_bar(position="stack", stat="identity") + 
	scale_x_discrete(labels = function(x) str_wrap(x, width =15)) +
	theme(axis.text.x=element_text(angle=90, hjust=1))


#----------------------------------------------------------------------------------------------#
### intersect TCGA clinical data, ARCHS4
#----------------------------------------------------------------------------------------------#
BRCAclinical=read.csv("BRCAclinical.tsv", sep = "\t",header = T)

dfClinical<-function(meta1,clinical,cancertype){
									metaCancer=subset(meta1, Cancertype == cancertype)
									metajoin=inner_join(metaCancer, clinical, by=c("CaseID"="case_id"))
									metasapply=metajoin[, sapply(metajoin, nlevels) > 1]
									return (metasapply)
}

BRCAsapply=dfClinical(meta1,BRCAclinical,"Breast Invasive Carcinoma")

#----------------------------------------------------------------------------------------------#

#----------------------------------------------------------------------------------------------#
### unique demographic_id - specific column
#----------------------------------------------------------------------------------------------#
nrow(aggregate(numeric(nrow(BRCAsapply)), BRCAsapply[c("demographic_id","ajcc_staging_system_edition")],length))

length(unique(BRCAsapply$demographic_id))

##nrow_column function
nrow_column<-function(BRCAsapply,column_name){df=nrow(aggregate(numeric(nrow(BRCAsapply)), BRCAsapply[c("demographic_id",column_name)],length))
return (df)}

## for loop
for(cat in colBRCA) {print(cat)
print(nrow_column(BRCAsapply,cat))}

## print column name
for(cat in colBRCA){d=sprintf('"%s",',cat)
cat(d)}

## make unique matrix 
dist1=sqldf('select distinct demographic_id,ethnicity,gender,race,vital_status,year_of_birth,year_of_death,age_at_diagnosis,+
ajcc_pathologic_m,ajcc_pathologic_n,ajcc_pathologic_stage,ajcc_pathologic_t,+
ajcc_staging_system_edition,days_to_last_follow_up,icd_10_code,morphology,+
primary_diagnosis,prior_malignancy,prior_treatment,site_of_resection_or_biopsy,+
tissue_or_organ_of_origin,tumor_stage,year_of_diagnosis  from BRCAsapply order by demographic_id')

coldist1=colnames(dist1)

> nrow(dist1)
[1] 1093

summary(dist1$vital_status)
for (col in coldist1){
print (summary(dist1$col))}

>>> for a in collist:
...     print ('''summary(dist1$%s)'''%(a))

# couldn't summary
aggregate(demographic_id ~ primary_diagnosis,dist1,length)
aggregate(demographic_id ~ ajcc_staging_system_edition,dist1,length)
aggregate(demographic_id ~ synchronous_malignancy,dist1,length)

summary(dist1$days_to_birth)
summary(dist1$days_to_death)
summary(dist1$ethnicity)
summary(dist1$gender)
summary(dist1$race)
summary(dist1$vital_status)
summary(dist1$year_of_birth)
summary(dist1$year_of_death)
summary(dist1$age_at_diagnosis)
summary(dist1$ajcc_pathologic_m)
summary(dist1$ajcc_pathologic_n)
summary(dist1$ajcc_pathologic_stage)
summary(dist1$ajcc_pathologic_t)
summary(dist1$ajcc_staging_system_edition)
summary(dist1$days_to_last_follow_up)
summary(dist1$icd_10_code)
summary(dist1$morphology)
summary(dist1$primary_diagnosis)
summary(dist1$prior_malignancy)
summary(dist1$prior_treatment)
summary(dist1$site_of_resection_or_biopsy)
summary(dist1$synchronous_malignancy)
summary(dist1$tissue_or_organ_of_origin)
summary(dist1$treatment_or_therapy)
summary(dist1$treatment_type)
summary(dist1$tumor_stage)
summary(dist1$year_of_diagnosis)

> summary(dist1$vital_status)
Alive  Dead 
  941   152 

#----------------------------------------------------------------------------------------------#
### extract hdf5 files
#----------------------------------------------------------------------------------------------#
library(rhdf5)
library(preprocessCore)

ptcga="/media/cytogenbi1/e6ec2b5e-fd48-426e-82ab-0e7578d5b110/home/desktop-bi-16/TCGA"
setwd(ptcga)

TCGAh5<-H5Fopen("tcga_matrix.h5")
Tgene=h5read(TCGAh5, "meta/genes")
analytes.submitter_id=h5read(TCGAh5, "/meta/gdc_cases.samples.portions.analytes.submitter_id")
gdc_submitter_id=h5read(TCGAh5, "/meta/gdc_submitter_id")
gdc_cases.case_id=h5read(TCGAh5, "/meta/gdc_cases.case_id")

gdc_cases.project.project_i=h5read(TCGAh5, "/meta/dgdc_cases.project.project_id
gdc_cases.samples.portions.analytes.aliquots.aliquot_id=h5read(TCGAh5, "/meta/gdc_cases.samples.portions.analytes.aliquots.aliquot_id
gdc_cases.samples.portions.analytes.aliquots.submitter_id=h5read(TCGAh5, "/meta/gdc_cases.samples.portions.analytes.aliquots.submitter_id
gdc_cases.samples.portions.analytes.analyte_id=h5read(TCGAh5, "/meta/gdc_cases.samples.portions.analytes.analyte_id

site_locations = which(Tprimarysite %in% "Breast")
analytes.submitter_id[site_locations]

Tcancertype=h5read(TCGAh5,"/meta/cancertype")
Tsample_type=h5read(TCGAh5,"/meta/gdc_cases.samples.sample_type")

Tsample_id=h5read(TCGAh5,"/meta/sampleid")
Texpression = h5read(TCGAh5, "data/expression")

rownames(Texpression) = Tgene
colnames(Texpression) = Tsample_id

write.csv(Texpression,file="191217TCGAAllcancer.csv")


### make meta file "Sampleid","Barcode","Cancertype","Sampletype"
meta1<-data.frame(matrix(nrow=length(analytes.submitter_id), ncol=4))
colnames(meta1)=c("CaseID","Barcode","Cancertype","Sampletype")
#rownames(meta1)

meta1["Barcode"]=analytes.submitter_id
meta1["Cancertype"]=Tcancertype
meta1["Sampletype"]=Tsample_type
meta1["CaseID"]=gdc_cases.case_id

write.csv(meta1,file="191217modTCGACllinical.csv")
