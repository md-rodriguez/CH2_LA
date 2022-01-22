
##### Chapter 2 - Local Adaptation in YEWA #####

library(ggmap)
library(ggplot2)
library(plotly)
library(tidyverse)

setwd("~/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Research/PHD_Bio_CSU/CH2_YEWA_LocalAdaptation/Samples")


## Winter samples ##
YEWA_Winter_Samples_csv=read.csv("YEWA_winter_samples.csv")

class(YEWA_Winter_Samples_csv$Lat)
class(YEWA_Winter_Samples_csv$Long)

# with jitter
YEWA_winter_map=get_googlemap(center= c(lon=-95, lat = 15), zoom = 4, maptype = "hybrid") %>%
  ggmap() +
  geom_point(YEWA_Winter_Samples_csv, position=position_jitter(h=0.4,w=0.4), mapping = aes(text=ID, x=Long, y = Lat, colour="red"), size=0.8, alpha = 1) +
  theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank())+
  theme(panel.border=element_blank())+
  labs(y = "Latitude", x = "Longitude")
YEWA_winter_map

# no jitter
YEWA_winter_map_NoJit=get_googlemap(center= c(lon=-95, lat = 15), zoom = 3, maptype = "hybrid") %>%
  ggmap() +
  geom_point(YEWA_Winter_Samples_csv, mapping = aes(text=ID, x=Long, y = Lat, colour="red"), size=0.8, alpha = 1) +
  theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank())+
  theme(panel.border=element_blank())+
  labs(y = "Latitude", x = "Longitude")
YEWA_winter_map_NoJit

ggplotly(YEWA_winter_map, tooltip= c("ID", "Lat", "Long"))

## Breeding samples ##
YEWA_Breeding_Samples_csv=read.csv("YEWA_breeding_samples.csv")

class(YEWA_Breeding_Samples_csv$Lat)
class(YEWA_Breeding_Samples_csv$Long)

YEWA_Breeding_Samples_csv$Lat <- as.numeric(as.character(YEWA_Breeding_Samples_csv$Lat))
YEWA_Breeding_Samples_csv$Long <- as.numeric(as.character(YEWA_Breeding_Samples_csv$Long))

YEWA_breed_map=get_googlemap(center= c(lon=-100, lat = 50), zoom = 3, maptype = "hybrid") %>%
  ggmap() +
  geom_point(data = YEWA_Breeding_Samples_csv, 
             aes(text=ID, x=Long, y = Lat, colour="red"), size=0.8, alpha = 1) +
  theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank())+
  theme(panel.border=element_blank())+
  labs(y = "Latitude", x = "Longitude")
YEWA_breed_map

ggplotly(YEWA_breed_map, tooltip= c("ID", "Lat", "Long"))

## Chosen sample sites ##
YEWA_Seq=read.csv("YEWA_Samples2Seq.csv")

class(YEWA_Seq$Lat)
class(YEWA_Seq$Long)

YEWA_Seq_Map=get_googlemap(center= c(lon=-100, lat = 30), zoom = 3, maptype = "hybrid") %>%
  ggmap() +
  geom_point(data = YEWA_Seq, 
             aes(text=Stage, x=Long, y = Lat, colour=Stage), alpha = 1) +
  theme(panel.grid.minor=element_blank(),panel.grid.major=element_blank())+
  theme(panel.border=element_blank())+
  labs(y = "Latitude", x = "Longitude")
YEWA_Seq_Map
