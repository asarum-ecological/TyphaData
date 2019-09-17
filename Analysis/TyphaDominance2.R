#Loading Libraries
library("ggplot2")
library("readxl")
library("dplyr")
library("data.table")
library("car")

#Creating Subset
TyphaOutside <- read.csv("~/Git/TyphaData/FieldData/FrenchiesOut_JULY2019.csv")

#calculating mean
summarise(TyphaOutside$SPECIES, avg = mean(COVER))
