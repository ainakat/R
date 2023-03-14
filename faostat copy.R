

#install packages on Malieka's computer
#install.packages("FAOSTAT")
#install.packages("plyr")
#install.packages("dplyr")
#install.packages("tidyverse")
#install.packages("magrittr")
#install.packages("data.table")
#install.packages("stringr")
#install.packages("readxl")
#install.packages("writexl")

#load necessary packages
pacman::p_load(FAOSTAT,plyr,dplyr,tidyverse,magrittr,data.table,stringr,readxl,writexl) 

# Create a folder to store the data
dir.create("/Users/aina/Desktop/test")

# Bulk download all data under QCL domain (crop production)
crop_production <- get_faostat_bulk(code = "QCL", data_folder = "/Users/aina/Desktop/test")

#filter data based on our specifications for QCL
crop_production <- crop_production %>%
  filter(year > 1999) %>% 
  filter(area == "Brazil" | area == "Australia" | area == "China" | area == "India" | area == "Malaysia" | area == "Mexico" | area == "Russia" | area == "Ukraine" | area == "World") %>%
  filter(grepl('Cattle',item, ignore.case = T) | grepl('Swine',item, ignore.case = T) | grepl('Chicken',item, ignore.case = T) | grepl('eggs',item, ignore.case = T) | grepl('Barley',item, ignore.case = T) | grepl('Maize',item, ignore.case = T) | grepl('Cotton',item, ignore.case = T) | grepl('Sunflower',item, ignore.case = T) | grepl('Rapeseed',item, ignore.case = T) | grepl('Sorghum',item, ignore.case = T) | grepl('Wheat',item, ignore.case = T) | grepl('Palm oil',item, ignore.case = T) | grepl('Soy',item, ignore.case = T)) %>%
  select(area, item, element, year, unit, value, flag) 


# Bulk download all data under PP domain (producer price)
producer_price <- get_faostat_bulk(code = "PP", data_folder = "/Users/aina/Desktop/test")


#filter data based on our specifications for PP
producer_price <- producer_price %>%
  filter(year > 1999) %>% 
  filter(area == "Brazil" | area == "Australia" | area == "China" | area == "India" | area == "Malaysia" | area == "Mexico" | area == "Russia" | area == "Ukraine" | area == "World") %>%
  filter(grepl('Cattle',item, ignore.case = T) | grepl('Swine',item, ignore.case = T) | grepl('Chicken',item, ignore.case = T) | grepl('eggs',item, ignore.case = T) | grepl('Barley',item, ignore.case = T) | grepl('Maize',item, ignore.case = T) | grepl('Cotton',item, ignore.case = T) | grepl('Sunflower',item, ignore.case = T) | grepl('Rapeseed',item, ignore.case = T) | grepl('Sorghum',item, ignore.case = T) | grepl('Wheat',item, ignore.case = T) | grepl('Palm oil',item, ignore.case = T) | grepl('Soy',item, ignore.case = T)) %>%
  select(area, item, element, year, unit, value, flag) %>%
  filter(element == "producer_price__lcu_tonne_" | element == "producer_price_index__2014_2016___100_")


#export spreadsheet to desktop  
write_xlsx(crop_production,"/Users/aina/Desktop/crop_production.xlsx")
write_xlsx(producer_price,"/Users/aina/Desktop/producer_price.xlsx")

