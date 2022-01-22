## Basic Sample Mapping

library(ggmap)
library(ggplot2)
library(plotly)
library(tidyverse)

setwd("~/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Research/PHD_Bio_CSU/CH2_YEWA_LocalAdaptation/Samples")


## Winter samples ##
YEWA_Winter_samples=read.csv("YEWA_SamplesSeq.csv")
YEWA_Winter_samples <- YEWA_Winter_samples[-c(1:195), ]
YEWA_Breeding_samples=read.csv("YEWA_SamplesSeq.csv")
YEWA_Breeding_samples <- YEWA_Breeding_samples[-c(196:310), ]
YEWA_All_samples = read.csv("YEWA_SamplesSeq.csv")

class(YEWA_Winter_samples$Lat)
class(YEWA_Winter_samples$Long)

# Plot wintering samples with jitter
YEWA_winter_map=get_googlemap(center= c(lon=-85, lat = 15), zoom = 4, maptype = "hybrid") %>%
  ggmap() +
  geom_point(YEWA_Winter_samples, position=position_jitter(h=0.4,w=0.4), mapping = aes(text=Field_Number, x=Long, y = Lat, colour="red"), size=0.8, alpha = 1) +
  theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank())+
  theme(panel.border=element_blank())+
  labs(y = "Latitude", x = "Longitude")
YEWA_winter_map

# no jitter
YEWA_winter_map_NoJit=get_googlemap(center= c(lon=-85, lat = 15), zoom = 4, maptype = "hybrid") %>%
  ggmap() +
  geom_point(YEWA_Winter_samples, mapping = aes(text=Field_Number, x=Long, y = Lat, colour="red"), size=0.8, alpha = 1) +
  theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank())+
  theme(panel.border=element_blank())+
  labs(y = "Latitude", x = "Longitude")
YEWA_winter_map_NoJit


# Plot breeding samples with jitter
YEWA_breeding_map=get_googlemap(center= c(lon=-100, lat = 50), zoom = 3, maptype = "hybrid") %>%
  ggmap() +
  geom_point(YEWA_Breeding_samples, position=position_jitter(h=0.4,w=0.4), mapping = aes(text=Field_Number, x=Long, y = Lat, colour="red"), size=0.8, alpha = 1) +
  theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank())+
  theme(panel.border=element_blank())+
  labs(y = "Latitude", x = "Longitude")
YEWA_breeding_map

# no jitter
YEWA_breeding_map_NoJit=get_googlemap(center= c(lon=-100, lat = 50), zoom = 3, maptype = "hybrid") %>%
  ggmap() +
  geom_point(YEWA_Breeding_samples, mapping = aes(text=Field_Number, x=Long, y = Lat, colour="red"), size=0.8, alpha = 1) +
  theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank())+
  theme(panel.border=element_blank())+
  labs(y = "Latitude", x = "Longitude")
YEWA_breeding_map_NoJit


# Plot all samples
YEWA_map=get_googlemap(center= c(lon=-100, lat = 40), zoom = 3, maptype = "hybrid") %>%
  ggmap() +
  geom_point(YEWA_All_samples, position=position_jitter(h=0.4,w=0.4), mapping = aes(text=Field_Number, x=Long, y = Lat, colour=Stage), size=0.8, alpha = 1) +
  theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank())+
  theme(panel.border=element_blank())+
  labs(y = "Latitude", x = "Longitude")
YEWA_map

# no jitter
YEWA_map_NoJit=get_googlemap(center= c(lon=-100, lat = 50), zoom = 3, maptype = "hybrid") %>%
  ggmap() +
  geom_point(YEWA_All_samples, mapping = aes(text=Field_Number, x=Long, y = Lat, colour=Stage), size=0.8, alpha = 1) +
  theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank())+
  theme(panel.border=element_blank())+
  labs(y = "Latitude", x = "Longitude")
YEWA_map_NoJit

