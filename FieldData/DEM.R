library("ggplot2")
library("readxl")
library("dplyr")
library("data.table")

ElevationData <- read.csv("~/Git/TyphaData/DEM/TYGL.csv")

Boxplot <- ElevationData %>%
  ggplot(aes(y=RASTERVALUE)) +
           geom_boxplot() +
           theme_bw() +
           theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
         
  summary(ElevationData)
  
  
hist(round(ElevationData$RASTERVALU,1))
         
  
  ggplot(ElevationData) +
  geom_boxplot(aes(y = "RASTERVALU"))
