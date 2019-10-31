###########################################################


"""
$celseq
An object of class Seurat 
34363 features across 1004 samples within 1 assay 
Active assay: RNA (34363 features)

$celseq2
An object of class Seurat 
34363 features across 2285 samples within 1 assay 
Active assay: RNA (34363 features)

$fluidigmc1
An object of class Seurat 
34363 features across 638 samples within 1 assay 
Active assay: RNA (34363 features)

$smartseq2
An object of class Seurat 
34363 features across 2394 samples within 1 assay 
Active assay: RNA (34363 features)

"""

###########################################################
## start with 1 dataframe with multiple tech
library(Seurat)

df1<-read.csv("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/04cmcpbmc/results/191016CMCPBMC_salmonTPM.csv",row.names=1, sep = ",", header=T)


#platef<-read.csv("/media/desktop-bi-16/D2C67EE7C67ECAED/BI/07salmon/03plate/results/191015BY_ENSG.csv")

#length(colnames(df1))
#[1] 98
###########################################################
## make data-frame of meta.data
meta1<-data.frame(matrix(nrow=length(colnames(df1)), ncol=3))
colnames(meta1)=c("Sample","tech","celltype")
meta1["Sample"]=colnames(df1)

meta1["tech"]="fluidigmC1"

meta1[grep("CMC",meta1$Sample),]["tech"]="fluidigmc1"
meta1[grep("PBMC",meta1$Sample),]["tech"]="smartseq2"

meta1[grep("CMC",meta1$Sample),]["celltype"]="CMC"
meta1[grep("PBMC",meta1$Sample),]["celltype"]="PBMC"


rownames(meta1)=meta1$Sample
#meta1=meta1[2:3]

#df=subset(df, df$Celltype != "NA")
###########################################################
## Create Seurat Object
C1 <-CreateSeuratObject(counts=df1,meta.data=meta1)

C1.list <- SplitObject(object = C1, split.by = "tech")

"""
for (i in 1:length(x = C1.list)) {
    C1.list[[i]] <- NormalizeData(object = C1.list[[i]], verbose = FALSE)
    C1.list[[i]] <- FindVariableFeatures(object = C1.list[[i]], 
        selection.method = "vst", nfeatures = 100, verbose = FALSE)
}
"""
for (i in 1:length(x = C1.list)) {
    C1.list[[i]] <- NormalizeData(object = C1.list[[i]], verbose = FALSE)
    C1.list[[i]] <- FindVariableFeatures(object = C1.list[[i]], 
        selection.method = "disp", nfeatures = 100, verbose = FALSE)
}

### !!! Caution If tech name not match get error !!! ### 
reference.list <- C1.list[c("fluidigmc1","smartseq2")]

## Find Integration Anchors
#################################################################
FindIntegrationAnchors(object.list = NULL, assay = NULL,
  reference = NULL, anchor.features = 2000, scale = TRUE,
  normalization.method = c("LogNormalize", "SCT"),
  sct.clip.range = NULL, reduction = c("cca", "rpca"),
  l2.norm = TRUE, dims = 1:30, k.anchor = 5, k.filter = 200,
  k.score = 30, max.features = 200, nn.method = "rann", eps = 0,
  verbose = TRUE)
#################################################################
C1.anchors <- FindIntegrationAnchors(object.list = reference.list, dims = 1:30, k.anchor = 50, anchor.features = 100)

## IntegrateData
C1.integrated <- IntegrateData(anchorset = C1.anchors, dims = 1:30)


library(ggplot2)
library(cowplot)
# switch to integrated assay. The variable features of this assay are
# automatically set during IntegrateData
DefaultAssay(object = C1.integrated) <- "integrated"

# Run the standard workflow for visualization and clustering
C1.integrated <- ScaleData(object = C1.integrated, verbose = FALSE)
C1.integrated <- RunPCA(object = C1.integrated, npcs = 30, verbose = FALSE)
C1.integrated <- RunUMAP(object = C1.integrated, reduction = "pca", 
    dims = 1:30)
p1 <- DimPlot(object = C1.integrated, reduction = "umap", group.by = "tech")
p2 <- DimPlot(object = C1.integrated, reduction = "umap", group.by = "celltype", 
    label = TRUE, repel = TRUE) + NoLegend()
