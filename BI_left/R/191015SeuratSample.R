> library(tximport)
> txi<-tximport(files,type = "salmon", tx2gene = tx2gene)
reading in files with read.delim (install 'readr' package for speed up)
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 
removing duplicated transcript rows from tx2gene
summarizing abundance
summarizing counts
summarizing length
> names(txi)
[1] "abundance"           "counts"              "length"             
[4] "countsFromAbundance"
> head(txi$counts)
                   [,1]  [,2]    [,3]    [,4] [,5] [,6] [,7]    [,8]     [,9]
ENSG00000000003 275.000 7.000   0.000   3.000  782    0    0 1126.00 1194.999
ENSG00000000005   0.000 0.000   0.000   0.000    0    0    0    0.00    0.000
ENSG00000000419   2.000 0.000 285.999 174.000   74    0    0  372.00  829.999
ENSG00000000457   0.000 0.866   0.000   0.000    0    0    1    0.00    1.008
ENSG00000000460 300.999 0.000   0.000 287.751    0    0    0   16.23  562.992
ENSG00000000938   0.000 0.000   0.000   0.000    0    0    0    0.00    0.000
                  [,10]   [,11] [,12] [,13]    [,14] [,15] [,16]   [,17]
ENSG00000000003 336.998 835.000 1.000   459 1463.003   784     0   0.000
ENSG00000000005   0.000   0.000 0.000     0    0.000     0     0   0.000
ENSG00000000419 104.000  57.000 0.000   270  468.000   173     0   1.000
ENSG00000000457   0.000   0.955 3.387    84    0.000     0     0  11.931
ENSG00000000460   0.000   9.045 4.014     0    0.000     0     0 287.735
ENSG00000000938   0.000   0.000 0.000     0    0.000     0     0   0.000
                  [,18]   [,19]   [,20] [,21] [,22]   [,23] [,24] [,25] [,26]
ENSG00000000003 147.000 296.000 570.000     0     0 547.775   198   987     0
ENSG00000000005   0.000   0.000   0.000     0     0   0.000     0     0     0
ENSG00000000419 227.999 318.000 118.000     0   145 177.000   377   178     0
ENSG00000000457   0.000   1.006   2.009     2     0   0.000     0     0     0
ENSG00000000460 160.000   0.000  75.993     0     9   0.000     0     0     0
ENSG00000000938   0.000   0.000   0.000     0     0   0.000     0     0     0
                  [,27]   [,28]   [,29]   [,30] [,31]   [,32] [,33]   [,34]
ENSG00000000003 415.000 768.000   1.000 391.000     0 126.999   170 1372.00
ENSG00000000005   0.000   0.000   0.000   0.000     0   0.000     0    0.00
ENSG00000000419  75.000   0.000 199.999 146.000   474   0.000    80  156.00
ENSG00000000457   2.012   0.000   0.000 231.001   330   0.000     0    2.99
ENSG00000000460 229.988   5.086   0.000   0.000     0   0.000     0    0.00
ENSG00000000938   0.000   0.000   0.000   0.000     0   0.000     0    0.00
                [,35] [,36] [,37] [,38] [,39] [,40]   [,41]   [,42] [,43] [,44]
ENSG00000000003   488   163   556   595     0    11   0.000 169.000  1031  1612
ENSG00000000005     0     0     0     0     0     0   0.000   0.000     0     0
ENSG00000000419     0   104   197   158   377   378 110.001 429.000   204     0
ENSG00000000457     0     0    45     0     0     0   0.000   0.000   526     1
ENSG00000000460     0    79     0     0     0     0   0.000 402.997     0     5
ENSG00000000938     0     0     0     0     0     0   0.000   0.000     0     0
> files
 [1] "/home/cytogen-bi2/03salmon/H1-30/quant.sf"
 [2] "/home/cytogen-bi2/03salmon/H1-35/quant.sf"
 [3] "/home/cytogen-bi2/03salmon/H1-39/quant.sf"
 [4] "/home/cytogen-bi2/03salmon/H1-43/quant.sf"
 [5] "/home/cytogen-bi2/03salmon/H1-46/quant.sf"
 [6] "/home/cytogen-bi2/03salmon/H1-47/quant.sf"
 [7] "/home/cytogen-bi2/03salmon/H2-13/quant.sf"
 [8] "/home/cytogen-bi2/03salmon/H2-15/quant.sf"
 [9] "/home/cytogen-bi2/03salmon/H2-17/quant.sf"
