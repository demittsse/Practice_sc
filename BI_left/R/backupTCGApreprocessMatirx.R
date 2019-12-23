library(dplyr)
library(ggplot2)
library(stringr)

#library(rhdf5)
#library(preprocessCore)

### read TCGA Expression file and Meta file ###
TCGAall=read.csv("191217TCGAAllcancer.csv", row.names=1, sep = ",", header = T)
meta1=read.csv("191217modTCGACllinical.csv", header = T)


# number of sample by cancertype

ggplot(data = meta1, aes(x = Cancertype)) +geom_bar()+theme_bw()+theme(axis.text.x=element_text(angle=90, hjust=1))

ggplot(meta1, aes( x = reorder(Cancertype,Cancertype,function(x)-length(x)))) + geom_bar() + theme_bw() + theme(axis.text.x=element_text(angle=90, hjust=1))



extractmeta1=meta1[,c('Cancertype','Sampletype')]
extractmeta1["Freq"]=1
freqSampletype=aggregate(Freq ~ Cancertype + Sampletype, data = extractmeta1, sum)
write.csv(freqSampletype,file="freqSampletype.csv")

			       
freqSampletype %>% spread(key='Cancertype', value='Freq')-> freqSample2
write.csv(freqSample2,file="freqSample2.csv")
## Sampletype X Cancertype

ggplot(extractmeta1, aes(fill=Sampletype, y=Freq, x=Cancertype))+
+ geom_bar(position="stack", stat="identity") +
+ theme(axis.text.x=element_text(angle=90, hjust=1))

## Sampletype X Cancertype with order
ggplot(extractmeta1, aes(fill=Sampletype, y=Freq, x=reorder(Cancertype,-extractmeta1$Freq,sum)))+
	geom_bar(position="stack", stat="identity") +
	theme(axis.text.x=element_text(angle=90, hjust=1))

## Sampletype X Cancertype with order
ggplot(extractmeta1, aes(fill=Sampletype, y=Freq, x=reorder(Cancertype,-extractmeta1$Freq,sum))) + 
	geom_bar(position="stack", stat="identity") + 
	scale_x_discrete(labels = function(x) str_wrap(x, width =15)) +
	theme(axis.text.x=element_text(angle=90, hjust=1))




# cancerfreq=data.frame(cbind(unique(meta1$Cancertype),table(meta1$Cancertype)))
# table(meta1$Sampletype,meta1$Cancertype)
# sqldf('select count(Sampletype), count(Cancertype) from meta1')
extractmeta1=meta1[,c('Cancertype','Sampletype')]
extractmeta1["Freq"]=1
freqSampletype=aggregate(Freq ~ Cancertype + Sampletype, data = extractmeta1, sum)
write.csv(freqSampletype,file="freqSampletype.csv")
			 

			 
			 

### extract hdf5 files


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

### read clinical data
paad=read.csv("PAADclinical.tsv", sep = "\t",header = T)
colnames(paad)

intersect(paad$case_id,gdc_cases.case_id)

#intersect(paad$diagnosis_id)
#intersect(paad$treatment_id)




### make meta file "Sampleid","Barcode","Cancertype","Sampletype"
meta1<-data.frame(matrix(nrow=length(analytes.submitter_id), ncol=4))
colnames(meta1)=c("CaseID","Barcode","Cancertype","Sampletype")
#rownames(meta1)

meta1["Barcode"]=analytes.submitter_id
meta1["Cancertype"]=Tcancertype
meta1["Sampletype"]=Tsample_type
meta1["CaseID"]=gdc_cases.case_id

write.csv(meta1,file="191217modTCGACllinical.csv")

# ==> "191217modTCGACllinical.csv"
# 5838f42e-5238-4ff1-bb82-05e3e3e5abdc


# gdc file id
#> head(Tsample_id)
#[1] "3DFF72D2-F292-497E-ACE3-6FAA9C884205"
#[2] "B1E54366-42B9-463C-8615-B34D52BD14DC"
#[3] "473713F7-EB41-4F20-A37F-ACD209E3CB75"
#[4] "11F18F54-9B33-4C33-BDF9-0F093F4F3336"
#[5] "136B7576-1108-4FA3-8254-6069F0CA879A"
#[6] "E81FA8B7-3FFE-4F73-94AF-0B5257D7F81A"

# ==> PAADclinical.tsv <==
#"37daa7f7-df62-5f38-8035-c17d2a8a931b"


### read TCGA Expression file and Meta file ###
TCGAall=read.csv("191217TCGAAllcancer.csv", row.names=1, sep = ",", header = T)
meta1=read.csv("191217modTCGACllinical.csv", header = T)



TCGA_bar=colnames(TCGAall)
meta1["BarcodeMod"]=str_replace_all(meta1$Barcode,"-",".")


> head(meta1)
  X              Barcode                     Cancertype    Sampletype
1 1 TCGA-DD-AAVP-01A-11R Liver Hepatocellular Carcinoma Primary Tumor
2 2 TCGA-KK-A7B2-01A-12R        Prostate Adenocarcinoma Primary Tumor
3 3 TCGA-DC-6158-01A-11R          Rectum Adenocarcinoma Primary Tumor
4 4 TCGA-DD-A4NP-01A-11R Liver Hepatocellular Carcinoma Primary Tumor
5 5 TCGA-HQ-A5ND-01A-11R   Bladder Urothelial Carcinoma Primary Tumor
6 6 TCGA-HT-A614-01A-11R       Brain Lower Grade Glioma Primary Tumor
            BarcodeMod
1 TCGA.DD.AAVP.01A.11R
2 TCGA.KK.A7B2.01A.12R
3 TCGA.DC.6158.01A.11R
4 TCGA.DD.A4NP.01A.11R
5 TCGA.HQ.A5ND.01A.11R
6 TCGA.HT.A614.01A.11R


> colnames(meta1)
[1] "X"          "Barcode"    "Cancertype" "Sampletype" "BarcodeMod"

> table(meta_breast$Sampletype)

                       Additional - New Primary                                               0 
                          Additional Metastatic                                               0 
                                     Metastatic                                               7 
Primary Blood Derived Cancer - Peripheral Blood                                               0 
                                  Primary Tumor                                            1127 
                                Recurrent Tumor                                               0 
                            Solid Tissue Normal                                             112 


meta_breast=subset(meta1, Cancertype == "Breast Invasive Carcinoma")
meta_breast_primary=subset(meta_breast, Sampletype=="Primary Tumor")
meta_breast_normal=subset(meta_breast, Sampletype=="Solid Tissue Normal")
meta_breast_metastatic=subset(meta_breast, Sampletype=="Metastatic")



Bar_BRCANormal=meta_breast_normal$BarcodeMod
Bar_BRCAmeta=meta_breast_metastatic$BarcodeMod
Bar_BRCAPrimary=meta_breast_primary$BarcodeMod

Bar_BRCATumor=c(Bar_BRCAmeta, Bar_BRCAPrimary)

#==== Metastatic 7 + Primary Tumor 1127 vs Solid Tissue Normal ====#

subBRCATumor=TCGAbreast[,Bar_BRCATumor]
subBRCANormal=TCGAbreast[,Bar_BRCANormal]



# other cancer type
> table(meta_ExBRCA$Sampletype)

                       Additional - New Primary 
                                             11 
                          Additional Metastatic 
                                              1 
                                     Metastatic 
                                            387 
Primary Blood Derived Cancer - Peripheral Blood 
                                            126 
                                  Primary Tumor 
                                           8835 
                                Recurrent Tumor 
                                             50 
                            Solid Tissue Normal 
                                            628 


ExBRCA=read.csv("/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/BreastCancer/data/ReCount2OverARCHS4/191209TCGAExceptBreastTissue_log2.csv", row.names=1, sep = ",", header = T)

meta_ExBRCA=subset(meta1, Cancertype != "Breast Invasive Carcinoma")
meta_ExBRCA_primary=subset(meta_ExBRCA, Sampletype=="Primary Tumor")
meta_ExBRCA_normal=subset(meta_ExBRCA, Sampletype=="Solid Tissue Normal")
meta_ExBRCA_metastatic=subset(meta_ExBRCA, Sampletype=="Metastatic")
meta_ExBRCA_recurrent=subset(meta_ExBRCA, Sampletype=="Recurrent Tumor")
meta_ExBRCA_peripheral=subset(meta_ExBRCA, Sampletype=="Primary Blood Derived Cancer - Peripheral Blood")

##include Additional - New Primary(11)>> primary , Additional Metastatic(1) >>metastatic
meta_breast_primary2=meta_ExBRCA[grep("Primary", meta_ExBRCA$Sampletype),]
meta_ExBRCA_metastatic2=meta_ExBRCA[grep("Metastatic", meta_ExBRCA$Sampletype),]

								 
site_locations = which(meta1$Cancertype %in% "Pancreatic Adenocarcinoma")
metaPAAD=meta1[site_locations,]

### left join ARCHs4 to PAAD clinical
metajoin=inner_join(metaPAAD,paad, by=c("CaseID"="case_id"))

write.csv(metajoin,file="metaPAADjoin.csv")
# delete "--" column  Remove variables with factor level 1
metasapply=metajoin[, sapply(metajoin, nlevels) > 1]

aggregate_demo <- function(category1, DF){result = aggregate(category1 ~ demographic_id, data = DF,toString)
return (summary(result$category1))}

for(cat in col_PAAD){aggregate_demo(category1 = cat, DF = metasapply)}

aggregate_demo(category1 = cat, DF = metasapply)

for(cat in col_PAAD){print (result = aggregate(cat ~ demographic_id, data = metasapply, paste, collapse = ","))}



aggregate(gender~demographic_id, metasapply, toString)
aggregate(Sampletype~demographic_id, metasapply, toString)
> str(metaPAAD)
'data.frame':	183 obs. of  5 variables:
 $ X         : int  76 142 147 271 427 458 468 511 512 700 ...
 $ CaseID    : Factor w/ 10340 levels "0004d251-3f70-4395-b175-c94c2f5b1b81",..: 70 132 137 250 392 420 429 469 470 644 ...
 $ Barcode   : Factor w/ 11192 levels "TCGA-02-0047-01A-01R",..: 8733 8692 8695 8728 8732 10285 8748 8735 740 8662 ...
 $ Cancertype: Factor w/ 33 levels "Acute Myeloid Leukemia",..: 21 21 21 21 21 21 21 21 21 21 ...
 $ Sampletype: Factor w/ 7 levels "Additional - New Primary",..: 5 5 5 5 5 5 5 5 5 5 ...
