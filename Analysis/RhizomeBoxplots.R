#Loading Libraries
library("ggplot2")
library("readxl")
library("dplyr")
library("data.table")
library("car")

#Linking the Dataset
RhizomeData <- read.csv("~/Git/TyphaData/FieldData/2019_RhizomeData.csv")

#Create boxplot
RhizomeData %>% 
  ggplot(aes(TREATMENT, WEIGHT)) +
  geom_boxplot() +
  theme_bw() +
  ylab("WEIGHT (g)")+
  xlab ("")
  