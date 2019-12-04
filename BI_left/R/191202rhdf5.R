Parsing H5 file

Scripts to extract tab separated gene expression files can be created through the graphical user interface of ARCHS4. The script has to be executed as an R-script. A free version of R can be downloaded from: www.rstudio.com. Upon execution the script should install all required dependencies, and then download the full gene expression file before extracting the selected samples.


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
library("rhdf5")
library("preprocessCore")

base_dir <- "/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/BreastCancer/data/ReCount2OverARCHS4"
setwd(base_dir)
samples <- list.files(base_dir)

destination_file = "/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/BreastCancer/data/ReCount2OverARCHS4/GTEx_matrix.h5"
extracted_expression_file = "GTEx_expression_matrix.tsv"


destination_file = "/media/cytogenbi2/6eaf3ba8-a866-4e8a-97ef-23c61f7da612/BreastCancer/data/ReCount2OverARCHS4/TCGA_matrix.h5"
extracted_expression_file = "TCGA_expression_matrix.tsv"

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
Tprimarysite=h5read(destination_file,"/meta/gdc_cases.project.primary_site")
#> head(Tprimarysite)
#[1] "Liver"      "Prostate"   "Colorectal" "Liver"      "Bladder"   
#[6] "Brain"   
Breast 1246

#> head(Tcaseid)
#[1] "0004d251-3f70-4395-b175-c94c2f5b1b81"
#[2] "000d566c-96c7-4f1c-b36e-fa2222467983"
#[3] "0011a67b-1ba9-4a32-a6b8-7850759a38cf"

samples = h5read(destination_file, "meta/sample")

# Identify columns to be extracted
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