> str(metasapply)
'data.frame':	366 obs. of  38 variables:
 $ Barcode                    : Factor w/ 11192 levels "TCGA-02-0047-01A-01R",..: 8733 8733 8692 8692 8695 8695 8728 8728 8732 8732 ...
 $ Cancertype                 : Factor w/ 33 levels "Acute Myeloid Leukemia",..: 21 21 21 21 21 21 21 21 21 21 ...
 $ Sampletype(183)                 : Factor w/ 7 levels "Additional - New Primary",..: 5 5 5 5 5 5 5 5 5 5 ...
 $ submitter_id               : Factor w/ 185 levels "TCGA-2J-AAB1",..: 132 132 99 99 102 102 127 127 131 131 ...
 $ days_to_death              : Factor w/ 97 levels "--","103","1059",..: 65 65 39 39 72 72 12 12 7 7 ...
 $ demographic_id             : Factor w/ 185 levels "00ecd802-e725-5a44-8bc1-bec33be4695c",..: 35 35 26 26 88 88 136 136 60 60 ...
 $ ethnicity                  : Factor w/ 3 levels "hispanic or latino",..: 2 2 2 2 2 2 2 2 2 2 ...
 $ gender                     : Factor w/ 2 levels "female","male": 1 1 1 1 1 1 1 1 2 2 ...
 $ race                       : Factor w/ 4 levels "asian","black or african american",..: 4 4 4 4 4 4 2 2 4 4 ...
 $ submitter_id.1             : Factor w/ 185 levels "TCGA-2J-AAB1_demographic",..: 132 132 99 99 102 102 127 127 131 131 ...
 $ updated_datetime           : Factor w/ 185 levels "2019-07-31T15:29:30.691618-05:00",..: 1 1 2 2 3 3 4 4 5 5 ...
 $ vital_status               : Factor w/ 2 levels "Alive","Dead": 2 2 2 2 2 2 2 2 2 2 ...
 $ year_of_birth              : Factor w/ 47 levels "--","1922","1924",..: 33 33 36 36 32 32 20 20 23 23 ...
 $ year_of_death              : Factor w/ 10 levels "--","2002","2007",..: 5 5 1 1 1 1 7 7 5 5 ...
 $ ajcc_pathologic_m          : Factor w/ 3 levels "M0","M1","MX": 1 1 3 3 2 2 1 1 1 1 ...
 $ ajcc_pathologic_n          : Factor w/ 5 levels "--","N0","N1",..: 3 3 2 2 2 2 2 2 2 2 ...
 $ ajcc_pathologic_stage      : Factor w/ 8 levels "--","Stage I",..: 6 6 5 5 8 8 5 5 5 5 ...
 $ ajcc_pathologic_t          : Factor w/ 6 levels "--","T1","T2",..: 4 4 4 4 4 4 4 4 4 4 ...
 $ ajcc_staging_system_edition: Factor w/ 3 levels "5th","6th","7th": 2 2 3 3 3 3 2 2 2 2 ...
 $ days_to_last_follow_up     : Factor w/ 113 levels "--","1","1021",..: 1 1 43 43 81 81 1 1 1 1 ...
 $ diagnosis_id               : Factor w/ 185 levels "002c9efa-a79e-5691-9bb6-34eff2ea2c33",..: 17 17 147 147 92 92 102 102 31 31 ...
 $ icd_10_code                : Factor w/ 5 levels "C25.0","C25.1",..: 5 5 1 1 3 3 5 5 5 5 ...
 $ morphology                 : Factor w/ 6 levels "8020/3","8140/3",..: 6 6 6 6 6 6 6 6 6 6 ...
 $ primary_diagnosis          : Factor w/ 6 levels "Adenocarcinoma with mixed subtypes",..: 4 4 4 4 4 4 4 4 4 4 ...
 $ prior_malignancy           : Factor w/ 2 levels "no","yes": 1 1 1 1 1 1 1 1 1 1 ...
 $ prior_treatment            : Factor w/ 2 levels "No","Yes": 1 1 1 1 1 1 1 1 1 1 ...
 $ site_of_resection_or_biopsy: Factor w/ 5 levels "Body of pancreas",..: 4 4 2 2 5 5 4 4 4 4 ...
 $ submitter_id.3             : Factor w/ 185 levels "TCGA-2J-AAB1_diagnosis",..: 132 132 99 99 102 102 127 127 131 131 ...
 $ tissue_or_organ_of_origin  : Factor w/ 5 levels "Body of pancreas",..: 4 4 2 2 5 5 4 4 4 4 ...
 $ created_datetime.3         : Factor w/ 186 levels "--","2019-04-28T08:48:20.771173-05:00",..: 2 1 3 1 4 1 5 1 1 6 ...
 $ submitter_id.4             : Factor w/ 370 levels "TCGA-2J-AAB1_treatment",..: 264 263 198 197 204 203 254 253 261 262 ...
 $ treatment_id               : Factor w/ 370 levels "00ba06d7-192a-56e0-9db5-55864e65390e",..: 12 178 4 237 221 269 172 343 190 229 ...
 $ treatment_or_therapy (262)      : Factor w/ 3 levels "no","not reported",..: 1 1 3 2 3 2 3 3 1 1 ...
 $ treatment_type (356)            : Factor w/ 2 levels "Pharmaceutical Therapy, NOS",..: 1 2 1 2 1 2 1 2 2 1 ...
 $ updated_datetime.2         : Factor w/ 185 levels "2019-07-31T15:29:30.691618-05:00",..: 1 1 2 2 3 3 4 4 5 5 ...
 $ tumor_stage                : Factor w/ 8 levels "not reported",..: 6 6 5 5 8 8 5 5 5 5 ...
 $ updated_datetime.3         : Factor w/ 4 levels "2019-08-08T17:19:44.867503-05:00",..: 3 3 2 2 3 3 3 3 3 3 ...
 $ year_of_diagnosis          : Factor w/ 9 levels "--","2001","2007",..: 4 4 8 8 8 8 4 4 5 5 ...


# cancerfreq=data.frame(cbind(unique(meta1$Cancertype),table(meta1$Cancertype)))
# table(meta1$Sampletype,meta1$Cancertype)
# sqldf('select count(Sampletype), count(Cancertype) from meta1')

dist1=sqldf('select distinct demographic_id,gender,race, ethnicity,ajcc_pathologic_stage,ajcc_staging_system_edition,tumor_stage,vital_status  from metasapply order by demographic_id')

sqldf('select distinct demographic_id,primary_diagnosis from metasapply')
summary(sqldf('select distinct demographic_id,primary_diagnosis from metasapply')$primary_diagnosis)
Adenocarcinoma with mixed subtypes                Adenocarcinoma, NOS 
                                 1                                 20 
  Carcinoma, undifferentiated, NOS   Infiltrating duct carcinoma, NOS 
                                 1                                143 
           Mucinous adenocarcinoma      Neuroendocrine carcinoma, NOS 
                                 5                                  8 

sqldf('select distinct demographic_id,days_to_death from metasapply')
summary(sqldf('select distinct demographic_id,days_to_death from metasapply')$primary_diagnosis)
> summary(dist1$gender)
female   male 
    80     98 
> summary(dist1$race)
                    asian black or african american              not reported 
                       11                         6                         4 
                    white 
                      157 
> summary(dist1$ajcc_pathologic_stage)
       --   Stage I  Stage IA  Stage IB Stage IIA Stage IIB Stage III  Stage IV 
        3         1         5        15        28       119         3         4 

summary(dist1$ajcc_staging_system_edition)
> summary(dist1$tumor_stage)
not reported      stage i     stage ia     stage ib    stage iia    stage iib 
           3            1            5           15           28          119 
   stage iii     stage iv 
           3            4 
> summary(dist1$vital_status)
Alive  Dead 
   85    93 
> summary(df2$tissue_or_organ_of_origin)
              Body of pancreas               Head of pancreas 
                            15                            130 
Overlapping lesion of pancreas                  Pancreas, NOS 
                             2                             17 
              Tail of pancreas 
                            14 
> length(df2)
[1] 2
> length(df2$tissue_or_organ_of_origin)
[1] 178
> df2=sqldf('select distinct demographic_id,tissue_or_organ_of_origin, prior_treatment from metasapply')
> length(df2$prior_treatment)
[1] 178
> summary(df2$prior_treatment)
 No Yes 
177   1 

## "--" modification

df3=sqldf('select distinct demographic_id,days_to_death from metasapply')
grep("--", df3$days_to_death)
hist(as.numeric(gsub("--","2200", df3$days_to_death)))

df3$days_to_deathGroup=cut(as.numeric(gsub("--","2200", df3$days_to_death)),breaks=c(0,499,999,1999,2499),labels=c(0,499,999,1999,2499))
table(df3$days_to_deathGroup)



### read clinical data
paad=read.csv("PAADclinical.tsv", sep = "\t",header = T)
colnames(paad)

intersect(paad$case_id,gdc_cases.case_id)

#intersect(paad$diagnosis_id)
#intersect(paad$treatment_id)

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
synchronous_malignancy,tissue_or_organ_of_origin,tumor_stage,year_of_diagnosis  from BRCAsapply order by demographic_id')

coldist1=colnames(dist1)

> nrow(dist1)
[1] 1093

summary(dist1$vital_status)
for (col in coldist1){
print (summary(dist1$col))}

>>> for a in collist:
...     print ('''summary(dist1$%s)'''%(a))


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

# ==> "191217modTCGACllinical.csv"
# 5838f42e-5238-4ff1-bb82-05e3e3e5abdc


# gdc file id
#> head(Tsample_id)
#[1] "3DFF72D2-F292-497E-ACE3-6FAA9C884205"
#[2] "B1E54366-42B9-463C-8615-B34D52BD14DC"
#[3] "473713F7-EB41-4F20-A37F-ACD209E3CB75"
#[4] "11F18F54-9B33-4C33-BDF9-0F093F4F3336"
#[5] "136B7576-1108-4FA3-8254-6069F0CA879A"
#[6] "E81FA8B7-3FFE-4F73-94AF-0B5257D7F81A"

# ==> PAADclinical.tsv <==
#"37daa7f7-df62-5f38-8035-c17d2a8a931b"


