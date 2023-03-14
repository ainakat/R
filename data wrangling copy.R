#load packages 
library(dplyr)
library(tidyr)
library(tidyverse)
library(ggplot2)
library(magrittr)
library(plyr)
library(xlsx)

#################################################### CARSON CITY 

carson.employment <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/carson city employment.csv", skip=1)
carson.laborincome <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/carson city labor income.csv", skip=1)
carson.output <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/carson city output.csv", skip=1)

carson.employment <- carson.employment %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/carson/carson.employment.multipliers.xlsx")

carson.laborincome <- carson.laborincome %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/carson/carson.laborincome.multipliers.xlsx")

carson.output <- carson.output %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/carson/carson.output.multipliers.xlsx")

#################################################### CHURCHILL

CHURCHILL.employment <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/churchill employment.csv", skip=1)
CHURCHILL.laborincome <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/churchill labor income.csv", skip=1)
CHURCHILL.output <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/churchill output.csv", skip=1)

CHURCHILL.employment <- CHURCHILL.employment %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/churchill/CHURCHILL.employment.multipliers.xlsx")

CHURCHILL.laborincome <- CHURCHILL.laborincome %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/churchill/CHURCHILL.laborincome.multipliers.xlsx")

CHURCHILL.output <- CHURCHILL.output %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/churchill/CHURCHILL.output.multipliers.xlsx")

#################################################### clark

clark.employment <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clark employment.csv", skip=1)
clark.laborincome <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clark labor income.csv", skip=1)
clark.output <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clark output.csv", skip=1)

clark.employment <- clark.employment %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/clark/clark.employment.multipliers.xlsx")

clark.laborincome <- clark.laborincome %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/clark/clark.laborincome.multipliers.xlsx")

clark.output <- clark.output %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/clark/clark.output.multipliers.xlsx")

#################################################### douglas

douglas.employment <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/douglas employment.csv", skip=1)
douglas.laborincome <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/douglas income.csv", skip=1)
douglas.output <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/douglas output.csv", skip=1)

douglas.employment <- douglas.employment %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/douglas/douglas.employment.multipliers.xlsx")

douglas.laborincome <- douglas.laborincome %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/douglas/douglas.laborincome.multipliers.xlsx")

douglas.output <- douglas.output %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/douglas/douglas.output.multipliers.xlsx")


#################################################### elko

elko.employment <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/elko employment.csv", skip=1)
elko.laborincome <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/elko labor income.csv", skip=1)
elko.output <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/elko output.csv", skip=1)

elko.employment <- elko.employment %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/elko/elko.employment.multipliers.xlsx")

elko.laborincome <- elko.laborincome %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/elko/elko.laborincome.multipliers.xlsx")

elko.output <- elko.output %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/elko/elko.output.multipliers.xlsx")


#################################################### esmeralda

esmeralda.employment <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/esmeralda employment.csv", skip=1)
esmeralda.laborincome <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/esmeralda labor income.csv", skip=1)
esmeralda.output <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/esmeralda output.csv", skip=1)

esmeralda.employment <- esmeralda.employment %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/esmeralda/esmeralda.employment.multipliers.xlsx")

esmeralda.laborincome <- esmeralda.laborincome %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/esmeralda/esmeralda.laborincome.multipliers.xlsx")

esmeralda.output <- esmeralda.output %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/esmeralda/esmeralda.output.multipliers.xlsx")


#################################################### eureka

eureka.employment <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/eureka employment.csv", skip=1)
eureka.laborincome <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/eureka labor income.csv", skip=1)
eureka.output <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/eureka output.csv", skip=1)

eureka.employment <- eureka.employment %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/eureka/eureka.employment.multipliers.xlsx")

eureka.laborincome <- eureka.laborincome %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/eureka/eureka.laborincome.multipliers.xlsx")

eureka.output <- eureka.output %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/eureka/eureka.output.multipliers.xlsx")


#################################################### humboldt

humboldt.employment <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/humboldt employment.csv", skip=1)
humboldt.laborincome <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/humboldt labor income.csv", skip=1)
humboldt.output <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/humboldt ouput.csv", skip=1)

humboldt.employment <- humboldt.employment %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/humboldt/humboldt.employment.multipliers.xlsx")

humboldt.laborincome <- humboldt.laborincome %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/humboldt/humboldt.laborincome.multipliers.xlsx")

humboldt.output <- humboldt.output %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/humboldt/humboldt.output.multipliers.xlsx")


#################################################### lander

lander.employment <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/lander employment.csv", skip=1)
lander.laborincome <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/lander labor income.csv", skip=1)
lander.output <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/lander output.csv", skip=1)