[10] "/home/cytogen-bi2/03salmon/H2-3/quant.sf" 
[11] "/home/cytogen-bi2/03salmon/H2-32/quant.sf"
[12] "/home/cytogen-bi2/03salmon/H2-35/quant.sf"
[13] "/home/cytogen-bi2/03salmon/H2-37/quant.sf"
[14] "/home/cytogen-bi2/03salmon/H2-39/quant.sf"
[15] "/home/cytogen-bi2/03salmon/H2-4/quant.sf" 
[16] "/home/cytogen-bi2/03salmon/H2-53/quant.sf"
[17] "/home/cytogen-bi2/03salmon/H2-54/quant.sf"
[18] "/home/cytogen-bi2/03salmon/H2-55/quant.sf"
[19] "/home/cytogen-bi2/03salmon/H2-56/quant.sf"
[20] "/home/cytogen-bi2/03salmon/H2-60/quant.sf"
[21] "/home/cytogen-bi2/03salmon/H2-62/quant.sf"
[22] "/home/cytogen-bi2/03salmon/H2-63/quant.sf"
[23] "/home/cytogen-bi2/03salmon/H2-64/quant.sf"
[24] "/home/cytogen-bi2/03salmon/H2-66/quant.sf"
[25] "/home/cytogen-bi2/03salmon/H2-67/quant.sf"
[26] "/home/cytogen-bi2/03salmon/H2-68/quant.sf"
[27] "/home/cytogen-bi2/03salmon/H2-7/quant.sf" 
[28] "/home/cytogen-bi2/03salmon/H2-71/quant.sf"
[29] "/home/cytogen-bi2/03salmon/H2-74/quant.sf"
[30] "/home/cytogen-bi2/03salmon/H2-75/quant.sf"
[31] "/home/cytogen-bi2/03salmon/H2-76/quant.sf"
[32] "/home/cytogen-bi2/03salmon/H2-77/quant.sf"
[33] "/home/cytogen-bi2/03salmon/H2-78/quant.sf"
[34] "/home/cytogen-bi2/03salmon/H2-79/quant.sf"
[35] "/home/cytogen-bi2/03salmon/H2-82/quant.sf"
[36] "/home/cytogen-bi2/03salmon/H2-83/quant.sf"
[37] "/home/cytogen-bi2/03salmon/H2-86/quant.sf"
[38] "/home/cytogen-bi2/03salmon/H2-88/quant.sf"
[39] "/home/cytogen-bi2/03salmon/H2-89/quant.sf"
[40] "/home/cytogen-bi2/03salmon/H2-9/quant.sf" 
[41] "/home/cytogen-bi2/03salmon/H2-91/quant.sf"
[42] "/home/cytogen-bi2/03salmon/H2-92/quant.sf"
[43] "/home/cytogen-bi2/03salmon/H2-94/quant.sf"
[44] "/home/cytogen-bi2/03salmon/H2-95/quant.sf"
> samples
 [1] "H1-30" "H1-35" "H1-39" "H1-43" "H1-46" "H1-47" "H1H2"  "H2-13" "H2-15"
[10] "H2-17" "H2-3"  "H2-32" "H2-35" "H2-37" "H2-39" "H2-4"  "H2-53" "H2-54"
[19] "H2-55" "H2-56" "H2-60" "H2-62" "H2-63" "H2-64" "H2-66" "H2-67" "H2-68"
[28] "H2-7"  "H2-71" "H2-74" "H2-75" "H2-76" "H2-77" "H2-78" "H2-79" "H2-82"
[37] "H2-83" "H2-86" "H2-88" "H2-89" "H2-9"  "H2-91" "H2-92" "H2-94" "H2-95"
> names(files)<-samples
Error in names(files) <- samples : 
  'names' 속성 [45]는 반드시 벡터 [44]와 같은 길이를 가져야 합니다
> samples<-c(samples[1:6], samples[8:45])
> names(files)<-samples
> files
                                      H1-30 
"/home/cytogen-bi2/03salmon/H1-30/quant.sf" 
                                      H1-35 
"/home/cytogen-bi2/03salmon/H1-35/quant.sf" 
                                      H1-39 
"/home/cytogen-bi2/03salmon/H1-39/quant.sf" 
                                      H1-43 
"/home/cytogen-bi2/03salmon/H1-43/quant.sf" 
                                      H1-46 
