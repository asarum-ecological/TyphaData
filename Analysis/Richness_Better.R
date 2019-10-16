#Loading Libraries
library("ggplot2")
library("readxl")
library("dplyr")
library("data.table")
library("car")
library("ggridges")

RichnessData <- read.csv("~/Git/TyphaData/FieldData/RichnessMaster.csv")

#BOXPLOT
RichnessBox <- RichnessData %>%
  ggplot(aes(x=LOCATION, y=RICHNESS)+  
  geom_boxplot() +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  labs(x = "Location", y = "Species Richness") 

  RichnessBox

#Ridge Plot Creation
RichnessRidge <- RichnessData %>%
  ggplot(aes(x=RICHNESS, y=LOCATION)) + #note that switching the axis values fixes the y-value issue with ridgeplot
  ggridges::geom_density_ridges() +
  labs(x = "Species Richness", y = "") +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
RichnessRidge

#Jitter Plot Creation
RichnessJitter <- RichnessData %>%
  ggplot(aes(LOCATION, RICHNESS)) +
  geom_jitter(aes(colour = LOCATION)) +
  theme_bw() +
  ylab("Species Richness")+
  xlab ("") + 
  theme(legend.title = element_blank()) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  scale_y_continuous(limits = c(0, 15), oob = scales::squish)
RichnessJitter


library(reshape2)
BoxplotDF <- melt(Combined, id.var="LOCATION")