plot_grid(p1, p2)



#C1 <-CreateSeuratObject(df1, min.cells = 3, min.features = 200, project = "C1")
#plate <-CreateSeuratObject(platef, min.cells = 3, min.features = 200, project = "Plate")

#C1<-NormalizeData(C1,normalization.method = "LogNormalize", scale.factor = 1000)
#plate<-NormalizeData(plate,normalization.method = "LogNormalize", scale.factor = 1000)

#gcdata <- MergeMultipleSeuratObjects(list("C1"=C1, "plate"=plate))

###########################################################
## test data set ##
pancreas.data <- readRDS(file = "/media/desktop-bi-16/D2C67EE7C67ECAED/BI/test/pancreas_v3_files/pancreas_expression_matrix.rds")
metadata <- readRDS(file = "/media/desktop-bi-16/D2C67EE7C67ECAED/BI/test/pancreas_v3_files/pancreas_metadata.rds")

> C1.anchors <- FindIntegrationAnchors(object.list = reference.list, dims = 1:30)
Computing 2000 integration features
Scaling features for provided objects
  |++++++++++++++++++++++++++++++++++++++++++++++++++| 100% elapsed=01s  
Finding all pairwise anchors
  |                                                  | 0 % ~calculating  Running CCA
Merging objects
Finding neighborhoods
Finding anchors
	Found 3368 anchors
Filtering anchors
	Retained 2282 anchors
Extracting within-dataset neighbors
  |++++++++++++++++++++++++++++++++++++++++++++++++++| 100% elapsed=03s  
