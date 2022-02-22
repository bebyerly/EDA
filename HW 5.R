library(tidyverse)
library(ggplot2)
library(ggpubr)
theme_set(theme_pubr())

SKUMaster<-read.csv("SKU Master.csv") #Write in .csv files
SKUMaster
SKUMaster<-read.csv("https://github.com/bebyerly/EDA/blob/main/6%20SKU%20Master.xlsx")

SKUMaster$Uom <- as.factor(SKUMaster$Uom)
SKUMaster <- SKUMaster[SKUMaster$UomCube>0,]
SKUMaster <- SKUMaster[SKUMaster$UomCube<2,]
SKUMaster
#filtered uom cube

SKUMaster<-SKUMaster[SKUMaster$UomWeight>0,]
SKUMaster<-SKUMaster[SKUMaster$UomWeight<50,]
SKUMaster
# filtered uom weight


SKUMaster<-SKUMaster[SKUMaster$Uom %in% c("CA","EA","PL","LB"),]
SKUMaster

SKUMaster<-na.omit(SKUMaster)

SKUMaster<-droplevels(SKUMaster)
SKUMaster

boxplot(SKUMaster$UomWeight)
boxplot.stats(SKUMaster$UomWeight)$out

plot(SKUMaster$UnitsPerCase,SKUMaster$UomWeight)   #scatter plot

ggplot(SKUMaster, aes(SKUMaster$Commodity)) + geom_bar(fill="#0073C2FF") + theme_pubclean()

ggplot(SKUMaster, aes(SKUMaster$Uom)) + geom_bar(fill="#0073C2FF") + theme_pubclean()

p <- ggplot(SKUMaster, aes(x= SKUMaster$Flow, y=SKUMaster$UomCube)) + geom_boxplot()
p + xlab ("Flow Type") +ylab("UOM Cubic Feet")
# 


SKUMaster<-SKUMaster[SKUMaster$Flow %in% c("DD"),]
SKUMaster<-droplevels(SKUMaster)
SKUMaster

boxplot(SKUMaster$UomWeight)






x <- ggplot(SKUMaster, aes(SKUMaster$UomWeight)) + geom_histogram(binwidth=1, color = "black", fill="white")
x                                                            

d <- ggplot(SKUMaster, aes (x = SKUMaster$SkuNbr, y= SKUMaster$UomWeight)) + geom_dotplot(binwidth= 1, binaxis = 'y', stackdir = 'center')

d 







s<-ggplot(SKUMaster, aes(x=SKUMaster$Uom, y=SKUMaster$UomWeight)) + 
  geom_jitter()
s