### read TCGA Expression file and Meta file ###
TCGAall=read.csv("191217TCGAAllcancer.csv", row.names=1, sep = ",", header = T)
meta1=read.csv("191217modTCGACllinical.csv", header = T)



TCGA_bar=colnames(TCGAall)
meta1["BarcodeMod"]=str_replace_all(meta1$Barcode,"-",".")


> head(meta1)
  X              Barcode                     Cancertype    Sampletype
1 1 TCGA-DD-AAVP-01A-11R Liver Hepatocellular Carcinoma Primary Tumor
2 2 TCGA-KK-A7B2-01A-12R        Prostate Adenocarcinoma Primary Tumor
3 3 TCGA-DC-6158-01A-11R          Rectum Adenocarcinoma Primary Tumor
4 4 TCGA-DD-A4NP-01A-11R Liver Hepatocellular Carcinoma Primary Tumor
5 5 TCGA-HQ-A5ND-01A-11R   Bladder Urothelial Carcinoma Primary Tumor
6 6 TCGA-HT-A614-01A-11R       Brain Lower Grade Glioma Primary Tumor
            BarcodeMod
1 TCGA.DD.AAVP.01A.11R
2 TCGA.KK.A7B2.01A.12R
3 TCGA.DC.6158.01A.11R
4 TCGA.DD.A4NP.01A.11R
5 TCGA.HQ.A5ND.01A.11R
6 TCGA.HT.A614.01A.11R


> colnames(meta1)
[1] "X"          "Barcode"    "Cancertype" "Sampletype" "BarcodeMod"

> table(meta_breast$Sampletype)

                       Additional - New Primary                                               0 
                          Additional Metastatic                                               0 
                                     Metastatic                                               7 
Primary Blood Derived Cancer - Peripheral Blood                                               0 
                                  Primary Tumor                                            1127 
                                Recurrent Tumor                                               0 
                            Solid Tissue Normal                                             112 


meta_breast=subset(meta1, Cancertype == "Breast Invasive Carcinoma")
meta_breast_primary=subset(meta_breast, Sampletype=="Primary Tumor")
meta_breast_normal=subset(meta_breast, Sampletype=="Solid Tissue Normal")
meta_breast_metastatic=subset(meta_breast, Sampletype=="Metastatic")



Bar_BRCANormal=meta_breast_normal$BarcodeMod
Bar_BRCAmeta=meta_breast_metastatic$BarcodeMod
Bar_BRCAPrimary=meta_breast_primary$BarcodeMod

Bar_BRCATumor=c(Bar_BRCAmeta, Bar_BRCAPrimary)

#==== Metastatic 7 + Primary Tumor 1127 vs Solid Tissue Normal ====#

subBRCATumor=TCGAbreast[,Bar_BRCATumor]
subBRCANormal=TCGAbreast[,Bar_BRCANormal]



# other cancer type
> table(meta_ExBRCA$Sampletype)

                       Additional - New Primary 
                                             11 
                          Additional Metastatic 
                                              1 
                                     Metastatic 
                                            387 
Primary Blood Derived Cancer - Peripheral Blood 
                                            126 
                                  Primary Tumor 
                                           8835 
                                Recurrent Tumor 
                                             50 
                            Solid Tissue Normal 
                                            628 


ExBRCA=read.csv("/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/BreastCancer/data/ReCount2OverARCHS4/191209TCGAExceptBreastTissue_log2.csv", row.names=1, sep = ",", header = T)

meta_ExBRCA=subset(meta1, Cancertype != "Breast Invasive Carcinoma")
meta_ExBRCA_primary=subset(meta_ExBRCA, Sampletype=="Primary Tumor")
meta_ExBRCA_normal=subset(meta_ExBRCA, Sampletype=="Solid Tissue Normal")
meta_ExBRCA_metastatic=subset(meta_ExBRCA, Sampletype=="Metastatic")
meta_ExBRCA_recurrent=subset(meta_ExBRCA, Sampletype=="Recurrent Tumor")
meta_ExBRCA_peripheral=subset(meta_ExBRCA, Sampletype=="Primary Blood Derived Cancer - Peripheral Blood")

##include Additional - New Primary(11)>> primary , Additional Metastatic(1) >>metastatic
meta_breast_primary2=meta_ExBRCA[grep("Primary", meta_ExBRCA$Sampletype),]
meta_ExBRCA_metastatic2=meta_ExBRCA[grep("Metastatic", meta_ExBRCA$Sampletype),]







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

> summary(dist1$year_of_diagnosis)
  -- 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 
   2    2    1    2    2    6    5    6    8   13    6   13   10    5   12   12 
2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 
  26   25   37   72   90  115  141  225  125   70   62 
> summary(dist1$days_to_birth)
Length  Class   Mode 
     0   NULL   NULL 
> summary(dist1$days_to_death)
Length  Class   Mode 
     0   NULL   NULL 
> summary(dist1$ethnicity)
    hispanic or latino not hispanic or latino           not reported 
                    39                    880                    174 
> summary(dist1$gender)
female   male 
  1081     12 
> summary(dist1$race)
american indian or alaska native                            asian 
                               1                               61 
       black or african american                     not reported 
                             183                               95 
                           white 
                             753 
> summary(dist1$vital_status)
Alive  Dead 
  941   152 
> summary(dist1$year_of_birth)
  -- 1902 1909 1910 1913 1914 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 
   3    1    1    1    1    1    2    2    2    3    5    4    7    4   11    7 
1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 
   7    6   16   13   16   15   11   17   16    9   18   13   19   23   32   25 
1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 
  19   27   22   28   34   31   33   34   28   29   28   37   30   24   23   28 
1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 
  27   19   35   21   28   25   27   17   18   21   12   13   11   10   13    4 
1974 1975 1976 1977 1978 1979 1980 1981 1983 1984 
   5    1    4    3    3    3    1    2    2    2 
> summary(dist1$year_of_death)
  -- 1992 1994 1995 1996 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 
 989    2    1    1    2    3    5    5    8    6    5   10   11    7    3   15 
2009 2010 2011 2012 2013 
   6   11    1    1    1 
> summary(dist1$age_at_diagnosis)
     --   32872   22199   14122   14920   16642   16736   17702   18741   18771 
     15       8       3       2       2       2       2       2       2       2 
  18942   19030   19216   19415   20694   21428   21479   21628   21910   21918 
      2       2       2       2       2       2       2       2       2       2 
  22380   22798   23021   23150   23404   24315   24779   24923   25477   26052 
      2       2       2       2       2       2       2       2       2       2 
  29529   10564   10616   10812   10832   10869   10898   11199   11204   11354 
      2       1       1       1       1       1       1       1       1       1 
  11379   11650   11929   12006   12142   12443   12525   12528   12601   12642 
      1       1       1       1       1       1       1       1       1       1 
  12668   12671   12715   12729   12755   12840   12841   12965   13004   13039 
      1       1       1       1       1       1       1       1       1       1 
  13046   13138   13208   13238   13243   13307   13409   13445   13458   13483 
      1       1       1       1       1       1       1       1       1       1 
  13510   13556   13671   13680   13743   13805   13817   13836   13982   13985 
      1       1       1       1       1       1       1       1       1       1 
  14090   14115   14119   14134   14174   14175   14250   14264   14272   14316 
      1       1       1       1       1       1       1       1       1       1 
  14374   14383   14448   14454   14494   14503   14532   14564   14595 (Other) 
      1       1       1       1       1       1       1       1       1     943 
> summary(dist1$ajcc_pathologic_m)
Length  Class   Mode 
     0   NULL   NULL 
> summary(dist1$ajcc_pathologic_n)
       N0   N0 (i-)   N0 (i+) N0 (mol+)        N1       N1a       N1b       N1c 
      333       153        28         1       124       167        32         2 
     N1mi        N2       N2a        N3       N3a       N3b       N3c        NX 
       36        56        64        26        47         3         1        20 
> summary(dist1$ajcc_pathologic_stage)
        --    Stage I   Stage IA   Stage IB   Stage II  Stage IIA  Stage IIB 
        11         90         85          6          6        358        255 
 Stage III Stage IIIA Stage IIIB Stage IIIC   Stage IV    Stage X 
         2        155         27         65         20         13 
> summary(dist1$ajcc_pathologic_t)
 T1 T1a T1b T1c  T2 T2a T2b  T3 T3a  T4 T4b T4d  TX 
 41   1  16 221 631   1   1 137   1   9  28   3   3 
> summary(dist1$ajcc_staging_system_edition)
Length  Class   Mode 
     0   NULL   NULL 
> summary(dist1$days_to_last_follow_up)
     --      10     385      30     304     365     375     396     554      31 
    123      15       6       5       5       5       5       5       5       4 
    518     575       1    1001    1004    1043    1051    1308    1611    2255 
      4       4       3       3       3       3       3       3       3       3 
    358     394     410     439     441     447     477       5     532     577 
      3       3       3       3       3       3       3       3       3       3 
    584     588     620     635     727     747     762      78     943    1026 
      3       3       3       3       3       3       3       3       3       2 
   1062    1120    1132    1148    1156    1203    1208    1220    1229    1234 
      2       2       2       2       2       2       2       2       2       2 
   1309    1363    1371    1417    1474    1604    1673     170    1728    1935 
      2       2       2       2       2       2       2       2       2       2 
      2    2190    2240    2372     242    2442    2596    2632    2645     273 
      2       2       2       2       2       2       2       2       2       2 
    293    2991     303     313     317     322     326    3283      34     343 
      2       2       2       2       2       2       2       2       2       2 
    345     366     371     373     376     380     381     383     393     403 
      2       2       2       2       2       2       2       2       2       2 
    408     424     426     428     431     448     450     461     463 (Other) 
      2       2       2       2       2       2       2       2       2     706 
> summary(dist1$icd_10_code)
  C50.2   C50.3   C50.4   C50.5   C50.8   C50.9 C50.919 
      2       3       2       1       2    1082       1 
> summary(dist1$morphology)
8010/3 8013/3 8022/3 8050/3 8090/3 8200/3 8201/3 8211/3 8401/3 8480/3 8500/3 
     1      1      3      2      1      1      1      1      1     16    776 
8502/3 8503/3 8507/3 8510/3 8520/3 8522/3 8523/3 8524/3 8541/3 8575/3 9020/3 
     1      6      4      6    201     28     19      6      3     14      1 
> summary(dist1$primary_diagnosis)
Length  Class   Mode 
     0   NULL   NULL 
