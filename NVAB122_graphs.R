
#install and load packages

install.packages("gt")
install.packages("plyr")
install.packages("dplyr")
install.packages("tidyr")
install.packages("magrittr")
install.packages("tidyverse")
install.packages("glue")

library(gt) 
library(plyr)
library(dplyr)
library(tidyr)
library(magrittr)
library(tidyverse)
library(glue)

#install PhantomJS, we'll need this for calling exporting jpegs down below 

install_phantomjs(version = "2.1.1",
                  baseURL = "https://github.com/wch/webshot/releases/download/v0.3.1/",
                  force = FALSE)

#set working directory so images save to this location 

setwd("~/Desktop")

# Figure 1.1: Medicaid’s Role in LTSS in Nevada, 2016 

#create an object for the colors of the pie chart called "colors"
colors = c("steelblue4", "slategray1")

#start a jpeg file for this pie chart 
jpeg(filename = "pie_1.1.jpeg", width = 850, height = 500) 

#create an object for the slices of the pie chart, notice they are not in quotations, because I want R to recognize them as integers 
str(slices)
slices <- c(303, 395)

#create an object for the labels of the slices called "lbls"
lbls <- c("Institutional Services", "Home and Communited Based Services")

#create percentage values 
pct <- round(slices/sum(slices)*100) 

# add percents to labels
lbls <- paste(lbls, pct)
lbls

# add % to labels
lbls <- paste(lbls,"%",sep="")
lbls

#create the pie chart object, and name it "pie_1.1"
pie_1.1 <- pie(slices,labels = lbls,
      main="Figure 1.1: LTSS Expenditures by Types of Services, (2016)",
      sub= "Source: Eiken et al., 2018",
      family = "Times New Roman", 
      cex.sub=1.8, cex.main=2.0, cex=1.8, 
      col=colors)
pie_1.1

#save the image to the desktop, it should pop up on your desktop 
dev.off()


#pie chart: pie_1.2
slices <- c(57, 23, 4, 16)
lbls <- c("Medicaid", "Out of Pocket", "Private Long Term Care Insurance", "Other")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels
greyColors = c("steelblue4", "slategray1", "slategray3", "slategrey")

jpeg(filename = "pie_1.2.jpeg", width = 950, height = 650) 
pie_1.2 <- pie(slices,labels = lbls,
           main="Figure 1.2: National Spending for LTSS by Payer, 2017",
           col=greyColors, 
           family = "Times New Roman",
           cex.sub=2.0, cex.main=2.2, cex = 2.0,
           sub= "Source: Hado & Komisar, 2019")
dev.off()


#bar chart 1.3: elder abuse allegations in rural counties 

counts_elder <- c(5,316,300,39,228,577)
lbls_elder <- c("Abandonment", "Abuse", "Exploitation", "Isolation", "Neglect", "Self-Neglect")

jpeg(filename = "bar_1.3.jpeg", width = 1100, height = 612) 
par(mar=c(6,6,5,3))
bar_1.3 <- barplot(counts_elder, names.arg=lbls_elder, main="Figure 1.3: Elder Abuse Allegations in Rural Counties (2019)",
                   xlab="Category of Allegation", 
                   ylab="Number of Allegations", 
                   family = "Times New Roman",
                   sub = "Source: Elder Abuse Reporting System, 2019",
                   font = 1.1, font.lab = 2, font.axis = 1.1, 
                   cex.axis = 1.4, cex.lab = 2.0, cex.sub = 1.3, cex.main = 1.9, cex.names = 1.7,
                   col= "steelblue4",
                   ylim=c(0,700))
text(bar_1.3, y=counts_elder, labels= counts_elder, pos = 3, cex=1.6, family = "Times New Roman", font = 2)
dev.off()

bar_1.3

#bar chart: Ch 4 ~ annualized private pay cost, united states, 2017
counts_pay <- c(97455, 87600, 45000, 18200, 33540)
lbls_pay <- c("Nursing Facility Private Room", "Nursing Facility Shared Room", 
              "Assisted Living", "Adult Day Services", "Home Health Aide, 30 Hrs/Week")

jpeg(filename = "bar_privatepay.jpeg", width = 1300, height = 800) 
bar_privatepay <- barplot(counts_pay, names.arg=lbls_pay, main="Annualized Private Pay Cost, United States (2017)",
                          xlab="Facility", 
                          ylab="Median Annual Cost (Dollars)", 
                          family = "Times New Roman",
                          sub = "Source: AARP Public Policy Institute, 2018",
                          font = 1.1, font.lab = 2, font.axis = 1.1, 
                          cex.axis = 1.4, cex.lab = 1.5, cex.sub = 1.1, cex.main = 1.5, cex.names = 1.3,
                          col= "steelblue4",
                          ylim=c(0,120000)) 
text(bar_privatepay, y=counts_pay, labels= counts_pay, pos = 3, cex=1.2, family = "Times New Roman", font = 2) 
dev.off()



#pie chart: pie_4.7
slices <- c(57, 23, 4, 16)
lbls <- c("Medicaid", "Out of Pocket", "Private Long Term Care Insurance", "Other")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels
greyColors = c("steelblue4", "slategray1", "slategray3", "slategrey")

jpeg(filename = "pie_4.7.jpeg", width = 950, height = 650) 
pie_1.2 <- pie(slices,labels = lbls,
               main="Figure 4.7: National Spending for LTSS by Payer, 2017",
               col=greyColors, 
               family = "Times New Roman",
               cex.sub=2.0, cex.main=2.2, cex = 2.0,
               sub= "Source: Hado & Komisar, 2019")
dev.off()





