######## scater 안깔림 !!!!!!
#conda install -c bioconda bioconductor-scater
conda create -n scater bioconductor-scater bioconductor-deseq2 

Executing transaction: done
#
# To activate this environment, use
#
#     $ conda activate scater
#
# To deactivate an active environment, use
#
#     $ conda deactivate

#=============================================

df1<-read.table("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/gtfgtmod2.txt")
names(df1)<-c("chr", "TXNAME", "GENEID")
tx2gene <-df1[,c(3,2)]
#=============================================
##salmon import
#=============================================
setwd("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon")
dir <- system.file("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon", package = "tximportData")
list.files(dir)
#system.file(..., package = "base", lib.loc = NULL,mustWork = FALSE)
dir<-"/media/desktop-bi-16/D2C67EE7C67ECAED/BI/"
samples=c("2-BY1-1","2-BY2-1","CMC-013_40")
files <- file.path(dir, "07salmon", samples, "quant.sf")
names(files)<-samples
#names(files) <- paste0("sample", 1:6)
all(file.exists(files))

library(tximport)
txi<-tximport(files,type = "salmon", tx2gene = tx2gene)
names(txi)
head(txi$counts)
write.csv(as.data.frame(txi$counts), 
          file="/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/results/sclc_CMC_salmonCounts.csv")

Executing transaction: done
#
# To activate this environment, use
#
#     $ conda activate seurat
#
# To deactivate an active environment, use
#
#     $ conda deactivate


#=============================================
##scater input
#=============================================

met1<- calculateQCMetrics(txi$counts, exprs_values = "counts",
feature_controls = NULL, cell_controls = NULL, percent_top = c(50,100, 200, 500), detection_limit = 0, use_spikes = TRUE,compact = FALSE, BPPARAM = SerialParam())

> head(sc_example_cell_info)
             Cell Mutation_Status Cell_Cycle Treatment
Cell_001 Cell_001        positive          S    treat1
Cell_002 Cell_002        positive         G0    treat1
Cell_003 Cell_003        negative         G1    treat1
Cell_004 Cell_004        negative          S    treat1
Cell_005 Cell_005        negative         G1    treat2
Cell_006 Cell_006        negative         G0    treat1

          Cell_029 Cell_030 Cell_031 Cell_032 Cell_033 Cell_034 Cell_035
Gene_0001      788     1549      458        0        0     1279        0
Gene_0002       24     1389        1        2        0        1        0
Gene_0003      361        0        0        0        0        0        1
Gene_0004        0     1926        0        0        0        1     1155
Gene_0005        0        1        1        0        0        2        1
Gene_0006        0        8        5      170        0      662        0










