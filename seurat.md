dir<-setwd("/media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/01QC/10Merge/SMC009/filtered")

samples = list.files ("/media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/01QC/10Merge/SMC009/filtered", pattern = "Quant.genes.results")
files <- file.path(samples)
all(file.exists(files))

sample_name=gsub("scQuant.genes.results","",samples)
names(files)<-sample_name
txi<-tximport(files,type = "rsem", tx2gene = tx2gene)

write.csv(as.data.frame(txi$counts),
          file="200102SMC009_7ea_rsemTPMENSG.csv")

inputTPM="/media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/01QC/10Merge/SMC009/filtered/200102SMC009_7ea_rsemTPMENSG.csv"


cellranger count --id=run_count_1kpbmcs \
--fastqs=/mnt/home/user.name/yard/run_cellranger_count/pbmc_1k_v3_fastqs \
--sample=pbmc_1k_v3 \
--transcriptome=/mnt/home/user.name/yard/run_cellranger_count/refdata-cellranger-GRCh38-3.0.0

/media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/10X/HN00119076_10X/HN00119076_10X_RawData_Outs/10X_009/H72NHCCX2

cellranger count --id=run_count_10X_009 \
--fastqs=/media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/10X/HN00119076_10X/HN00119076_10X_RawData_Outs/10X_009/H72NHCCX2 \
--sample=10X_009 \
--transcriptome=/home/cytogenbi2/00source/refdata-cellranger-GRCh38-3.0.0
https://github.com/demittsse/Practice_sc.git