> summary(dist1$prior_malignancy)
          no not reported          yes 
        1025            1           67 
> summary(dist1$prior_treatment)
          No Not Reported          Yes 
        1078            2           13 
> summary(dist1$site_of_resection_or_biopsy)
                   Breast, NOS Lower-inner quadrant of breast 
                          1083                              3 
Lower-outer quadrant of breast   Overlapping lesion of breast 
                             1                              2 
Upper-inner quadrant of breast Upper-outer quadrant of breast 
                             2                              2 
> summary(dist1$synchronous_malignancy)
Length  Class   Mode 
     0   NULL   NULL 
> summary(dist1$tissue_or_organ_of_origin)
                   Breast, NOS Lower-inner quadrant of breast 
                          1083                              3 
Lower-outer quadrant of breast   Overlapping lesion of breast 
                             1                              2 
Upper-inner quadrant of breast Upper-outer quadrant of breast 
                             2                              2 
> summary(dist1$treatment_or_therapy)
Length  Class   Mode 
     0   NULL   NULL 
> summary(dist1$treatment_type)
Length  Class   Mode 
     0   NULL   NULL 
> summary(dist1$tumor_stage)
not reported      stage i     stage ia     stage ib     stage ii    stage iia 
          11           90           85            6            6          358 
   stage iib    stage iii   stage iiia   stage iiib   stage iiic     stage iv 
         255            2          155           27           65           20 
     stage x 
          13 
> summary(dist1$year_of_diagnosis)
  -- 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 
   2    2    1    2    2    6    5    6    8   13    6   13   10    5   12   12 
2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 
  26   25   37   72   90  115  141  225  125   70   62 
> 



[1] "Barcode"
[1] 1223
[1] "Cancertype"
[1] 1093
[1] "Sampletype"
[1] 1212
[1] "submitter_id"
[1] 1093
[1] "days_to_birth"
[1] 1093
[1] "days_to_death"
[1] 1093
[1] "demographic_id"
[1] 1093
[1] "ethnicity"
[1] 1093
[1] "gender"
[1] 1093
[1] "race"
[1] 1093
[1] "submitter_id.1"
[1] 1093
[1] "updated_datetime"
[1] 1093
[1] "vital_status"
[1] 1093
[1] "year_of_birth"
[1] 1093
[1] "year_of_death"
[1] 1093
[1] "age_at_diagnosis"
[1] 1093
[1] "ajcc_pathologic_m"
[1] 1093
[1] "ajcc_pathologic_n"
[1] 1093
[1] "ajcc_pathologic_stage"
[1] 1093
[1] "ajcc_pathologic_t"
[1] 1093
[1] "ajcc_staging_system_edition"
[1] 1093
[1] "days_to_last_follow_up"
[1] 1093
[1] "diagnosis_id"
[1] 1093
[1] "icd_10_code"
[1] 1093
[1] "morphology"
[1] 1093
[1] "primary_diagnosis"
[1] 1093
[1] "prior_malignancy"
[1] 1093
[1] "prior_treatment"
[1] 1093
[1] "site_of_resection_or_biopsy"
[1] 1093
[1] "submitter_id.3"
[1] 1093
[1] "synchronous_malignancy"
[1] 1093
[1] "tissue_or_organ_of_origin"
[1] 1093
[1] "created_datetime.3"
[1] 2186
[1] "submitter_id.4"
[1] 2186
[1] "treatment_id"
[1] 2186
[1] "treatment_or_therapy"
[1] 1460
[1] "treatment_type"
[1] 2186
[1] "updated_datetime.2"
[1] 1093
[1] "tumor_stage"
[1] 1093
[1] "updated_datetime.3"
[1] 1093
[1] "year_of_diagnosis"
[1] 1093

[1] "Barcode"
[1] "Cancertype"
[1] "Sampletype"
[1] "submitter_id"
[1] "days_to_birth"
[1] "days_to_death"
[1] "demographic_id"
[1] "ethnicity"
[1] "gender"
[1] "race"
[1] "submitter_id.1"
[1] "updated_datetime"
[1] "vital_status"
[1] "year_of_birth"
[1] "year_of_death"
[1] "age_at_diagnosis"
[1] "ajcc_pathologic_m"
[1] "ajcc_pathologic_n"
[1] "ajcc_pathologic_stage"
[1] "ajcc_pathologic_t"
[1] "ajcc_staging_system_edition"
[1] "days_to_last_follow_up"
[1] "diagnosis_id"
[1] "icd_10_code"
[1] "morphology"
[1] "primary_diagnosis"
[1] "prior_malignancy"
[1] "prior_treatment"
[1] "site_of_resection_or_biopsy"
[1] "submitter_id.3"
[1] "synchronous_malignancy"
[1] "tissue_or_organ_of_origin"
[1] "created_datetime.3"
[1] "submitter_id.4"
[1] "treatment_id"
[1] "treatment_or_therapy"
[1] "treatment_type"
[1] "updated_datetime.2"
[1] "tumor_stage"
[1] "updated_datetime.3"
[1] "year_of_diagnosis"

> str(BRCAsapply)
'data.frame':	2492 obs. of  41 variables:
 $ Barcode                    : Factor w/ 11192 levels "TCGA-02-0047-01A-01R",..: 6685 6685 2020 2020 2041 2041 3066 3066 9270 9270 ...
 $ Cancertype                 : Factor w/ 33 levels "Acute Myeloid Leukemia",..: 5 5 5 5 5 5 5 5 5 5 ...
 $ Sampletype                 : Factor w/ 7 levels "Additional - New Primary",..: 5 5 5 5 5 5 5 5 5 5 ...
 $ submitter_id               : Factor w/ 1097 levels "TCGA-3C-AAAU",..: 865 865 9 9 30 30 310 310 1026 1026 ...
 $ days_to_birth              : Factor w/ 1045 levels "--","-10564",..: 568 568 840 840 285 285 469 469 589 589 ...
 $ days_to_death              : Factor w/ 144 levels "--","1","1004",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ demographic_id             : Factor w/ 1097 levels "001b6933-5d74-5eb9-bdfe-93995f809818",..: 905 905 1076 1076 434 434 499 499 1053 1053 ...
 $ ethnicity                  : Factor w/ 3 levels "hispanic or latino",..: 2 2 2 2 2 2 2 2 2 2 ...
 $ gender                     : Factor w/ 2 levels "female","male": 1 1 1 1 1 1 1 1 1 1 ...
 $ race                       : Factor w/ 5 levels "american indian or alaska native",..: 5 5 5 5 5 5 5 5 5 5 ...
 $ submitter_id.1             : Factor w/ 1097 levels "TCGA-3C-AAAU_demographic",..: 865 865 9 9 30 30 310 310 1026 1026 ...
 $ updated_datetime           : Factor w/ 1097 levels "2019-07-31T15:13:44.201043-05:00",..: 66 66 67 67 68 68 69 69 384 384 ...
 $ vital_status               : Factor w/ 2 levels "Alive","Dead": 1 1 1 1 1 1 1 1 1 1 ...
 $ year_of_birth              : Factor w/ 74 levels "--","1902","1909",..: 41 41 29 29 46 46 45 45 42 42 ...
 $ year_of_death              : Factor w/ 21 levels "--","1992","1994",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ age_at_diagnosis           : Factor w/ 1045 levels "--","10564","10616",..: 568 568 840 840 285 285 469 469 589 589 ...
 $ ajcc_pathologic_m          : Factor w/ 4 levels "cM0 (i+)","M0",..: 2 2 2 2 2 2 2 2 4 4 ...
 $ ajcc_pathologic_n          : Factor w/ 16 levels "N0","N0 (i-)",..: 4 4 1 1 9 9 1 1 2 2 ...
 $ ajcc_pathologic_stage      : Factor w/ 13 levels "--","Stage I",..: 3 3 2 2 7 7 6 6 3 3 ...
 $ ajcc_pathologic_t          : Factor w/ 13 levels "T1","T1a","T1b",..: 4 4 4 4 5 5 5 5 4 4 ...
 $ ajcc_staging_system_edition: Factor w/ 6 levels "--","3rd","4th",..: 6 6 5 5 5 5 1 1 6 6 ...
 $ days_to_last_follow_up     : Factor w/ 762 levels "--","-7","1",..: 407 407 310 310 372 372 526 526 679 679 ...
 $ diagnosis_id               : Factor w/ 1097 levels "003f1965-f1c7-5613-87cd-c286b6a9eec5",..: 804 804 351 351 261 261 920 920 291 291 ...
 $ icd_10_code                : Factor w/ 7 levels "C50.2","C50.3",..: 6 6 6 6 6 6 6 6 6 6 ...
 $ morphology                 : Factor w/ 22 levels "8010/3","8013/3",..: 11 11 6 6 9 9 11 11 16 16 ...
 $ primary_diagnosis          : Factor w/ 22 levels "Adenoid cystic carcinoma",..: 7 7 1 1 2 2 7 7 13 13 ...
 $ prior_malignancy           : Factor w/ 3 levels "no","not reported",..: 1 1 1 1 1 1 1 1 3 3 ...
 $ prior_treatment            : Factor w/ 3 levels "No","Not Reported",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ site_of_resection_or_biopsy: Factor w/ 6 levels "Breast, NOS",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ submitter_id.3             : Factor w/ 1097 levels "TCGA-3C-AAAU_diagnosis",..: 865 865 9 9 30 30 310 310 1026 1026 ...
 $ synchronous_malignancy     : Factor w/ 2 levels "No","Not Reported": 1 1 1 1 1 1 1 1 2 2 ...
 $ tissue_or_organ_of_origin  : Factor w/ 6 levels "Breast, NOS",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ created_datetime.3         : Factor w/ 1098 levels "--","2019-04-28T08:34:52.722845-05:00",..: 1 67 1 68 1 69 70 1 384 1 ...
 $ submitter_id.4             : Factor w/ 2194 levels "TCGA-3C-AAAU_treatment",..: 1729 1730 17 18 59 60 620 619 2052 2051 ...
 $ treatment_id               : Factor w/ 2194 levels "000029e5-74e1-5de9-b622-d792fd42b2c1",..: 326 806 82 1779 689 1582 1329 1346 1272 1382 ...
 $ treatment_or_therapy       : Factor w/ 3 levels "no","not reported",..: 1 3 2 2 1 3 1 1 3 1 ...
 $ treatment_type             : Factor w/ 2 levels "Pharmaceutical Therapy, NOS",..: 2 1 2 1 2 1 1 2 1 2 ...
 $ updated_datetime.2         : Factor w/ 1097 levels "2019-07-31T15:13:44.201043-05:00",..: 66 66 67 67 68 68 69 69 384 384 ...
 $ tumor_stage                : Factor w/ 13 levels "not reported",..: 3 3 2 2 7 7 6 6 3 3 ...
 $ updated_datetime.3         : Factor w/ 22 levels "2019-08-08T16:19:58.650144-05:00",..: 18 18 1 1 1 1 7 7 21 21 ...
 $ year_of_diagnosis          : Factor w/ 27 levels "--","1988","1989",..: 24 24 22 22 19 19 24 24 26 26 ...


