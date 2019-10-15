STAR --genomeDir /media/desktop-bi-16/D2C67EE7C67ECAED/BI/02ref/STAR --readFilesIn /media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/CMC-013_40_1_val_1.fq,/media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/CMC-013_40_2_val_2.fq --outFileNamePrefix /media/desktop-bi-16/D2C67EE7C67ECAED/BI/04sam/CMC01340_BC  --runThreadN 4 --outFilterType BySJout --outFilterMultimapNmax 1 --alignSJoverhangMin 8 --alignSJDBoverhangMin 1 --outFilterMismatchNmax 999 --alignIntronMin 20 --alignIntronMax 1000000 --alignMatesGapMax 1000000 --outSAMtype BAM Unsorted --quantMode GeneCounts
#=============================================
#featureCounts Install
sudo apt install subread

#featureCounts running
featureCounts -a /media/desktop-bi-16/D2C67EE7C67ECAED/BI/BI/01reference/ensembl/Homo_sapiens.GRCh37.75.gtf -o /media/desktop-bi-16/D2C67EE7C67ECAED/BI/07featurecounts/epCount.txt /media/desktop-bi-16/D2C67EE7C67ECAED/BI/04sam/CMC01340_BCAligned.out.bam -F SAF -f --read2pos 5 -O
#=============================================
13_40_raw <-read.table(file = system.file('extdata', '/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07featurecounts/epCount.txt', package ='Seurat'), as.is = TRUE)
#=============================================
kallisto index -i Homo_sapiens.GRCh37.75.cdna.ncrna.kalisto.idx 
Homo_sapiens.GRCh37.75.cdna.ncrna.fa

#=============================================
library(dplyr)
#setwd("/Volumes/mdarisngc03.mdanderson.edu/scratch/RNA-seq-26357338/")

#list.files()

counts.cmc<- read.table("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07htseq/CMC-013_40_HtSeqCount.txt", sep="\t", header=F, stringsAsFactors = F)

counts.cmc<- read.table("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07featurecounts/epCount.txt", sep="\t", header=F, stringsAsFactors = F)

counts.50R<- read.table("STAR_50R-30393469_htseq.cnt", sep="\t", header=F, stringsAsFactors = F)
counts.WT<- read.table("STAR_WT-30393468_htseq.cnt", sep="\t", header=F, stringsAsFactors = F)

counts.df<- cbind(counts.WT, counts.3R, counts.50R)
counts.df<- counts.df[, c(1,2,4,6)]
names(counts.df)<- c("gene_name", "HTseq.WT", "HTseq.3R", "HTseq.50R")
names(counts.df)<-c("gene_name", "CMC-14-40")
## get rid of the digits in the end of the gene_name
counts.df<- counts.df %>% mutate(gene_name = gsub("\\.[0-9]+", "", gene_name)) 

df1<-read.table("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/gtfgtmod2.txt")
names(df1)<-c("chr", "TXNAME", "GENEID")
tx2gene <-df1[,c(3,2)]

library(tximport)
txi<-tximport("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/CMC-013_40/quant.sf", type='salmon', tx2gene = tx2gene)

txi.tx <- tximport("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/CMC-013_40/quant.sf", type = "salmon", txOut = TRUE)

txi.sum <- summarizeToGene(txi.tx, tx2gene)
all.equal(txi$counts, txi.sum$counts)

library(DESeq2)

sampleTable <- data.frame(condition = factor(rep(c("A", "B"), each = 3)))
rownames(sampleTable) <- colnames(txi$counts)


BiocManager::install("rhdf5")
# tx.kallisto <- tximport('/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07kallisto/CMC-013_40_kallisto/abundance.tsv', type = "kallisto", tx2gene = tx2gene, reader = read_tsv, countsFromAbundance = "lengthScaledTPM")
                        
tx.salmon <- tximport("/media/desktop-bi-16/92E3-5E93/CMC-013_40_salmon/quant.sf", type = "salmon", tx2gene = tx2gene, reader = read_tsv, countsFromAbundance = "lengthScaledTPM")
                      


http://cf.10xgenomics.com/samples/cell-vdj/2.2.0/vdj_v1_hs_nsclc_5gex/vdj_v1_hs_nsclc_5gex_filtered_gene_bc_matrices_h5.h5


#=============================================
cmc.data<-Read10X
pr1<-CreateSeuratObject(counts.cmc, project = "ProjectCMC", assay = "RNA",
  min.cells = 3, min.features = 200, names.field = 1,
  names.delim = "_", meta.data = NULL)

