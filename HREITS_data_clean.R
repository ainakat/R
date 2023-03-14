#load packages 
library(dplyr)
library(tidyr)
library(tidyverse)
library(ggplot2)
library(magrittr)
library(plyr)

data.1 <- read.csv("/Users/aina/Documents/RA Projects/HREITS/data/data1.csv")
attach(data.1)

data.2 <- read.csv("/Users/aina/Documents/RA Projects/HREITS/data/data2.csv")
attach(data.2)

#if we drop firms that have 0 investments in senior housing and don't have data going back to 2002
data.1 <- data.1 %>%
  select(X,WTR,VTR,PEAK,OHI,HR,NHI,LTC,DHC) %>%
  filter(X>=2002)
data.2 <- data.2 %>%
  select(X,WTR,VTR,PEAK,OHI,HR,NHI,LTC,DHC) %>%
  filter(X>=2002)

#transpose data matrix 
data.1 <- data.frame(gather(data.1,"firm", "housing.portfolio", -X))
data.2 <- data.frame(gather(data.2,"firm", "region", -X))

#merge two datasets and rename columns 
clean.data <-  merge(data.1,data.2,by=c("X","firm")) 
names(clean.data)[names(clean.data) == "X"] <- "Year"
names(clean.data)[names(clean.data) == "firm"] <- "firmID"

#create post, posttreatment and treatment columns 
clean.data$post <- ifelse(clean.data$Year >= 2008,1,0)
clean.data$treatment <- 1
clean.data$housing.portfolio <- round(clean.data$housing.portfolio, digits = 2) 
clean.data$posttreatment <- clean.data$post * clean.data$treatment

write.csv(clean.data, "/Users/aina/Documents/RA Projects/HREITS/data")

#############################STATA version 

clean.data.stata <- clean.data
clean.data.stata$firmID <- (gsub("WTR",1,clean.data.stata$firmID)) 
clean.data.stata$firmID <- (gsub("VTR",2,clean.data.stata$firmID)) 
clean.data.stata$firmID <- (gsub("PEAK",3,clean.data.stata$firmID)) 
clean.data.stata$firmID <- (gsub("OHI",4,clean.data.stata$firmID)) 
clean.data.stata$firmID <- (gsub("HR",5,clean.data.stata$firmID)) 
clean.data.stata$firmID <- (gsub("NHI",6,clean.data.stata$firmID)) 
clean.data.stata$firmID <- (gsub("LTC",7,clean.data.stata$firmID))
clean.data.stata$firmID <- (gsub("DHC",8,clean.data.stata$firmID)) 

write.csv(clean.data.stata, "/Users/aina/Documents/RA Projects/HREITS/data/STATAclean.csv")