ggplot(data = meta1, aes(x = Cancertype)) +geom_bar()+theme_bw()+theme(axis.text.x=element_text(angle=90, hjust=1))

ggplot(meta1, aes( x = reorder(Cancertype,Cancertype,function(x)-length(x)))) + geom_bar() + theme_bw() + theme(axis.text.x=element_text(angle=90, hjust=1))

                                          Acute Myeloid Leukemia 
                                                             126 
                                        Adrenocortical Carcinoma 
                                                              79 
                                    Bladder Urothelial Carcinoma 
                                                             433 
                                        Brain Lower Grade Glioma 
                                                             532 
                                       Breast Invasive Carcinoma 
                                                            1246 
Cervical Squamous Cell Carcinoma and Endocervical Adenocarcinoma 
                                                             309 
                                              Cholangiocarcinoma 
                                                              45 
                                            Colon Adenocarcinoma 
                                                             546 
                                            Esophageal Carcinoma 
                                                             198 
                                         Glioblastoma Multiforme 
                                                             175 
                           Head and Neck Squamous Cell Carcinoma 
                                                             548 
                                              Kidney Chromophobe 
                                                              91 
                               Kidney Renal Clear Cell Carcinoma 
                                                             616 
                           Kidney Renal Papillary Cell Carcinoma 
                                                             323 
                                  Liver Hepatocellular Carcinoma 
                                                             424 
                                             Lung Adenocarcinoma 
                                                             601 
                                    Lung Squamous Cell Carcinoma 
                                                             555 
                 Lymphoid Neoplasm Diffuse Large B-cell Lymphoma 
                                                              48 
                                                    Mesothelioma 
                                                              87 
                               Ovarian Serous Cystadenocarcinoma 
                                                             430 
                                       Pancreatic Adenocarcinoma 
                                                             183 
                              Pheochromocytoma and Paraganglioma 
                                                             187 
                                         Prostate Adenocarcinoma 
                                                             558 
                                           Rectum Adenocarcinoma 
                                                             177 
                                                         Sarcoma 
                                                             265 
                                         Skin Cutaneous Melanoma 
                                                             473 
                                          Stomach Adenocarcinoma 
                                                             453 
                                     Testicular Germ Cell Tumors 
                                                             156 
                                                         Thymoma 
                                                             122 
                                               Thyroid Carcinoma 
                                                             572 
                                          Uterine Carcinosarcoma 
                                                              57 
                            Uterine Corpus Endometrial Carcinoma 
                                                             589 
                                                  Uveal Melanoma 
                                                              80

> head(metajoin)
    X                               CaseID              Barcode
1  76 01775b06-5836-469c-8537-120cb8cc94e9 TCGA-IB-7897-01A-21R
2  76 01775b06-5836-469c-8537-120cb8cc94e9 TCGA-IB-7897-01A-21R
3 142 02dbd5fa-e31f-4486-8df8-5b851f2e92bd TCGA-HZ-8315-01A-11R
4 142 02dbd5fa-e31f-4486-8df8-5b851f2e92bd TCGA-HZ-8315-01A-11R
5 147 02ef2e1a-5afe-4c00-a3ea-7f4a153f1da4 TCGA-HZ-8636-01A-21R
6 147 02ef2e1a-5afe-4c00-a3ea-7f4a153f1da4 TCGA-HZ-8636-01A-21R
                 Cancertype    Sampletype submitter_id project_id age_at_index
1 Pancreatic Adenocarcinoma Primary Tumor TCGA-IB-7897  TCGA-PAAD           53
2 Pancreatic Adenocarcinoma Primary Tumor TCGA-IB-7897  TCGA-PAAD           53
3 Pancreatic Adenocarcinoma Primary Tumor TCGA-HZ-8315  TCGA-PAAD           54
4 Pancreatic Adenocarcinoma Primary Tumor TCGA-HZ-8315  TCGA-PAAD           54
5 Pancreatic Adenocarcinoma Primary Tumor TCGA-HZ-8636  TCGA-PAAD           58
6 Pancreatic Adenocarcinoma Primary Tumor TCGA-HZ-8636  TCGA-PAAD           58
  age_is_obfuscated cause_of_death cause_of_death_source created_datetime
1                --             --                    --               --
2                --             --                    --               --
3                --             --                    --               --
4                --             --                    --               --
5                --             --                    --               --
6                --             --                    --               --
  days_to_birth days_to_death                       demographic_id
1        -19718           486 31f43ced-83c3-5949-9d68-7306832ccc7b
2        -19718           486 31f43ced-83c3-5949-9d68-7306832ccc7b
3        -19839           299 26a58b50-508b-5ad4-8fca-9bacd2774c68
4        -19839           299 26a58b50-508b-5ad4-8fca-9bacd2774c68
5        -21501           545 8143475b-505e-5586-aa56-c37b7e01ec82
6        -21501           545 8143475b-505e-5586-aa56-c37b7e01ec82
               ethnicity gender occupation_duration_years premature_at_birth
1 not hispanic or latino female                        --                 --
2 not hispanic or latino female                        --                 --
3 not hispanic or latino female                        --                 --
4 not hispanic or latino female                        --                 --
5 not hispanic or latino female                        --                 --
6 not hispanic or latino female                        --                 --
   race    state           submitter_id.1                 updated_datetime
1 white released TCGA-IB-7897_demographic 2019-07-31T15:29:30.691618-05:00
2 white released TCGA-IB-7897_demographic 2019-07-31T15:29:30.691618-05:00
3 white released TCGA-HZ-8315_demographic 2019-07-31T15:29:33.659543-05:00
4 white released TCGA-HZ-8315_demographic 2019-07-31T15:29:33.659543-05:00
5 white released TCGA-HZ-8636_demographic 2019-07-31T15:29:36.641451-05:00
6 white released TCGA-HZ-8636_demographic 2019-07-31T15:29:36.641451-05:00
  vital_status weeks_gestation_at_birth year_of_birth year_of_death
1         Dead                       --          1955          2009
2         Dead                       --          1955          2009
3         Dead                       --          1958            --
4         Dead                       --          1958            --
5         Dead                       --          1954            --
6         Dead                       --          1954            --
  age_at_diagnosis ajcc_clinical_m ajcc_clinical_n ajcc_clinical_stage
1            19718              --              --                  --
2            19718              --              --                  --
3            19839              --              --                  --
4            19839              --              --                  --
5            21501              --              --                  --
6            21501              --              --                  --
  ajcc_clinical_t ajcc_pathologic_m ajcc_pathologic_n ajcc_pathologic_stage
1              --                M0                N1             Stage IIB
2              --                M0                N1             Stage IIB
3              --                MX                N0             Stage IIA
4              --                MX                N0             Stage IIA
5              --                M1                N0              Stage IV
6              --                M1                N0              Stage IV
  ajcc_pathologic_t ajcc_staging_system_edition anaplasia_present
1                T3                         6th                --
2                T3                         6th                --
3                T3                         7th                --
4                T3                         7th                --
5                T3                         7th                --
6                T3                         7th                --
  anaplasia_present_type ann_arbor_b_symptoms ann_arbor_clinical_stage
1                     --                   --                       --
2                     --                   --                       --
3                     --                   --                       --
4                     --                   --                       --
5                     --                   --                       --
6                     --                   --                       --
  ann_arbor_extranodal_involvement ann_arbor_pathologic_stage annotation_id
1                               --                         --            --
2                               --                         --            --
3                               --                         --            --
4                               --                         --            --
5                               --                         --            --
6                               --                         --            --
  case_id.1 case_submitter_id category classification created_datetime.1
1        --                --       --             --                 --
2        --                --       --             --                 --
3        --                --       --             --                 --
4        --                --       --             --                 --
5        --                --       --             --                 --
6        --                --       --             --                 --
  creator entity_id entity_submitter_id entity_type legacy_created_datetime
1      --        --                  --          --                      --
2      --        --                  --          --                      --
3      --        --                  --          --                      --
4      --        --                  --          --                      --
5      --        --                  --          --                      --
6      --        --                  --          --                      --
  legacy_updated_datetime notes state.1 status submitter_id.2
1                      --    --      --     --             --
2                      --    --      --     --             --
3                      --    --      --     --             --
4                      --    --      --     --             --
5                      --    --      --     --             --
6                      --    --      --     --             --
  updated_datetime.1 best_overall_response breslow_thickness
1                 --                    --                --
2                 --                    --                --
3                 --                    --                --
4                 --                    --                --
5                 --                    --                --
6                 --                    --                --
  burkitt_lymphoma_clinical_variant child_pugh_classification
1                                --                        --
2                                --                        --
3                                --                        --
4                                --                        --
5                                --                        --
6                                --                        --
  circumferential_resection_margin classification_of_tumor cog_liver_stage
1                               --            not reported              --
2                               --            not reported              --
3                               --            not reported              --
4                               --            not reported              --
5                               --            not reported              --
6                               --            not reported              --
  cog_neuroblastoma_risk_group cog_renal_stage cog_rhabdomyosarcoma_risk_group
1                           --              --                              --
2                           --              --                              --
3                           --              --                              --
4                           --              --                              --
5                           --              --                              --
6                           --              --                              --
  created_datetime.2 days_to_best_overall_response days_to_diagnosis
1                 --                            --                --
2                 --                            --                --
3                 --                            --                --
4                 --                            --                --
5                 --                            --                --
6                 --                            --                --
  days_to_last_follow_up days_to_last_known_disease_status days_to_recurrence
1                     --                                --                 --
2                     --                                --                 --
3                     28                                --                 --
4                     28                                --                 --
5                      5                                --                 --
6                      5                                --                 --
                          diagnosis_id enneking_msts_grade
