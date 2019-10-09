#Loading Libraries
library("ggplot2")
library("readxl")
library("dplyr")
library("data.table")
library("car")
library("ggridges")

#Creating Reference Subset
ReferenceRichness <- read.csv("~/Git/TyphaData/FieldData/ReferenceMarsh_AUG2019.csv")

#Removing Exotics
ReferenceNatives <- filter(ReferenceRichness,ORIGIN == "native")

#Determining Richness Per Plot
ReferenceNativeRichness <- count(ReferenceRichness,PLOT) 

#Box Plot Creation
Box1 <-  boxplot(ReferenceNativeRichness$n, data=n)

ReferenceNativeRichness$LOCATION<- "Reference"

#Creating Frenchies In Subset
FrenchiesIn_Richness <- read.csv("~/Git/TyphaData/FieldData/Frenchies_IN.csv")

#Removing Exotics
FrenchiesIn_Natives <- filter(FrenchiesIn_Richness,ORIGIN == "native")

#Determining Richness Per Plot
FrenchiesINNativeRichness <- count(FrenchiesIn_Natives,PLOT) 

#Box Plot Creation
Box2 <-  boxplot(FrenchiesINNativeRichness$n, data=n)


FrenchiesINNativeRichness$LOCATION  <- "Frenchies Inside"



#Creating Frenchies Out Subset
FrenchiesOut_Richness <- read.csv("~/Git/TyphaData/FieldData/Frenchies_OUT.csv")

#Removing Exotics
FrenchiesOut_Natives <- filter(FrenchiesOut_Richness,ORIGIN == "native")

#Determining Richness Per Plot
FrenchiesOutNativeRichness <- count(FrenchiesOut_Natives,PLOT) 

#Box Plot Creation
Box3 <-  boxplot(FrenchiesOutNativeRichness$n, data=n)

FrenchiesOutNativeRichness$LOCATION  <- "Frenchies Outside"


#Box Plot Creation

Combined <- rbind(ReferenceNativeRichness,FrenchiesOutNativeRichness,FrenchiesINNativeRichness)

RichnessBox <- ggplot(data = Combined, aes(x=LOCATION, y=n))+  
  geom_boxplot() +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  labs(x = "", y = "Species Richness") 

RichnessBox

#Ridge Plot Creation
RichnessRidge <- ggplot(data = Combined, aes(n, LOCATION)) + #note that switching the axis values fixes the y-value issue with ridgeplot
  ggridges::geom_density_ridges() +
  labs(x = "Species Richness", y = "") +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
  RichnessRidge

#Jitter Plot Creation
RichnessJitter <- ggplot(data = Combined, aes(LOCATION, n)) +
    geom_jitter(aes(colour = LOCATION)) +
    theme_bw() +
    ylab("Species Richness")+
    xlab ("") + 
    theme(legend.title = element_blank()) +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) 
  RichnessJitter
  
  
library(reshape2)
BoxplotDF <- melt(Combined, id.var="LOCATION")

