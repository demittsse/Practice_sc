if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("rnaSeqMap")

library(rnaSeqMap)

plotGeneCoverage(gene_id, ex)
plotRegionCoverage(chr, start, end, strand, ex) 
plotExonCoverage (exon_id,ex)
plotCoverageHistogram (chr,start,end,strand,ex, skip)
plotGeneExonCoverage(gene_id, ex)
plotSI(chr,start,end,strand, exp1, exp2 )