1 12c51627-192a-5f84-b7e5-d05c096f6536                  --
2 12c51627-192a-5f84-b7e5-d05c096f6536                  --
3 c82a396e-5acf-56c0-a14f-40a139a8f528                  --
4 c82a396e-5acf-56c0-a14f-40a139a8f528                  --
5 6dda35c2-bcd9-58a7-8589-b0f2a0da5409                  --
6 6dda35c2-bcd9-58a7-8589-b0f2a0da5409                  --
  enneking_msts_metastasis enneking_msts_stage enneking_msts_tumor_site
1                       --                  --                       --
2                       --                  --                       --
3                       --                  --                       --
4                       --                  --                       --
5                       --                  --                       --
6                       --                  --                       --
  esophageal_columnar_dysplasia_degree esophageal_columnar_metaplasia_present
1                                   --                                     --
2                                   --                                     --
3                                   --                                     --
4                                   --                                     --
5                                   --                                     --
6                                   --                                     --
  figo_stage first_symptom_prior_to_diagnosis
1         --                               --
2         --                               --
3         --                               --
4         --                               --
5         --                               --
6         --                               --
  gastric_esophageal_junction_involvement gleason_grade_group
1                                      --                  --
2                                      --                  --
3                                      --                  --
4                                      --                  --
5                                      --                  --
6                                      --                  --
  goblet_cells_columnar_mucosa_present gross_tumor_weight icd_10_code
1                                   --                 --       C25.9
2                                   --                 --       C25.9
3                                   --                 --       C25.0
4                                   --                 --       C25.0
5                                   --                 --       C25.2
6                                   --                 --       C25.2
  igcccg_stage inpc_grade inpc_histologic_group inrg_stage inss_stage
1           --         --                    --         --         --
2           --         --                    --         --         --
3           --         --                    --         --         --
4           --         --                    --         --         --
5           --         --                    --         --         --
6           --         --                    --         --         --
  international_prognostic_index irs_group irs_stage ishak_fibrosis_score
1                             --        --        --                   --
2                             --        --        --                   --
3                             --        --        --                   --
4                             --        --        --                   --
5                             --        --        --                   --
6                             --        --        --                   --
  iss_stage largest_extrapelvic_peritoneal_focus last_known_disease_status
1        --                                   --              not reported
2        --                                   --              not reported
3        --                                   --              not reported
4        --                                   --              not reported
5        --                                   --              not reported
6        --                                   --              not reported
  laterality lymph_nodes_positive lymph_nodes_tested lymphatic_invasion_present
1         --                   --                 --                         --
2         --                   --                 --                         --
3         --                   --                 --                         --
4         --                   --                 --                         --
5         --                   --                 --                         --
6         --                   --                 --                         --
  masaoka_stage medulloblastoma_molecular_classification
1            --                                       --
2            --                                       --
3            --                                       --
4            --                                       --
5            --                                       --
6            --                                       --
  metastasis_at_diagnosis metastasis_at_diagnosis_site method_of_diagnosis
1                      --                           --                  --
2                      --                           --                  --
3                      --                           --                  --
4                      --                           --                  --
5                      --                           --                  --
6                      --                           --                  --
  micropapillary_features mitosis_karyorrhexis_index mitotic_count morphology
1                      --                         --            --     8500/3
2                      --                         --            --     8500/3
3                      --                         --            --     8500/3
4                      --                         --            --     8500/3
5                      --                         --            --     8500/3
6                      --                         --            --     8500/3
  non_nodal_regional_disease non_nodal_tumor_deposits ovarian_specimen_status
1                         --                       --                      --
2                         --                       --                      --
3                         --                       --                      --
4                         --                       --                      --
5                         --                       --                      --
6                         --                       --                      --
  ovarian_surface_involvement percent_tumor_invasion
1                          --                     --
2                          --                     --
3                          --                     --
4                          --                     --
5                          --                     --
6                          --                     --
  perineural_invasion_present peripancreatic_lymph_nodes_positive
1                          --                                  --
2                          --                                  --
3                          --                                  --
4                          --                                  --
5                          --                                  --
6                          --                                  --
  peripancreatic_lymph_nodes_tested peritoneal_fluid_cytological_status
1                                --                                  --
2                                --                                  --
3                                --                                  --
4                                --                                  --
5                                --                                  --
6                                --                                  --
                 primary_diagnosis primary_gleason_grade prior_malignancy
1 Infiltrating duct carcinoma, NOS                    --               no
2 Infiltrating duct carcinoma, NOS                    --               no
3 Infiltrating duct carcinoma, NOS                    --               no
4 Infiltrating duct carcinoma, NOS                    --               no
5 Infiltrating duct carcinoma, NOS                    --               no
6 Infiltrating duct carcinoma, NOS                    --               no
  prior_treatment progression_or_recurrence residual_disease
1              No              not reported               --
2              No              not reported               --
3              No              not reported               --
4              No              not reported               --
5              No              not reported               --
6              No              not reported               --
  secondary_gleason_grade site_of_resection_or_biopsy  state.2
1                      --               Pancreas, NOS released
2                      --               Pancreas, NOS released
3                      --            Head of pancreas released
4                      --            Head of pancreas released
5                      --            Tail of pancreas released
6                      --            Tail of pancreas released
          submitter_id.3 supratentorial_localization synchronous_malignancy
1 TCGA-IB-7897_diagnosis                          --                     No
2 TCGA-IB-7897_diagnosis                          --                     No
3 TCGA-HZ-8315_diagnosis                          --                     No
4 TCGA-HZ-8315_diagnosis                          --                     No
5 TCGA-HZ-8636_diagnosis                          --                     No
6 TCGA-HZ-8636_diagnosis                          --                     No
  tissue_or_organ_of_origin               created_datetime.3
1             Pancreas, NOS 2019-04-28T08:48:20.771173-05:00
2             Pancreas, NOS                               --
3          Head of pancreas 2019-04-28T08:48:23.224970-05:00
4          Head of pancreas                               --
5          Tail of pancreas 2019-04-28T08:48:25.382785-05:00
6          Tail of pancreas                               --
  days_to_treatment_end days_to_treatment_start initial_disease_status
1                    --                      --                     --
2                    --                      --                     --
3                    --                      --                     --
4                    --                      --                     --
5                    --                      --                     --
6                    --                      --                     --
  regimen_or_line_of_therapy  state.3           submitter_id.4
1                         -- released TCGA-IB-7897_treatment_1
2                         -- released   TCGA-IB-7897_treatment
3                         -- released TCGA-HZ-8315_treatment_1
4                         -- released   TCGA-HZ-8315_treatment
5                         -- released TCGA-HZ-8636_treatment_1
6                         -- released   TCGA-HZ-8636_treatment
  therapeutic_agents treatment_anatomic_site treatment_effect
1                 --                      --               --
2                 --                      --               --
3                 --                      --               --
4                 --                      --               --
5                 --                      --               --
6                 --                      --               --
                          treatment_id treatment_intent_type
1 09bb4807-3ae0-5b4d-b3a9-e18cb8bc2067                    --
2 747e7279-7271-5c39-a57a-5df3bc6145d4                    --
3 00f69db9-d730-5453-bb18-1e7cde148ad7                    --
4 9c302706-11a0-55b5-8491-2671596b0510                    --
5 8de57e73-b080-50c3-82cf-7f269e723513                    --
6 b2cd6c67-7357-5322-a69a-11b931def403                    --
  treatment_or_therapy treatment_outcome              treatment_type
1                   no                -- Pharmaceutical Therapy, NOS
2                   no                --      Radiation Therapy, NOS
3                  yes                -- Pharmaceutical Therapy, NOS
4         not reported                --      Radiation Therapy, NOS
5                  yes                -- Pharmaceutical Therapy, NOS
6         not reported                --      Radiation Therapy, NOS
                updated_datetime.2 tumor_confined_to_organ_of_origin
1 2019-07-31T15:29:30.691618-05:00                                --
2 2019-07-31T15:29:30.691618-05:00                                --
3 2019-07-31T15:29:33.659543-05:00                                --
4 2019-07-31T15:29:33.659543-05:00                                --
5 2019-07-31T15:29:36.641451-05:00                                --
6 2019-07-31T15:29:36.641451-05:00                                --
  tumor_focality  tumor_grade tumor_largest_dimension_diameter
1             -- not reported                               --
2             -- not reported                               --
3             -- not reported                               --
4             -- not reported                               --
5             -- not reported                               --
6             -- not reported                               --
  tumor_regression_grade tumor_stage               updated_datetime.3
1                     --   stage iib 2019-08-08T17:20:27.800986-05:00
2                     --   stage iib 2019-08-08T17:20:27.800986-05:00
3                     --   stage iia 2019-08-08T17:20:05.260508-05:00
4                     --   stage iia 2019-08-08T17:20:05.260508-05:00
5                     --    stage iv 2019-08-08T17:20:27.800986-05:00
6                     --    stage iv 2019-08-08T17:20:27.800986-05:00
  vascular_invasion_present vascular_invasion_type weiss_assessment_score
1                        --                     --                     --
2                        --                     --                     --
3                        --                     --                     --
4                        --                     --                     --
5                        --                     --                     --
6                        --                     --                     --
  wilms_tumor_histologic_subtype year_of_diagnosis
