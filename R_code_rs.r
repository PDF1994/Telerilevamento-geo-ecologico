#script n.1
#install.packages("raster")
library(raster)
#settaggio cartella di lavoro
> setwd("C:/telerilevamento/lab")
#assegnazione di un ogetto all'immagine satellitare
l2011 <- brick("224r63_2011.grd")
