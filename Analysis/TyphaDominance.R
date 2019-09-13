#Loading Libraries
library("ggplot2")
library("readxl")
library("dplyr")
library("data.table")
library("car")

#Creating Reference Subset
TyphaOutside <- read.csv("~/UBC/Thesis/Field Work/DATA/FrenchiesOut_JULY2019.csv")

#Extracting Typha data
Typhaabundance <- filter(TyphaOutside,CATTAIL == "Y")

#Summing Typha data per plot
SummedTypha <- Typhaabundance %>% group_by(PLOTID) %>%
  summarize(COVER = sum(COVER)) 

#Summary statistics  
mean(SummedTypha[["COVER"]])
sd(SummedTypha[["COVER"]])