1                             --              2008
2                             --              2008
3                             --              2012
4                             --              2012
5                             --              2012
6                             --              2012
> str(metajoin)
'data.frame':	366 obs. of  165 variables:
 $ X                                       : int  76 76 142 142 147 147 271 271 427 427 ...
 $ CaseID                                  : chr  "01775b06-5836-469c-8537-120cb8cc94e9" "01775b06-5836-469c-8537-120cb8cc94e9" "02dbd5fa-e31f-4486-8df8-5b851f2e92bd" "02dbd5fa-e31f-4486-8df8-5b851f2e92bd" ...
 $ Barcode                                 : Factor w/ 11192 levels "TCGA-02-0047-01A-01R",..: 8733 8733 8692 8692 8695 8695 8728 8728 8732 8732 ...
 $ Cancertype                              : Factor w/ 33 levels "Acute Myeloid Leukemia",..: 21 21 21 21 21 21 21 21 21 21 ...
 $ Sampletype                              : Factor w/ 7 levels "Additional - New Primary",..: 5 5 5 5 5 5 5 5 5 5 ...
 $ submitter_id                            : Factor w/ 185 levels "TCGA-2J-AAB1",..: 132 132 99 99 102 102 127 127 131 131 ...
 $ project_id                              : Factor w/ 1 level "TCGA-PAAD": 1 1 1 1 1 1 1 1 1 1 ...
 $ age_at_index                            : int  53 53 54 54 58 58 66 66 64 64 ...
 $ age_is_obfuscated                       : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ cause_of_death                          : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ cause_of_death_source                   : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ created_datetime                        : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ days_to_birth                           : int  -19718 -19718 -19839 -19839 -21501 -21501 -24117 -24117 -23703 -23703 ...
 $ days_to_death                           : Factor w/ 97 levels "--","103","1059",..: 65 65 39 39 72 72 12 12 7 7 ...
 $ demographic_id                          : Factor w/ 185 levels "00ecd802-e725-5a44-8bc1-bec33be4695c",..: 35 35 26 26 88 88 136 136 60 60 ...
 $ ethnicity                               : Factor w/ 3 levels "hispanic or latino",..: 2 2 2 2 2 2 2 2 2 2 ...
 $ gender                                  : Factor w/ 2 levels "female","male": 1 1 1 1 1 1 1 1 2 2 ...
 $ occupation_duration_years               : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ premature_at_birth                      : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ race                                    : Factor w/ 4 levels "asian","black or african american",..: 4 4 4 4 4 4 2 2 4 4 ...
 $ state                                   : Factor w/ 1 level "released": 1 1 1 1 1 1 1 1 1 1 ...
 $ submitter_id.1                          : Factor w/ 185 levels "TCGA-2J-AAB1_demographic",..: 132 132 99 99 102 102 127 127 131 131 ...
 $ updated_datetime                        : Factor w/ 185 levels "2019-07-31T15:29:30.691618-05:00",..: 1 1 2 2 3 3 4 4 5 5 ...
 $ vital_status                            : Factor w/ 2 levels "Alive","Dead": 2 2 2 2 2 2 2 2 2 2 ...
 $ weeks_gestation_at_birth                : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ year_of_birth                           : Factor w/ 47 levels "--","1922","1924",..: 33 33 36 36 32 32 20 20 23 23 ...
 $ year_of_death                           : Factor w/ 10 levels "--","2002","2007",..: 5 5 1 1 1 1 7 7 5 5 ...
 $ age_at_diagnosis                        : int  19718 19718 19839 19839 21501 21501 24117 24117 23703 23703 ...
 $ ajcc_clinical_m                         : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ ajcc_clinical_n                         : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ ajcc_clinical_stage                     : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ ajcc_clinical_t                         : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ ajcc_pathologic_m                       : Factor w/ 3 levels "M0","M1","MX": 1 1 3 3 2 2 1 1 1 1 ...
 $ ajcc_pathologic_n                       : Factor w/ 5 levels "--","N0","N1",..: 3 3 2 2 2 2 2 2 2 2 ...
 $ ajcc_pathologic_stage                   : Factor w/ 8 levels "--","Stage I",..: 6 6 5 5 8 8 5 5 5 5 ...
 $ ajcc_pathologic_t                       : Factor w/ 6 levels "--","T1","T2",..: 4 4 4 4 4 4 4 4 4 4 ...
 $ ajcc_staging_system_edition             : Factor w/ 3 levels "5th","6th","7th": 2 2 3 3 3 3 2 2 2 2 ...
 $ anaplasia_present                       : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ anaplasia_present_type                  : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ ann_arbor_b_symptoms                    : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ ann_arbor_clinical_stage                : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ ann_arbor_extranodal_involvement        : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ ann_arbor_pathologic_stage              : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ annotation_id                           : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ case_id.1                               : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ case_submitter_id                       : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ category                                : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ classification                          : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ created_datetime.1                      : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ creator                                 : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ entity_id                               : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ entity_submitter_id                     : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ entity_type                             : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ legacy_created_datetime                 : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ legacy_updated_datetime                 : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ notes                                   : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ state.1                                 : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ status                                  : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ submitter_id.2                          : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ updated_datetime.1                      : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ best_overall_response                   : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ breslow_thickness                       : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ burkitt_lymphoma_clinical_variant       : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ child_pugh_classification               : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ circumferential_resection_margin        : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ classification_of_tumor                 : Factor w/ 1 level "not reported": 1 1 1 1 1 1 1 1 1 1 ...
 $ cog_liver_stage                         : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ cog_neuroblastoma_risk_group            : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ cog_renal_stage                         : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ cog_rhabdomyosarcoma_risk_group         : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ created_datetime.2                      : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ days_to_best_overall_response           : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ days_to_diagnosis                       : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ days_to_last_follow_up                  : Factor w/ 113 levels "--","1","1021",..: 1 1 43 43 81 81 1 1 1 1 ...
 $ days_to_last_known_disease_status       : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ days_to_recurrence                      : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ diagnosis_id                            : Factor w/ 185 levels "002c9efa-a79e-5691-9bb6-34eff2ea2c33",..: 17 17 147 147 92 92 102 102 31 31 ...
 $ enneking_msts_grade                     : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ enneking_msts_metastasis                : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ enneking_msts_stage                     : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ enneking_msts_tumor_site                : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ esophageal_columnar_dysplasia_degree    : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ esophageal_columnar_metaplasia_present  : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ figo_stage                              : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ first_symptom_prior_to_diagnosis        : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ gastric_esophageal_junction_involvement : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ gleason_grade_group                     : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ goblet_cells_columnar_mucosa_present    : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ gross_tumor_weight                      : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ icd_10_code                             : Factor w/ 5 levels "C25.0","C25.1",..: 5 5 1 1 3 3 5 5 5 5 ...
 $ igcccg_stage                            : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ inpc_grade                              : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ inpc_histologic_group                   : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ inrg_stage                              : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ inss_stage                              : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ international_prognostic_index          : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ irs_group                               : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ irs_stage                               : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
 $ ishak_fibrosis_score                    : Factor w/ 1 level "--": 1 1 1 1 1 1 1 1 1 1 ...
  [list output truncated]







# ===> 191217rhdf5.R
library("dplyr")

library(rhdf5)
library(preprocessCore)


ptcga="/media/cytogenbi1/e6ec2b5e-fd48-426e-82ab-0e7578d5b110/home/desktop-bi-16/TCGA"
setwd(ptcga)

TCGAh5<-H5Fopen("tcga_matrix.h5")
Tgene=h5read(TCGAh5, "meta/genes")
analytes.submitter_id=h5read(TCGAh5, "/meta/gdc_cases.samples.portions.analytes.submitter_id")

Tcancertype=h5read(TCGAh5,"/meta/cancertype")
Tsample_type=h5read(TCGAh5,"/meta/gdc_cases.samples.sample_type")

Tsample_id=h5read(TCGAh5,"/meta/sampleid")
Texpression = h5read(TCGAh5, "data/expression")

rownames(Texpression) = Tgene
colnames(Texpression) = Tsample_id

write.csv(Texpression,file="191217TCGAAllcancer.csv")

### make meta file "Sampleid","Barcode","Cancertype","Sampletype"
meta1<-data.frame(matrix(nrow=length(analytes.submitter_id), ncol=4))
colnames(meta1)=c("Sampleid","Barcode","Cancertype","Sampletype")
rownames(meta1)

meta1["Barcode"]=analytes.submitter_id
meta1["Cancertype"]=Tcancertype
meta1["Sampletype"]=Tsample_type
meta1["Sampleid"]=Tsample_id

write.csv(meta1,file="191217modTCGACllinical.csv")



# gdc file id
> head(Tsample_id)
[1] "3DFF72D2-F292-497E-ACE3-6FAA9C884205"
[2] "B1E54366-42B9-463C-8615-B34D52BD14DC"
[3] "473713F7-EB41-4F20-A37F-ACD209E3CB75"
[4] "11F18F54-9B33-4C33-BDF9-0F093F4F3336"
[5] "136B7576-1108-4FA3-8254-6069F0CA879A"
[6] "E81FA8B7-3FFE-4F73-94AF-0B5257D7F81A"

# ==> PAADclinical.tsv <==
#"37daa7f7-df62-5f38-8035-c17d2a8a931b"


#=========>   191202rhdf5.R
### Parsing H5 file

# Scripts to extract tab separated gene expression files can be created through the graphical user interface of ARCHS4. The script has to be executed as an R-script. A free version of R can be downloaded from: www.rstudio.com. Upon execution the script should install all required dependencies, and then download the full gene expression file before extracting the selected samples.

destination_tcga="tcga_matrix.h5"
destination_file = "/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/BreastCancer/data/ReCount2OverARCHS4/GTEx_matrix.h5"

# Retrieve information from compressed data
h5ls(destination_tcga)

Tsamplid=h5read(destination_file, "/meta/sampleid")
#> head(Tsamples)
#[1] "3DFF72D2-F292-497E-ACE3-6FAA9C884205"
#[2] "B1E54366-42B9-463C-8615-B34D52BD14DC"
#[3] "473713F7-EB41-4F20-A37F-ACD209E3CB75"
h5read(destination_file,"")
#Tgdcsamplid=h5read(destination_file, "/meta/sampleid/meta/gdc_cases.samples.sample_id")
Tinfo=h5read(destination_file,"/info")

Tcaseid=h5read(destination_file,"/meta/gdc_cases.case_id")
#> head(Tcaseid)
#[1] "0004d251-3f70-4395-b175-c94c2f5b1b81"
#[2] "000d566c-96c7-4f1c-b36e-fa2222467983"

submitter_id=h5read(destination_file,"/meta/gdc_cases.samples.submitter_id")
#/meta/gdc_cases.samples.submitter_id
#[1] "TCGA-DD-AAVP-01A" "TCGA-KK-A7B2-01A" "TCGA-DC-6158-01A" "TCGA-DD-A4NP-01A"
#[5] "TCGA-HQ-A5ND-01A" "TCGA-HT-A614-01A"
sample_id=h5read(destination_file,"/meta/gdc_cases.samples.sample_id")
#> head(sample_id)
#[1] "9259e9ee-7279-4b62-8512-509cb705029c"
#[2] "bccb7f9d-8dde-45b7-a50d-6c7233239ceb"





##================================================================================================================##
#--------------------------------------------------------------------------------------------------#
# To extract TCGA Breast expression  1246
#--------------------------------------------------------------------------------------------------#
library("rhdf5")
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("preprocessCore")
library("preprocessCore")

