
setwd("~/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Research/PHD_Bio_CSU/CH2_YEWA_LocalAdaptation/Samples")

library(raster)
library(ggplot2)
library(plotly)

#### BioClim variables ###
#BIO1 = Annual Mean Temperature
#BIO2 = Mean Diurnal Range (Mean of monthly (max temp - min temp))
#BIO3 = Isothermality (BIO2/BIO7) (×100)
#BIO4 = Temperature Seasonality (standard deviation ×100)
#BIO5 = Max Temperature of Warmest Month
#BIO6 = Min Temperature of Coldest Month
#BIO7 = Temperature Annual Range (BIO5-BIO6)
#BIO8 = Mean Temperature of Wettest Quarter
#BIO9 = Mean Temperature of Driest Quarter
#BIO10 = Mean Temperature of Warmest Quarter
#BIO11 = Mean Temperature of Coldest Quarter
#BIO12 = Annual Precipitation
#BIO13 = Precipitation of Wettest Month
#BIO14 = Precipitation of Driest Month
#BIO15 = Precipitation Seasonality (Coefficient of Variation)
#BIO16 = Precipitation of Wettest Quarter
#BIO17 = Precipitation of Driest Quarter
#BIO18 = Precipitation of Warmest Quarter
#BIO19 = Precipitation of Coldest Quarter


bio1 <- raster("Climate_data/wc2_all/wc2.1_30s_bio_1.tif")
bio4 <- raster("Climate_data/wc2_all/wc2.1_30s_bio_4.tif")
bio5 <- raster("Climate_data/wc2_all/wc2.1_30s_bio_5.tif")
bio7 <- raster("Climate_data/wc2_all/wc2.1_30s_bio_7.tif")
bio12 <- raster("Climate_data/wc2_all/wc2.1_30s_bio_12.tif")
bio13 <- raster("Climate_data/wc2_all/wc2.1_30s_bio_13.tif")
bio14 <- raster("Climate_data/wc2_all/wc2.1_30s_bio_14.tif")
bio15 <- raster("Climate_data/wc2_all/wc2.1_30s_bio_15.tif")
bio16 <- raster("Climate_data/wc2_all/wc2.1_30s_bio_16.tif")
bio17 <- raster("Climate_data/wc2_all/wc2.1_30s_bio_17.tif")
bio18 <- raster("Climate_data/wc2_all/wc2.1_30s_bio_18.tif")


bio_col <- colorRampPalette(c("blue", "skyblue", "green", "lightgreen", "yellow", "orange", "red", "darkred"))

# Subset Americas data
ma.area <- extent(-175, -40, 0, 75)
ma.bio1 <- crop(bio1, ma.area)
ma.bio1.df <- data.frame(rasterToPoints(ma.bio1)) 
names(ma.bio1.df) <- c("Longitude","Latitude","Precipitation")
ma.bio1.df <- ggplot(ma.bio1.df) + geom_tile(aes(text=Precipitation, x=Longitude,y=Latitude,fill=Precipitation)) 
ma.bio1.df <- ma.bio1.df + scale_fill_gradientn( colors=c('#a6611a','#dfc27d','#f5f5f5','#80cdc1','#018571'))
ma.bio1.df <- ma.bio1.df + coord_equal() + xlab("Longitude") + ylab("Latitude") 

YEWA_breed_temp = ma.bio1.df + 
  geom_point(data = YEWA_Breeding_Samples_csv, position=position_jitter(h=0.4,w=0.4), 
             aes(text=ID, x=Long, y = Lat, colour="red"), size=0.8, alpha = 1) +
  theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank())+
  theme(panel.border=element_blank())+
  labs(y = "Latitude", x = "Longitude")
YEWA_breed_temp
ggplotly(YEWA_breed_temp, tooltip= c("ID","Precipitation", "Lat", "Long"))



YEWA_temp_map=get_googlemap(center= c(lon=-100, lat = 50), zoom = 4, maptype = "hybrid") %>%
  ggmap(ma.bio1.df) +
  ma.bio1.df +
  geom_point(data = YEWA_Breeding_Samples_csv, position=position_jitter(h=0.4,w=0.4), 
             aes(text=ID, x=Long, y = Lat, colour="red"), size=0.8, alpha = 1) +
  theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank())+
  theme(panel.border=element_blank())+
  labs(y = "Latitude", x = "Longitude")
YEWA_temp_map

ma.bio4 <- crop(precip2, ma.area)
ma.bio5 <- crop(precip3, ma.area)
ma.bio7 <- crop(precip4, ma.area)
ma.bio12 <- crop(precip5, ma.area)
ma.bio13 <- crop(precip6, ma.area)
ma.bio14 <- crop(precip7, ma.area)
ma.bio15 <- crop(precip8, ma.area)
ma.bio16 <- crop(precip9, ma.area)
ma.bio17 <- crop(precip10, ma.area)
ma.bio18 <- crop(precip11, ma.area)



#plot
plot(ma.bio1, xlim=c(-175, -40), ylim=c(0, 75), zlim=c(-20, 150), col=bio_col(100))
title(main="Annual Mean Temperature") 

plot(ma.bio4, xlim=c(-175, -40), ylim=c(0, 75), zlim=c(0, 200), col=bio_col(100))
title(main="Temperature Seasonality") 

