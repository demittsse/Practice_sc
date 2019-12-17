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
