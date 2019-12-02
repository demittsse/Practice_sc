#######################################################
     sample       outcome       batch          cancer  
 Min.   : 1   Biopsy  : 9   Min.   :1.000   Biopsy: 9  
 1st Qu.:15   mTCC    :12   1st Qu.:2.000   Cancer:40  
 Median :29   Normal  : 8   Median :2.000   Normal: 8  
 Mean   :29   sTCC-CIS:16   Mean   :3.053              
 3rd Qu.:43   sTCC+CIS:12   3rd Qu.:5.000              
 Max.   :57                 Max.   :5.000     
#######################################################


df1<-read.csv("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/04cmcpbmc/resul
ts/191016CMCPBMC_salmonTPM.csv",row.names=1, sep = ",", header=T)

meta1<-data.frame(matrix(nrow=length(colnames(df1)), ncol=5))
colnames(meta1)=c("sample","outcome","batch","cancer","Sample")
rownames(meta1)=colnames(df1)

meta1["Sample"]=colnames(df1)
meta1["sample"]=c(1:length(colnames(df1)))
meta1[grep("CMC.011",meta1$Sample),]["batch"]=1
meta1[grep("CMC.013",meta1$Sample),]["batch"]=2
meta1[grep("CMC.018",meta1$Sample),]["batch"]=3
meta1[grep("CMC.019",meta1$Sample),]["batch"]=4

meta1[grep("PBMC.03",meta1$Sample),]["batch"]=5
meta1[grep("PBMC.04",meta1$Sample),]["batch"]=6


### outcome: CTC -> LiquidBiopsy, PBMC -> Normal ###
meta1[grep("CMC",meta1$Sample),]["outcome"]="LiquidBiopsy"
meta1[grep("PBMC",meta1$Sample),]["outcome"]="Normal"

### cancer: CTC -> Cancer, PBMC -> Normal ###
meta1[grep("CMC",meta1$Sample),]["cancer"]="Cancer"
meta1[grep("PBMC",meta1$Sample),]["cancer"]="Normal"

meta1=meta1[1:4]

######################################################
pheno=meta1
pheno$outcome<-as.factor(pheno$outcome)
pheno$cancer<-as.factor(pheno$cancer)

edata=df1
batch=pheno$batch
mod=model.matrix(~as.factor(cancer), data = pheno)

# parametric adjustment
combat_edata1 = ComBat(dat=edata, batch=batch, mod=NULL, par.prior=TRUE, prior.p
lots=FALSE)

# non-parametric adjustment, mean-only version
combat_edata2 = ComBat(dat=edata, batch=batch, mod=NULL, par.prior=FALSE, mean.o
nly=TRUE)

# reference-batch version, with covariates
combat_edata3 = ComBat(dat=edata, batch=batch, mod=mod, par.prior=TRUE, ref.batc
h=3)

######################################################
> combat_edata1 = ComBat(dat=edata, batch=batch, mod=NULL, par.prior=TRUE, prior
.plots=FALSE)
Found6batches
Note: one batch has only one sample, setting mean.only=TRUE
Adjusting for0covariate(s) or covariate level(s)
Standardizing Data across genes
Error in ((dat - t(design %*% B.hat))^2) %*% rep(1/n.array, n.array) : 
  수치 또는 복소수형태의 행렬 혹은 벡터 인자가 요구됩니다
######################################################

