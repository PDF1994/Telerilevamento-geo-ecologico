#script n.1
#install.packages("raster")
library(raster)
#settaggio cartella di lavoro
setwd("C:/Users/paola/OneDrive/Desktop/lab")
#assegnazione di un ogetto all'immagine satellitare
l2011 <- brick("p224r63_2011.grd")

 plot(l2011)
cl <- colorRampPalette(c("black","grey","light grey")) (100) 
plot(l2011, col=cl)
cls <- colorRampPalette(c("red","pink","orange","purple")) (200)
plot(l2011, col=cls)    

#PLOT BANDA BLU
plot(l2011$B1_sre)

#eseguire il plot per elemento =
plot(l2011[[1]])
cl <- colorRampPalette(c("black","grey","light grey")) (100) 
plot(l2011$B1_sre, col=cl)

cl2<- colorRampPalette(c("dark blue","cornflowerblue","deepskyblue","cadetblue1")) (100)
plot(l2011$B1_sre, col=cl2)

#export image PDF
pdf("banda_blu.pdf")
plot(l2011$B1_sre, col=cl2)
dev.off()
 
#export image png
png("banda_blu.png")
plot(l2011$B1_sre, col=cl2)
writeraster("banda_blu.tiff")
 
plot(l2011$B2_sre)

#multiframe
par(mfrow=c(1,2))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)
