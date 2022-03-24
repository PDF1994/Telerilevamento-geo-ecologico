# 1°esercitazione

library(raster)
library(RStoolbox)

setwd("C:/Users/paola.difluri2/Desktop/lab") # colleghiamo così la cartella di lavoro esterna ad R

l2011 <- brick("p224r63_2011.grd")
plot(l2011)
cl <- colorRampPalette(c("black", "grey", "light grey"))(100)
plot(l2011, col=cl)

# plot(l2011$B1_sre)
# plot(l2011[[1]])
bl <- colorRampPalette(c("darkblue", "cornflowerblue", "deepskyblue", "cadetblue1"))(100) #creiamo una palette diversa sui toni del blu
plot(l2011$B1_sre, col=cl)

pdf("banda_blu.pdf")
plot(l2011$B1_sre, col=bl)
dev.off()

png("banda_blu.png")
plot(l2011$B1_sre, col=bl)
dev.off()

vr = colorRampPalette(c("darkgreen", "chartreuse4", "chartreuse", "darkolivegreen1"))(100) #creiamo una palette diversa sui toni del blu

pdf("banda_blu_verde.pdf")
par(mfrow=c(1,2)) # per plottare insieme due bande (blu a sinistra e verde a destra)
plot(l2011$B1_sre, col=bl)
plot(l2011$B2_sre, col=vr)
dev.off()

png("banda_blu_verde.png")
par(mfrow=c(1,2)) # per plottare insieme due bande
plot(l2011$B1_sre, col=bl)
plot(l2011$B2_sre, col=vr)
dev.off()

pdf("banda_blu_verde.pdf")
par(mfrow=c(2,1)) # per plottare insieme due bande (2 righe e 1 colonna) (blu sopra e verde swotto)
plot(l2011$B1_sre, col=bl)
plot(l2011$B2_sre, col=vr)
dev.off()

png("banda_blu_verde.png")
par(mfrow=c(2,1)) # per plottare insieme due bande (2 righe e 1 colonna)
plot(l2011$B1_sre, col=bl)
plot(l2011$B2_sre, col=vr)
dev.off()

rd <- colorRampPalette(c("darkred", "brown3", "brown1", "bisque1"))(100) #creiamo una palette diversa sui toni del rosso
nir <- colorRampPalette(c("darkorange", "darkgoldenrod1", "azure1"))(100) #creiamo una palette diversa sui toni del giallo per il NIR
pdf("banda_blu_verde_rosso_nir.pdf")
par(mfrow=c(2,2)) # per plottare insieme 4 bande (2 righe e 1 colonna)
plot(l2011$B1_sre, col=bl)
plot(l2011$B2_sre, col=vr)
plot(l2011$B3_sre, col=rd)
plot(l2011$B2_sre, col=nir)
dev.off()

png("banda_blu_verde_rosso_nir.png")
par(mfrow=c(2,2)) # per plottare insieme 4 bande (2 righe e 2 colonna)
plot(l2011$B1_sre, col=bl)
plot(l2011$B2_sre, col=vr)
plot(l2011$B3_sre, col=rd)
plot(l2011$B4_sre, col=nir)

install.packages("RStoolbox")

#plot in l2011 in the NIR channel
plot(l2011$B4_sre, col=bl)

#plot RGB layer
#output=immagine a colore naturale, come la vedrebbe l'occhio umano
plotRGB(l2011, r=3, g=2, b=1, stretch="lin")   #stretch per variare il contrasto dell'immagine #lin=linear

 #plot integrando la mappa del vicino infrarosso NIR
plotRGB(l2011, r=4, g=3, b=2, stretch="lin") 

#infrarosso nella componente green--> tutto ciò che riflette il NIR (vegetazione)diventa verde

plotRGB(l2011, r=3, g=4, b=2, stretch="lin") 

#infrarosso nella componente blu--> il giallo è suolo nudo
plotRGB(l2011, r=3, g=2, b=4, stretch="lin") 