PR1[["percent.mt"]] <- PercentageFeatureSet(PR1, pattern = "^MT-")

counts.cmc<- read.table("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07featurecounts/epCount.txt", sep="\t", header=T, stringsAsFactors = F)

> str(counts.cmc)
'data.frame':	2828313 obs. of  7 variables:
 $ V1: chr  "Geneid" "1" "1" "1" ...
 $ V2: chr  "Chr" "pseudogene" "processed_transcript" "processed_transcript" ...
 $ V3: chr  "Start" "0" "0" "0" ...
 $ V4: chr  "End" "11869" "11869" "11869" ...
 $ V5: chr  "Strand" "+" "+" "+" ...
 $ V6: chr  "Length" "11870" "11870" "11870" ...
 $ V7: chr  "/media/desktop-bi-16/D2C67EE7C67ECAED/BI/04sam/CMC01340_BCAligned.out.bam" "0" "0" "0" ...

#=============================================
countToTpm <- function(counts, effLen)
{
    rate <- log(counts) - log(effLen)
    denom <- log(sum(exp(rate)))
    exp(rate - denom + log(1e6))
}
 
countToFpkm <- function(counts, effLen)
{
    N <- sum(counts)
    exp( log(counts) + log(1e9) - log(effLen) - log(N) )
}
 
fpkmToTpm <- function(fpkm)
{
    exp(log(fpkm) - log(sum(fpkm)) + log(1e6))
}
 
countToEffCounts <- function(counts, len, effLen)
{
    counts * (len / effLen)
}
 
#=============================================
counts.cmc<- read.table("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07featurecounts/epCount.txt", sep="\t", header=T, stringsAsFactors = F)

ens<-read.table("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/BI/01reference/ensembl/Homo_sapiens.GRCh37.75.gtf", sep="\t", header=F, skip=5)
countDf<-data.frame(count = counts.cmc$Counts, length = counts.cmc$)
ens$V9<- as.character(ens$V9)
gsp <- strsplit(ens$V9, split=";")
gID=strsplit(gsp[1],split="gene_id ")[2]

GENEID<-c(gsp[1])
TXNAME<-c(gsp[2])

cut -f1,9 /media/desktop-bi-16/D2C67EE7C67ECAED/BI/BI/01reference
/ensembl/Homo_sapiens.GRCh37.75.gtf |grep "transcript_id"|cut -d";" -f1,2 >gtfgtmod.txt

cut -f9 /media/desktop-bi-16/D2C67EE7C67ECAED/BI/BI/01reference/ensembl/Homo_sapiens.GRCh37.75.gtf

df1<-read.table("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/gtfgtmod2.txt")
#=============================================


wget ftp://ftp.ensembl.org/pub/release-75/fasta/homo_sapiens/cdna/Homo_sapiens.GRCh37.75.cdna.all.fa.gz  
wget ftp://ftp.ensembl.org/pub/release-75/fasta/homo_sapiens/ncrna/Homo_sapiens.GRCh37.75.ncrna.fa.gz
## merge together 

gunzip -c Homo_sapiens.GRCh37.75.cdna.all.fa.gz Homo_sapiens.GRCh37.75.ncrna.fa.gz > Homo_sapiens.GRCh37.75.cdna.ncrna.fa

Using default tag: latest
latest: Pulling from combinelab/salmon
Digest: sha256:dc3a7f5af6d9eb317f3044f11f27487e4930123cbe57ff057face52d00542fe7
Status: Image is up to date for combinelab/salmon:latest


$ conda config --add channels conda-forge
$ conda config --add channels bioconda
$ conda create -n salmon salmon

This will install the latest salmon in its own conda environment. The environment can then be activated via:

$ conda activate salmon



salmon index -t Homo_sapiens.GRCh37.75.cdna.ncrna.fa -i Homo_sapiens.GRCh37.75_quasi_index

salmon quant -i /media/desktop-bi-16/D2C67EE7C67ECAED/BI/02ref/salmon/Homo_sapiens.GRCh37.75_quasi_index -l A \
         -1 /media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/CMC-013_40_1_val_1.fq \
         -2 /media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/CMC-013_40_2_val_2.fq \
         -p 8 --validateMappings -o CMC-013_40
         

salmon quant -i /media/desktop-bi-16/D2C67EE7C67ECAED/BI/02ref/salmon/Homo_sapiens.GRCh37.75_quasi_index -l A \
         -1 /media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/CMC-013_40_1_val_1.fq \
         -2 /media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/CMC-013_40_2_val_2.fq \
         -p 8 --validateMappings -o 2-BY2-1
         
         /media/desktop-bi-16/D2C67EE7C67ECAED/BI/02raw/NCI-H69_plate based_190614/2-BY2-1_1.fastq.gz


