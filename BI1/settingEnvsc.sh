# batch effects correction
conda install -c bioconda bioconductor-sva
conda create -n sva bioconductor-sva r-seurat

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

df1<-read.csv("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/04cmcpbmc/results/191016CMCPBMC_salmonTPM.csv")

df3=df2[2:58]
df4=df2[59:98]
df3["batch"]=1
df4["batch"]=2

df5 = cbind(df3,df4)

names<-colnames(df1)
data = cbind(names)


