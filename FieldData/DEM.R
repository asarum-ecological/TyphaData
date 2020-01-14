library("ggplot2")
library("readxl")
library("dplyr")
library("data.table")

ElevationData <- read.csv("~/Git/TyphaData/DEM/ElevationData.csv")

Boxplot <- ElevationData %>%
  ggplot(aes(y=VALUE)) +
           geom_boxplot() +
           theme_bw() +
           theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
         
  summary(ElevationData)
hist(round(ElevationData$VALUE,1))
         
  
  ggplot(ElevationData) +
  geom_boxplot(aes(y = "VALUE"))