# deseq2

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

##ERROR BiocManager::install("DESeq2")


conda install -c bioconda bioconductor-deseq2 
#
# To activate this environment, use
#
#     $ conda activate deseq2
#
# To deactivate an active environment, use
#
#     $ conda deactivate

library(DESeq2)

library(tximportData)

BiocManager::install("AnnotationHub")
library(AnnotationHub)
ah <- AnnotationHub()
query(ah, "EnsDb.Hsapiens.v37")

setwd("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/")
dir <- system.file("07salmon", package = "tximportData")
list.files(dir)

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

#BiocManager::install("tximportData")
BiocManager::install("tximport")
BiocManager::install("GenomicFeatures")
BiocManager::install("readr")

library(tximport)
library(GenomicFeatures)
library(readr)


Executing transaction: done
#
# To activate this environment, use
#
#     $ conda activate deseq
#
# To deactivate an active environment, use
#
#     $ conda deactivate

############ready
txdb <- makeTxDbFromGFF("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/BI/01reference/ensembl/Homo_sapiens.GRCh37.75.gtf")
k <- keys(txdb, keytype = "GENEID")
tx2gene <- select(txdb, keys = k, keytype = "GENEID", columns = "TXNAME")
head(tx2gene)

library(AnnotationHub)
ah <- AnnotationHub()
query(ah, "EnsDb.Hsapiens.v37")

install.packages("refGenome")
library(refGenome)
setwd("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/BI/01reference/ensembl/")
ens <- ensemblGenome()
read.gtf(ens, "Homo_sapiens.GRCh37.75.gtf")

#=============================================
Object of class 'ensemblGenome' with 2,764,635 rows and 21 columns.
  id seqid                             source    feature start   end score
2  2     1               processed_transcript transcript 11869 14409     .
3  3     1               processed_transcript       exon 11869 12227     .
4  4     1               processed_transcript       exon 12613 12721     .
5  5     1               processed_transcript       exon 13221 14409     .
6  6     1 transcribed_unprocessed_pseudogene transcript 11872 14412     .
7  7     1 transcribed_unprocessed_pseudogene       exon 11872 12227     .
  strand frame protein_id gene_biotype ccds_id transcript_name   transcript_id
2      +     .       <NA>   pseudogene    <NA>     DDX11L1-002 ENST00000456328
3      +     .       <NA>   pseudogene    <NA>     DDX11L1-002 ENST00000456328
4      +     .       <NA>   pseudogene    <NA>     DDX11L1-002 ENST00000456328
5      +     .       <NA>   pseudogene    <NA>     DDX11L1-002 ENST00000456328
6      +     .       <NA>   pseudogene    <NA>     DDX11L1-201 ENST00000515242
7      +     .       <NA>   pseudogene    <NA>     DDX11L1-201 ENST00000515242
  transcript_source         exon_id    gene_source gene_name         gene_id
2            havana            <NA> ensembl_havana   DDX11L1 ENSG00000223972
3            havana ENSE00002234944 ensembl_havana   DDX11L1 ENSG00000223972
4            havana ENSE00003582793 ensembl_havana   DDX11L1 ENSG00000223972
5            havana ENSE00002312635 ensembl_havana   DDX11L1 ENSG00000223972
6           ensembl            <NA> ensembl_havana   DDX11L1 ENSG00000223972
7           ensembl ENSE00002234632 ensembl_havana   DDX11L1 ENSG00000223972
  exon_number  tag
2        <NA> <NA>
3           1 <NA>
4           2 <NA>
5           3 <NA>
6        <NA> <NA>
7           1 <NA>


# trimmed fq: /media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/CMC-013_40_1_val_1.fq,/media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/CMC-013_40_2_val_2.fq

#=============================================

# To activate this environment, use
#
#     $ conda activate kallisto
#
# To deactivate an active environment, use
#
#     $ conda deactivate


kallisto index -i Homo_sapiens.GRCh37.75.cdna.ncrna.kalisto.idx /media/desktop-bi-16/D2C67EE7C67ECAED/BI/02ref/salmon/Homo_sapiens.GRCh37.75.cdna.ncrna.fa

kallisto quant -i Homo_sapiens.GRCh37.75.cdna.ncrna.kalisto.idx -o CMC-013_40_kallisto /media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/CMC-013_40_1_val_1.fq /media/desktop-bi-16/D2C67EE7C67ECAED/BI/03trim/CMC-013_40_2_val_2.fq --bias