> C1.integrated <- IntegrateData(anchorset = C1.anchors, dims = 1:30)
Merging dataset 1 into 2
Extracting anchors for merged samples
Finding integration vectors
Finding integration vector weights
0%   10   20   30   40   50   60   70   80   90   100%
[----|----|----|----|----|----|----|----|----|----|
**************************************************|
Integrating data
> 
> library(ggplot2)
> library(cowplot)

********************************************************
Note: As of version 1.0.0, cowplot does not change the
  default ggplot2 theme anymore. To recover the previous
  behavior, execute:
  theme_set(theme_cowplot())
********************************************************

> # switch to integrated assay. The variable features of this assay are
> # automatically set during IntegrateData
> DefaultAssay(object = C1.integrated) <- "integrated"
> C1.integrated <- ScaleData(object = C1.integrated, verbose = FALSE)
> C1.integrated <- RunPCA(object = C1.integrated, npcs = 30, verbose = FALSE)
> C1.integrated <- RunUMAP(object = C1.integrated, reduction = "pca", 
+     dims = 1:30)
경고: The default method for RunUMAP has changed from calling Python UMAP via reticulate to the R-native UWOT using the cosine metric
To use Python UMAP via reticulate, set umap.method to 'umap-learn' and metric to 'correlation'
This message will be shown once per session
10:32:37 Read 3289 rows and found 30 numeric columns
10:32:37 Using Annoy for neighbor search, n_neighbors = 30
10:32:37 Building Annoy index with metric = cosine, n_trees = 50
0%   10   20   30   40   50   60   70   80   90   100%
[----|----|----|----|----|----|----|----|----|----|
**************************************************|
10:32:37 Writing NN index file to temp file /tmp/RtmpIGcWG1/file317e119ca31
10:32:37 Searching Annoy index using 1 thread, search_k = 3000
10:32:38 Annoy recall = 100%
10:32:38 Commencing smooth kNN distance calibration using 1 thread
10:32:39 Initializing from normalized Laplacian + noise
10:32:39 Commencing optimization for 500 epochs, with 134090 positive edges
0%   10   20   30   40   50   60   70   80   90   100%
[----|----|----|----|----|----|----|----|----|----|
**************************************************|
10:32:46 Optimization finished
> p1 <- DimPlot(object = C1.integrated, reduction = "umap", group.by = "tech")
> p2 <- DimPlot(object = C1.integrated, reduction = "umap", group.by = "celltype", 
+     label = TRUE, repel = TRUE) + NoLegend()
경고메시지(들): 
Using `as.character()` on a quosure is deprecated as of rlang 0.3.0.
Please use `as_label()` or `as_name()` instead.
This warning is displayed once per session. 

###########################################################

for (i in 1:length(x = C1.list)) {
    C1.list[[i]] <- NormalizeData(object = C1.list[[i]], verbose = FALSE)
    C1.list[[i]] <- FindVariableFeatures(object = C1.list[[i]], 
        selection.method = "vst", nfeatures = 100, verbose = FALSE)
}

reference.list <- C1.list[c("fluidigmc1","smartseq2")]
C1.anchors <- FindIntegrationAnchors(object.list = reference.list, dims = 1:30)

Computing 2000 integration features
Scaling features for provided objects
  |++++++++++++++++++++++++++++++++++++++++++++++++++| 100% elapsed=00s  
Finding all pairwise anchors
  |                                                  | 0 % ~calculating  Running CCA
irlba(A = mat3, nv = num.cc)에서 경고가 발생했습니다 : 
  You're computing too large a percentage of total singular values, use a standard svd instead.
Merging objects
Finding neighborhoods
Finding anchors
	Found 191 anchors
Filtering anchors
Error in nn2(data = c(0.235648773394202, 0.300103500142816, 0.253773320685022,  : 
  Cannot find more nearest neighbours than there are points

> for (i in 1:length(x = C1.list)) {
+     C1.list[[i]] <- NormalizeData(object = C1.list[[i]], verbose = FALSE)
+     C1.list[[i]] <- FindVariableFeatures(object = C1.list[[i]], 
+         selection.method = "vst", nfeatures = 100, verbose = FALSE)
+ }
Error in length(x = C1.list) : 객체 'C1.list'를 찾을 수 없습니다
> C1.list <- SplitObject(object = C1, split.by = "tech")
> for (i in 1:length(x = C1.list)) {
+     C1.list[[i]] <- NormalizeData(object = C1.list[[i]], verbose = FALSE)
+     C1.list[[i]] <- FindVariableFeatures(object = C1.list[[i]], 
+         selection.method = "vst", nfeatures = 100, verbose = FALSE)
+ }
> reference.list <- C1.list[c("fluidigmc1","smartseq2")]
###########################################################
> C1.anchors <- FindIntegrationAnchors(object.list = reference.list, dims = 1:30)
Computing 2000 integration features
Scaling features for provided objects
  |++++++++++++++++++++++++++++++++++++++++++++++++++| 100% elapsed=00s  
Finding all pairwise anchors
  |                                                  | 0 % ~calculating  Running CCA
irlba(A = mat3, nv = num.cc)에서 경고가 발생했습니다 : 
  You're computing too large a percentage of total singular values, use a standard svd instead.
Merging objects
Finding neighborhoods
Finding anchors
	Found 176 anchors
Filtering anchors
Error in nn2(data = c(0.300697560987096, 0.305909721121676, 0.343181105932653,  : 
  Cannot find more nearest neighbours than there are points

> C1.anchors <- FindIntegrationAnchors(object.list = reference.list, dims = 1:10)
Computing 2000 integration features
Scaling features for provided objects
  |++++++++++++++++++++++++++++++++++++++++++++++++++| 100% elapsed=00s  
Finding all pairwise anchors
  |                                                  | 0 % ~calculating  Running CCA
Merging objects
Finding neighborhoods
Finding anchors
	Found 180 anchors
Filtering anchors
Error in nn2(data = c(0.300697560987096, 0.305909721121676, 0.343181105932653,  : 
  Cannot find more nearest neighbours than there are points

> C1.anchors <- FindIntegrationAnchors(object.list = reference.list, dims = 1:30, anchor.features = 100)
Computing 100 integration features
Scaling features for provided objects
  |++++++++++++++++++++++++++++++++++++++++++++++++++| 100% elapsed=00s  
Finding all pairwise anchors
  |                                                  | 0 % ~calculating  Running CCA
irlba(A = mat3, nv = num.cc)에서 경고가 발생했습니다 : 
  You're computing too large a percentage of total singular values, use a standard svd instead.
Merging objects
Finding neighborhoods
Finding anchors
	Found 168 anchors
Filtering anchors
Error in nn2(data = c(0.407306294514599, 0.354158285551977, 0.432330487634838,  : 
  Cannot find more nearest neighbours than there are points

> C1.anchors <- FindIntegrationAnchors(object.list = reference.list, dims = 1:10, anchor.features = 100)
Computing 100 integration features
Scaling features for provided objects
  |++++++++++++++++++++++++++++++++++++++++++++++++++| 100% elapsed=00s  
Finding all pairwise anchors
  |                                                  | 0 % ~calculating  Running CCA
Merging objects
Finding neighborhoods
Finding anchors
	Found 169 anchors
Filtering anchors
Error in nn2(data = c(0.407306294514599, 0.354158285551977, 0.432330487634838,  : 
  Cannot find more nearest neighbours than there are points

> C1.anchors <- FindIntegrationAnchors(object.list = reference.list, dims = 1:10, k.anchor = 2, anchor.features = 100)
Computing 100 integration features
Scaling features for provided objects
  |++++++++++++++++++++++++++++++++++++++++++++++++++| 100% elapsed=00s  
Finding all pairwise anchors
  |                                                  | 0 % ~calculating  Running CCA
Merging objects
Finding neighborhoods
Finding anchors
	Found 57 anchors
Filtering anchors
Error in nn2(data = c(0.407306294514599, 0.354158285551977, 0.432330487634838,  : 
  Cannot find more nearest neighbours than there are points

> C1.anchors <- FindIntegrationAnchors(object.list = reference.list, dims = 1:10, k.anchor = 20, anchor.features = 100)
Computing 100 integration features
Scaling features for provided objects
  |++++++++++++++++++++++++++++++++++++++++++++++++++| 100% elapsed=00s  
Finding all pairwise anchors
  |                                                  | 0 % ~calculating  Running CCA
Merging objects
Finding neighborhoods
Finding anchors
	Found 782 anchors
Filtering anchors
Error in nn2(data = c(0.407306294514599, 0.354158285551977, 0.432330487634838,  : 
  Cannot find more nearest neighbours than there are points

> C1.anchors <- FindIntegrationAnchors(object.list = reference.list, dims = 1:10, k.anchor = 30, anchor.features = 100)
Computing 100 integration features
Scaling features for provided objects
  |++++++++++++++++++++++++++++++++++++++++++++++++++| 100% elapsed=00s  
Finding all pairwise anchors
  |                                                  | 0 % ~calculating  Running CCA
Merging objects
Finding neighborhoods
Finding anchors
	Found 1196 anchors
Filtering anchors
Error in nn2(data = c(0.407306294514599, 0.354158285551977, 0.432330487634838,  : 
  Cannot find more nearest neighbours than there are points

> C1.anchors <- FindIntegrationAnchors(object.list = reference.list, dims = 1:30, k.anchor = 30, anchor.features = 100)
Computing 100 integration features
Scaling features for provided objects
  |++++++++++++++++++++++++++++++++++++++++++++++++++| 100% elapsed=00s  
Finding all pairwise anchors
  |                                                  | 0 % ~calculating  Running CCA
irlba(A = mat3, nv = num.cc)에서 경고가 발생했습니다 : 
  You're computing too large a percentage of total singular values, use a standard svd instead.
Merging objects
Finding neighborhoods
Finding anchors
	Found 1197 anchors
Filtering anchors
Error in nn2(data = c(0.407306294514599, 0.354158285551977, 0.432330487634838,  : 
  Cannot find more nearest neighbours than there are points

> C1.anchors <- FindIntegrationAnchors(object.list = reference.list, dims = 1:30, k.anchor = 50, anchor.features = 100)
Computing 100 integration features
Scaling features for provided objects
  |++++++++++++++++++++++++++++++++++++++++++++++++++| 100% elapsed=00s  
Finding all pairwise anchors
  |                                                  | 0 % ~calculating  Running CCA
irlba(A = mat3, nv = num.cc)에서 경고가 발생했습니다 : 
  You're computing too large a percentage of total singular values, use a standard svd instead.
Merging objects
Finding neighborhoods
Error in nn2(data = c(0.159635351825626, 0.14791287481423, 0.137416804264381,  : 
  Cannot find more nearest neighbours than there are points