"/home/cytogen-bi2/03salmon/H1-46/quant.sf" 
                                      H1-47 
"/home/cytogen-bi2/03salmon/H1-47/quant.sf" 
                                      H2-13 
"/home/cytogen-bi2/03salmon/H2-13/quant.sf" 
                                      H2-15 
"/home/cytogen-bi2/03salmon/H2-15/quant.sf" 
                                      H2-17 
"/home/cytogen-bi2/03salmon/H2-17/quant.sf" 
                                       H2-3 
 "/home/cytogen-bi2/03salmon/H2-3/quant.sf" 
                                      H2-32 
"/home/cytogen-bi2/03salmon/H2-32/quant.sf" 
                                      H2-35 
"/home/cytogen-bi2/03salmon/H2-35/quant.sf" 
                                      H2-37 
"/home/cytogen-bi2/03salmon/H2-37/quant.sf" 
                                      H2-39 
"/home/cytogen-bi2/03salmon/H2-39/quant.sf" 
                                       H2-4 
 "/home/cytogen-bi2/03salmon/H2-4/quant.sf" 
                                      H2-53 
"/home/cytogen-bi2/03salmon/H2-53/quant.sf" 
                                      H2-54 
"/home/cytogen-bi2/03salmon/H2-54/quant.sf" 
                                      H2-55 
"/home/cytogen-bi2/03salmon/H2-55/quant.sf" 
                                      H2-56 
"/home/cytogen-bi2/03salmon/H2-56/quant.sf" 
                                      H2-60 
"/home/cytogen-bi2/03salmon/H2-60/quant.sf" 
                                      H2-62 
"/home/cytogen-bi2/03salmon/H2-62/quant.sf" 
                                      H2-63 
"/home/cytogen-bi2/03salmon/H2-63/quant.sf" 
                                      H2-64 
"/home/cytogen-bi2/03salmon/H2-64/quant.sf" 
                                      H2-66 
"/home/cytogen-bi2/03salmon/H2-66/quant.sf" 
                                      H2-67 
"/home/cytogen-bi2/03salmon/H2-67/quant.sf" 
                                      H2-68 
"/home/cytogen-bi2/03salmon/H2-68/quant.sf" 
                                       H2-7 
 "/home/cytogen-bi2/03salmon/H2-7/quant.sf" 
                                      H2-71 
"/home/cytogen-bi2/03salmon/H2-71/quant.sf" 
                                      H2-74 
"/home/cytogen-bi2/03salmon/H2-74/quant.sf" 
                                      H2-75 
"/home/cytogen-bi2/03salmon/H2-75/quant.sf" 
                                      H2-76 
"/home/cytogen-bi2/03salmon/H2-76/quant.sf" 
                                      H2-77 
"/home/cytogen-bi2/03salmon/H2-77/quant.sf" 
                                      H2-78 
"/home/cytogen-bi2/03salmon/H2-78/quant.sf" 
                                      H2-79 
"/home/cytogen-bi2/03salmon/H2-79/quant.sf" 
                                      H2-82 
"/home/cytogen-bi2/03salmon/H2-82/quant.sf" 
                                      H2-83 
"/home/cytogen-bi2/03salmon/H2-83/quant.sf" 
                                      H2-86 
"/home/cytogen-bi2/03salmon/H2-86/quant.sf" 
                                      H2-88 
"/home/cytogen-bi2/03salmon/H2-88/quant.sf" 
                                      H2-89 
"/home/cytogen-bi2/03salmon/H2-89/quant.sf" 
                                       H2-9 
 "/home/cytogen-bi2/03salmon/H2-9/quant.sf" 
                                      H2-91 
"/home/cytogen-bi2/03salmon/H2-91/quant.sf" 
                                      H2-92 
"/home/cytogen-bi2/03salmon/H2-92/quant.sf" 
                                      H2-94 
"/home/cytogen-bi2/03salmon/H2-94/quant.sf" 
                                      H2-95 
"/home/cytogen-bi2/03salmon/H2-95/quant.sf" 
> txi<-tximport(files,type = "salmon", tx2gene = tx2gene)
reading in files with read.delim (install 'readr' package for speed up)
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 
removing duplicated transcript rows from tx2gene
summarizing abundance
summarizing counts
summarizing length

> write.csv(as.data.frame(txi$counts), 
+           file="/home/cytogen-bi2/results/raw_C1H69.csv")

