select="/home/cytogen-bi2/analysis/191002/191002gene_filtered_raw.txt"
label="/home/cytogen-bi2/analysis/191002/191002gene_filtered_labeled.txt"
df1<-read.table(select, header=T, row.names = 1)
df2<-read.table(label, header=T, row.names = 1)
df3<-read.table("~/analysis/191002/191002gene_filtered_labeled_sum100_filtered.csv", header = T, row.names = 1)
head(df1, 1)
head(df2, 1)

# Libraries
library(ggplot2)
library(dplyr)

tdf1=t(df1)
tdf2=t(df2)

head(tdf1)
head(tdf2)

str(df1)
str(tdf1)

data <- mtcars[ , c(1,3:6)]
head(data, 2)
plot(data , pch=20 , cex=1.5 , col="#69b3a2")
plot(tdf1, pch=20, cex=1.5, col="#69b3a2")
library(RColorBrewer)

data<-as.matrix(df1)
heatmap(data, scale="column",col= colorRampPalette(brewer.pal(8, "Blues"))(25))



df4<-df3[,c(3:50)]
data2<-as.matrix(df4)
heatmap(data2, scale="column",col= colorRampPalette(brewer.pal(8, "Blues"))(25))


df5<-read.table("~/analysis/191002/191002gene_filtered_labeled_sum1000_filtered.txt", header = T, row.names = 1)
df5_rem<-df5[,c(3:50)]
data5<-as.matrix(df5_rem)
heatmap(data5
        , col= colorRampPalette(brewer.pal(8, "Blues"))(25))

df6<-read.table("~/analysis/191004/191004gene_filtered_labeled.txt", header = T, row.names = 3)
head(df6rem,1)
df6rem=df6[,c(3:50)]
data4=as.matrix(df6rem)
heatmap(data3, scale="column",col= colorRampPalette(brewer.pal(8, "Blues"))(25))




tdf5=as.data.frame(t(df5_rem))
ggplot(tdf5, aes(x = RHOA_ENSG00000067560, y=RHOA_ENSG00000067560))

geom_point(aes(size =  RHOA_ENSG00000067560))
install.packages("tidyverse")
library(tidyverse)


# initialization
par(mar=c(3,3,3,3))
num <- 0 ; 
num1 <- 0
plot(0,0 , xlim=c(0,51) , ylim=c(0.5,6.5), col="white" , yaxt="n" , ylab="" , xlab="")

#fill the graph
for (i in seq(1,50)){
  points(i,1 , pch=i , cex=3)
  points(i,2 , col=i , pch=16 , cex=3)
  points(i,3 , col="#69b3a2" , pch=16 , cex=i*0.25)
  
  #lty
  if(i %in% c(seq(1,18,3))){
    num=num+1
    points(c(i,i+2), c(4,4) , col="black" , lty=num , type="l" , lwd=2)
    text(i+1.1 , 4.15 , num)
  }
  
  #type and lwd 
    if(i %in% c(seq(1,20,5))){
      num1=num1+1
      points(c(i,i+1,i+2,i+3), c(5,5,5,5) , col="black"  , type=c("p","l","b","o")[num1] , lwd=2)
      text(i+1.1 , 5.2 , c("p","l","b","o")[num1] )
      points(c(i,i+1,i+2,i+3), c(6,6,6,6) , col="black"  , type="l",  lwd=num1)
      text(i+1.1 , 6.2 , num1 )
      
    }
  }
  
  #add axis
  axis(2, at = c(1,2,3,4,5,6), labels = c("pch" , "col" , "cex" , "lty", "type" , "lwd" ), 
       tick = TRUE, col = "black", las = 1, cex.axis = 0.8)
  
