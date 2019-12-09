Parsing H5 file

Scripts to extract tab separated gene expression files can be created through the graphical user interface of ARCHS4. The script has to be executed as an R-script. A free version of R can be downloaded from: www.rstudio.com. Upon execution the script should install all required dependencies, and then download the full gene expression file before extracting the selected samples.




destination_file = "/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/BreastCancer/data/ReCount2OverARCHS4/GTEx_matrix.h5"
extracted_expression_file = "GTEx_expression_matrix.tsv"


extracted_expression_file = "TCGA_expression_matrix.tsv"


# Retrieve information from compressed data
h5ls(destination_file)

Tsamplid=h5read(destination_file, "/meta/sampleid")
#> head(Tsamples)
#[1] "3DFF72D2-F292-497E-ACE3-6FAA9C884205"
#[2] "B1E54366-42B9-463C-8615-B34D52BD14DC"
#[3] "473713F7-EB41-4F20-A37F-ACD209E3CB75"
h5read(destination_file,"")
#Tgdcsamplid=h5read(destination_file, "/meta/sampleid/meta/gdc_cases.samples.sample_id")
Tinfo=h5read(destination_file,"/info")
Tcancertype=h5read(destination_file,"/meta/cancertype")
#Breast Invasive Carcinoma 1246
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
library("preprocessCore")

base_dir <- "/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/BreastCancer/data/ReCount2OverARCHS4"
setwd(base_dir)
samples <- list.files(base_dir)

destination_file = "/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/BreastCancer/data/ReCount2OverARCHS4/TCGA_matrix.h5"


### Extract Columns

genes = h5read(destination_file, "meta/genes")
#TCGA Barcode
analytes.submitter_id=h5read(destination_file,"/meta/gdc_cases.samples.portions.analytes.submitter_id")

head(analytes.submitter_id)
#> head(analytes.submitter_id) #[1] "TCGA-DD-AAVP-01A-11R" "TCGA-KK-A7B2-01A-12R" "TCGA-DC-6158-01A-11R"


#breast Primarysite extract
Tprimarysite=h5read(destination_file,"/meta/gdc_cases.project.primary_site")
#> head(Tprimarysite)  #[1] "Liver"      "Prostate"   "Colorectal" "Liver"      "Bladder"   


site_locations = which(Tprimarysite %in% "Breast")
length(site_locations)

expression = h5read(destination_file, "data/expression", index=list(1:length(genes), site_locations))

rownames(expression) = genes
colnames(expression) = analytes.submitter_id[site_locations]

### log2 normalization
expression=log2(expression+1)

### write csv
write.csv(expression,file="/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/BreastCancer/data/ReCount2OverARCHS4/191203TCGABreastTissue.csv")

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