lander.employment <- lander.employment %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/lander/lander.employment.multipliers.xlsx")

lander.laborincome <- lander.laborincome %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/lander/lander.laborincome.multipliers.xlsx")

lander.output <- lander.output %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/lander/lander.output.multipliers.xlsx")


#################################################### lincoln

lincoln.employment <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/lincoln employment.csv", skip=1)
lincoln.laborincome <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/lincoln labor income.csv", skip=1)
lincoln.output <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/lincoln output.csv", skip=1)

lincoln.employment <- lincoln.employment %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/lincoln/lincoln.employment.multipliers.xlsx")

lincoln.laborincome <- lincoln.laborincome %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/lincoln/lincoln.laborincome.multipliers.xlsx")

lincoln.output <- lincoln.output %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/lincoln/lincoln.output.multipliers.xlsx")


#################################################### lyon

lyon.employment <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/lyon employment.csv", skip=1)
lyon.laborincome <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/lyon labor income.csv", skip=1)
lyon.output <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/lyon output.csv", skip=1)

lyon.employment <- lyon.employment %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/lyon/lyon.employment.multipliers.xlsx")

lyon.laborincome <- lyon.laborincome %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/lyon/lyon.laborincome.multipliers.xlsx")

lyon.output <- lyon.output %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/lyon/lyon.output.multipliers.xlsx")

#################################################### mineral

mineral.employment <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/mineral employment.csv", skip=1)
mineral.laborincome <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/mineral labor income.csv", skip=1)
mineral.output <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/mineral output.csv", skip=1)

mineral.employment <- mineral.employment %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/mineral/mineral.employment.multipliers.xlsx")

mineral.laborincome <- mineral.laborincome %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/mineral/mineral.laborincome.multipliers.xlsx")

mineral.output <- mineral.output %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/mineral/mineral.output.multipliers.xlsx")

#################################################### nye

nye.employment <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/nye employment.csv", skip=1)
nye.laborincome <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/nye labor income.csv", skip=1)
nye.output <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/nye output.csv", skip=1)

nye.employment <- nye.employment %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/nye/nye.employment.multipliers.xlsx")

nye.laborincome <- nye.laborincome %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/nye/nye.laborincome.multipliers.xlsx")

nye.output <- nye.output %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/nye/nye.output.multipliers.xlsx")


#################################################### pershing

pershing.employment <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/pershing employment.csv", skip=1)
pershing.laborincome <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/pershing labor income.csv", skip=1)
pershing.output <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/pershing output.csv", skip=1)

pershing.employment <- pershing.employment %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/pershing/pershing.employment.multipliers.xlsx")

pershing.laborincome <- pershing.laborincome %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/pershing/pershing.laborincome.multipliers.xlsx")

pershing.output <- pershing.output %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/pershing/pershing.output.multipliers.xlsx")


#################################################### storey

storey.employment <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/storey employment.csv", skip=1)
storey.laborincome <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/storey labor income.csv", skip=1)
storey.output <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/storey output.csv", skip=1)

storey.employment <- storey.employment %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/storey/storey.employment.multipliers.xlsx")

storey.laborincome <- storey.laborincome %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/storey/storey.laborincome.multipliers.xlsx")

storey.output <- storey.output %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/storey/storey.output.multipliers.xlsx")


#################################################### washoe

washoe.employment <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/washoe employment.csv", skip=1)
washoe.laborincome <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/washoe labor income.csv", skip=1)
washoe.output <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/washoe output.csv", skip=1)

washoe.employment <- washoe.employment %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/washoe/washoe.employment.multipliers.xlsx")

washoe.laborincome <- washoe.laborincome %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/washoe/washoe.laborincome.multipliers.xlsx")

washoe.output <- washoe.output %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/washoe/washoe.output.multipliers.xlsx")


#################################################### white pine

whitepine.employment <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/white pine employment.csv", skip=1)
whitepine.laborincome <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/white pine labor income.csv", skip=1)
whitepine.output <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/white pine output.csv", skip=1)

whitepine.employment <- whitepine.employment %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/white pine/white pine.employment.multipliers.xlsx")

whitepine.laborincome <- whitepine.laborincome %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/white pine/white pine.laborincome.multipliers.xlsx")

whitepine.output <- whitepine.output %>%
  filter(IndustryCode %in% (483:493)) %>%
  write.xlsx("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/clean/white pine/white pine.output.multipliers.xlsx")


###############################

emp.ownership <- read_csv("/Users/aina/Documents/RA Projects/IMPLAN health multipliers/Industry.csv")


