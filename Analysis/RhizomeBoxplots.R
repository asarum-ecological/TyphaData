#Loading Libraries
library("ggplot2")
library("readxl")
library("dplyr")
library("data.table")
library("car")

#Linking the Dataset
RhizomeData <- read.csv("~/Git/TyphaData/FieldData/2019_RhizomeData.csv")
#Create boxplot
RhizomeBoxplot <- RhizomeData %>% 
  ggplot(aes(TREATMENT, WEIGHT)) +
  geom_boxplot() +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  ylab("Weight (g)")+
  xlab ("")
RhizomeBoxplot

#Ridge Plot Creation
RhizomeRidge <- ggplot(data = RhizomeData, aes(WEIGHT, TREATMENT)) + #note that switching the axis values fixes the y-value issue with ridgeplot
  ggridges::geom_density_ridges() +
  labs(x = "Weight (g)", y = "") +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
RhizomeRidge

#Jitter Plot Creation
RhizomeJitter <- RhizomeData %>% 
  ggplot(aes(TREATMENT, WEIGHT)) +
  geom_jitter(aes(colour = TREATMENT)) +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + 
  ylab("Weight (g)")+
  xlab ("")
RhizomeJitter