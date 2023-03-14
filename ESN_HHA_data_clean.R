#################################################### LOAD  PACKAGES
pacman::p_load(plyr,dplyr, tidyverse,ggplot2, magrittr,data.table,DataCombine,stringr,fuzzyjoin,readxl,writexl,tidyverse,haven) 

#################################################### LOAD  DATA
rawfiles <- list()   #keep all raw files in list to keep global environment clean 
rawfiles$jan2020 <- read_csv("/Users/aina/Documents/RA Projects/Assisted Living/Data/Mcaid HHproviders/hhs_revised_flatfiles_archive_01_2020/HHC_SOCRATA_PRVDR.csv")
rawfiles$aug2020 <- read_csv("/Users/aina/Documents/RA Projects/Assisted Living/Data/Mcaid HHproviders/home_health_services_archive_8_2020/HHC_SOCRATA_PRVDR.csv")
rawfiles$oct2020 <- read_csv("/Users/aina/Documents/RA Projects/Assisted Living/Data/Mcaid HHproviders/home_health_services_archive_10_2020/HH_Provider_Oct2020.csv")
rawfiles$jul2021 <- read_csv("/Users/aina/Documents/RA Projects/Assisted Living/Data/Mcaid HHproviders/home_health_services_07_2021/HH_Provider_July2021.csv")
rawfiles$sept2021 <- read_csv("/Users/aina/Documents/RA Projects/Assisted Living/Data/Mcaid HHproviders/home_health_services_09_2021/HH_Provider_July2021.csv")

#rename Zip columns in two files so they match the upper casing of the other files 
rawfiles$jan2020 <- rename(rawfiles$jan2020, "ZIP" = "Zip")
rawfiles$aug2020 <- rename(rawfiles$aug2020, "ZIP" = "Zip")

#for each file in rawfiles, filter out non-MW states and eliminate unnecessary columns 
rawfiles <- lapply(rawfiles,function(df) {
    df %>%  
      filter( State == "ID" | State == "MT" | State == "NV" | State == "NM" | State == "UT" | State == "WY") %>%
      select(State,`Provider Name`,City,ZIP,`Quality of patient care star rating`,`No. of episodes to calc how much Medicare spends per episode of care at agency, compared to spending at all agencies (national)`)})

#remove first and last string characters to make it easier to coerce into double in next step 
rawfiles$aug2020$ZIP <- gsub('^.|.$', '', rawfiles$aug2020$ZIP)    #remove first character (an equal symbol) and last character (a quotation mark) 
rawfiles$aug2020$ZIP <- gsub('^.', '', rawfiles$aug2020$ZIP)       #remove first character (a quotation mark)

#coerce string to double for one column in aug2020 file
rawfiles$aug2020$ZIP <- as.double(rawfiles$aug2020$ZIP)

#################################################### MATCH ZIP CODES WITH COUNTIES 

#load zip code data
zips <- read_csv("/Users/aina/Documents/RA Projects/old projects/NV AB 122/R hurdle/misc. data items/OSCAR /zip_code_database.csv")
dataset.small <- read_xlsx("/Users/aina/Documents/RA Projects/Assisted Living/Data/dataset.small.xlsx")

#pull countyIDs from census data
countyIDs <- dataset.small %>% 
  select(COUNTY.ID,STATE,COUNTY.y)

#filter out unnecessary states (only looking at MW states right now)
zips <- zips %>% 
  select(zip, state, county) %>%
  filter(state == "ID" | state == "MT" | state == "NV" | state == "NM" | state == "UT" | state == "WY")

#rename columns for easier joining later
names(countyIDs) <- c("ID", "STATE", "COUNTY")
names(zips) <- c("ZIP", "STATE", "COUNTY")

#expand state names from abbreviations 
zips$STATEnames <- state.name[match(zips$STATE,state.abb)]

#paste county and state names together in one column so we can join this with the countyIDs dataframe 
zips$COUNTYfull <- paste(zips$COUNTY,zips$STATEnames, sep = ", ")

#select only the columns we need for joining (next step)
zips <- select(zips, ZIP,STATE,COUNTYfull)

#rename columns to join 
names(zips) <- c("ZIP","STATE","COUNTY")

#join ZIPs and countyIDs dfs
joined <- join(zips,countyIDs, by = "COUNTY", type = "left")

#select necessary columns 
joined <- select(joined, "ZIP", "STATE", "COUNTY", "ID")

#################################################### MATCH ZIPS IN HHA WITH COUNTIES IN JOINED

#join HHA raw files to get county and county IDs with joined df by zip code
rawfiles <- lapply(rawfiles,function(df) {
    join(df, joined, by = "ZIP", type = "left", match = "all")
})

#filter to only necessary columns
rawfiles <- lapply(rawfiles,function(df) {
  select(df,`Provider Name`, `Quality of patient care star rating`, `No. of episodes to calc how much Medicare spends per episode of care at agency, compared to spending at all agencies (national)`, 
         STATE, COUNTY, ID)
})

#################################################### GROUP & COUNT HHAs by COUNTY
#start new list to store clean files 
cleanfiles <- list()   

#group & count HHAs by county 
cleanfiles <- lapply(rawfiles,function(df) {
  df %>% group_by(ID) %>% summarize(n())})

#rename column to indicate HHA count 
cleanfiles <- lapply(cleanfiles,function(df) {
 rename(df, HHA = `n()`) })

#rename ID column 
cleanfiles <- lapply(cleanfiles,function(df) {
  rename(df, COUNTY.ID = ID) })