base_dir <- "/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/BreastCancer/data/ReCount2OverARCHS4"
setwd(base_dir)
samples <- list.files(base_dir)

destination_file = "TCGA_matrix.h5"


### Extract Columns

genes = h5read(destination_file, "meta/genes")
#TCGA Barcode
analytes.submitter_id=h5read(destination_file,"/meta/gdc_cases.samples.portions.analytes.submitter_id")

head(analytes.submitter_id)
#> head(analytes.submitter_id) #[1] "TCGA-DD-AAVP-01A-11R" "TCGA-KK-A7B2-01A-12R" "TCGA-DC-6158-01A-11R"

Tcancertype=h5read(destination_file,"/meta/cancertype")
#Breast Invasive Carcinoma 1246

sample_type=h5read(destination_file,"/meta/gdc_cases.samples.sample_type")
> table(sample_type)
sample_type
                       Additional - New Primary 
                                             11 
                          Additional Metastatic 
                                              1 
                                     Metastatic 
                                            394 
Primary Blood Derived Cancer - Peripheral Blood 
                                            126 
                                  Primary Tumor 
                                           9962 
                                Recurrent Tumor 
                                             50 
                            Solid Tissue Normal 
                                            740 

#breast Primarysite extract
Tprimarysite=h5read(destination_file,"/meta/gdc_cases.project.primary_site")
#> head(Tprimarysite)  #[1] "Liver"      "Prostate"   "Colorectal" "Liver"      "Bladder"   


site_locations = which(Tprimarysite %in% "Breast")
length(site_locations)

expression = h5read(TCGAh5, "data/expression")
expression = h5read(destination_file, "data/expression", index=list(1:length(genes), site_locations))

rownames(expression) = genes
colnames(expression) = analytes.submitter_id[site_locations]

### log2 normalization
expression=log2(expression+1)

### write csv
write.csv(expression,file="/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/BreastCancer/data/ReCount2OverARCHS4/191203TCGABreastTissue.csv")

### make meta file "Barcode","Cancertype","Sampletype"
meta1<-data.frame(matrix(nrow=length(analytes.submitter_id), ncol=3))
colnames(meta1)=c("Barcode","Cancertype","Sampletype")
rownames(meta1)

meta1["Barcode"]=analytes.submitter_id
meta1["Cancertype"]=Tcancertype
meta1["Sampletype"]=sample_type

write.csv(meta1,file="/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/BreastCancer/data/ReCount2OverARCHS4/191209TCGACllinical.csv")

#--------------------------------------------------------------------------------------------------#
### sample type extraction , join metafile
#--------------------------------------------------------------------------------------------------#

library("dplyr")
library("stringr")

# PC2
setwd("/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/BreastCancer/data/ReCount2OverARCHS4/")
# PC1 
setwd("/media/cytogenbi1/e6ec2b5e-fd48-426e-82ab-0e7578d5b110/home/desktop-bi-16/TCGA")


TCGAbreast=read.csv("191203TCGABreastTissue.csv", row.names=1, sep = ",", header = T)
meta1=read.csv("191209TCGACllinical.csv", row.names=1, header = T)

#TCGAbreast_bar=colnames(TCGAbreast)
meta1["BarcodeMod"]=str_replace_all(meta1$Barcode,"-",".")


> head(meta1)
  X              Barcode                     Cancertype    Sampletype
1 1 TCGA-DD-AAVP-01A-11R Liver Hepatocellular Carcinoma Primary Tumor
2 2 TCGA-KK-A7B2-01A-12R        Prostate Adenocarcinoma Primary Tumor
3 3 TCGA-DC-6158-01A-11R          Rectum Adenocarcinoma Primary Tumor
4 4 TCGA-DD-A4NP-01A-11R Liver Hepatocellular Carcinoma Primary Tumor
5 5 TCGA-HQ-A5ND-01A-11R   Bladder Urothelial Carcinoma Primary Tumor
6 6 TCGA-HT-A614-01A-11R       Brain Lower Grade Glioma Primary Tumor
            BarcodeMod
1 TCGA.DD.AAVP.01A.11R
2 TCGA.KK.A7B2.01A.12R
3 TCGA.DC.6158.01A.11R
4 TCGA.DD.A4NP.01A.11R
5 TCGA.HQ.A5ND.01A.11R
6 TCGA.HT.A614.01A.11R


> colnames(meta1)
[1] "X"          "Barcode"    "Cancertype" "Sampletype" "BarcodeMod"

> table(meta_breast$Sampletype)

                       Additional - New Primary                                               0 
                          Additional Metastatic                                               0 
                                     Metastatic                                               7 
Primary Blood Derived Cancer - Peripheral Blood                                               0 
                                  Primary Tumor                                            1127 
                                Recurrent Tumor                                               0 
                            Solid Tissue Normal                                             112 


meta_breast=subset(meta1, Cancertype == "Breast Invasive Carcinoma")
meta_breast_primary=subset(meta_breast, Sampletype=="Primary Tumor")
meta_breast_normal=subset(meta_breast, Sampletype=="Solid Tissue Normal")
meta_breast_metastatic=subset(meta_breast, Sampletype=="Metastatic")

# other cancer type
> table(meta_ExBRCA$Sampletype)

                       Additional - New Primary 
                                             11 
                          Additional Metastatic 
                                              1 
                                     Metastatic 
                                            387 
Primary Blood Derived Cancer - Peripheral Blood 
                                            126 
                                  Primary Tumor 
                                           8835 
                                Recurrent Tumor 
                                             50 
                            Solid Tissue Normal 
                                            628 


ExBRCA=read.csv("191209TCGAExceptBreastTissue_log2.csv", row.names=1, sep = ",", header = T)

meta_ExBRCA=subset(meta1, Cancertype != "Breast Invasive Carcinoma")
meta_ExBRCA_primary=subset(meta_ExBRCA, Sampletype=="Primary Tumor")
meta_ExBRCA_normal=subset(meta_ExBRCA, Sampletype=="Solid Tissue Normal")
meta_ExBRCA_metastatic=subset(meta_ExBRCA, Sampletype=="Metastatic")
meta_ExBRCA_recurrent=subset(meta_ExBRCA, Sampletype=="Recurrent Tumor")
meta_ExBRCA_peripheral=subset(meta_ExBRCA, Sampletype=="Primary Blood Derived Cancer - Peripheral Blood")

##include Additional - New Primary(11)>> primary , Additional Metastatic(1) >>metastatic
meta_breast_primary2=meta_ExBRCA[grep("Primary", meta_ExBRCA$Sampletype),]
meta_ExBRCA_metastatic2=meta_ExBRCA[grep("Metastatic", meta_ExBRCA$Sampletype),]

#--------------------------------------------------------------------------------------------------#
## To get "Tprimarysite != Breast" Expression Table
#--------------------------------------------------------------------------------------------------#

`%notin%` <- Negate(`%in%`)
ExBreast_locations = which(Tprimarysite %notin% "Breast")

length(ExBreast_locations) # Except Breast sample number [1] 10038
length(Tprimarysite) # Total sample number [1] 11284


analytes.submitter_id[ExBreast_locations]
table(Tprimarysite[ExBreast_locations])
> table(Tprimarysite[ExBreast_locations])

Adrenal Gland     Bile Duct       Bladder   Bone Marrow         Brain 
          266            45           433           126           707 
       Cervix    Colorectal     Esophagus           Eye Head and Neck 
          309           723           198            80           548 
       Kidney         Liver          Lung   Lymph Nodes         Ovary 
         1030           424          1156            48           430 
     Pancreas        Pleura      Prostate          Skin   Soft Tissue 
          183            87           558           473           265 
      Stomach        Testis        Thymus       Thyroid        Uterus 
          453           156           122           572           646 

ExBexpression = h5read(destination_file, "data/expression", index=list(1:length(genes), ExBreast_locations))

rownames(ExBexpression) = genes
colnames(ExBexpression) = analytes.submitter_id[ExBreast_locations]

### log2 normalization
ExBexpression=log2(ExBexpression+1)

### write csv
write.csv(ExBexpression,file="/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/BreastCancer/data/ReCount2OverARCHS4/191209TCGAExceptBreastTissue_log2.csv")



##================================================================================================================##
# Identify columns to be extracted
samples = h5read(destination_file, "meta/sample")


#sample_locations = which(samples %in% samp)

tissue = h5read(destination_file, "meta/tissue")
genes = h5read(destination_file, "meta/genes")

sampid = h5read(destination_file, "meta/sampid")
#series = h5read(destination_file, "meta/Sample_series_id")

# extract gene expression from compressed data
#expression = h5read(destination_file, "data/expression", index=list(1:length(genes), sample_locations))
expression = h5read(destination_file, "data/expression")
H5close()

# normalize samples and correct for differences in gene count distribution
expression = log2(expression+1)
expression = normalize.quantiles(expression)

rownames(expression) = genes
colnames(expression) = samples

#> length(tissue)
#[1] 9662
#> length(sampid)
#[1] 9662

tissue_locations = which(tissue %in% "Breast")
length(tissue_locations)
#[1] 218
ex_sample=h5read(destination_file, "data/expression", index=list(1:length(genes), tissue_locations))
rownames(ex_sample) =  genes
colnames(ex_sample) = sampid[tissue_locations]

write.csv(ex_sample,file="/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/BreastCancer/data/ReCount2OverARCHS4/191203GTExBreastTissue.csv")


ex_sample = log2(expression+1)
ex_sample = normalize.quantiles(expression)


##================================================================================================================##
## install R module related

# R script to download selected samples
# Copy code and run on a local machine to initiate download
# Check for dependencies and install if missing
packages <- c("rhdf5", "preprocessCore")
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
    print("Install required packages")
    source("https://bioconductor.org/biocLite.R")
    biocLite("rhdf5")
    biocLite("preprocessCore")
}
# Check if gene expression file was already downloaded, if not in current directory download file form repository
if(!file.exists(destination_file)){
    print("Downloading compressed gene expression matrix.")
    url = "https://s3.amazonaws.com/mssm-seq-matrix/human_matrix.h5"
    download.file(url, destination_file, quiet = FALSE)
} else{
    print("Local file already exists.")
}

# Selected samples to be extracted
##samp = c("GSM1224927","GSM1066120","GSM1224923","GSM1224929","GSM1224924","GSM1066118","GSM1066119","GSM1224925","GSM1224930","GSM1872071","GSM2282084","GSM1872064","GSM1872067","GSM1704845")
