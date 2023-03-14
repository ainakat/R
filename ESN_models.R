
#load packages
pacman::p_load(sandwich,lmtest,gsubfn,plyr,dplyr, tidyverse,ggplot2, magrittr,data.table,DataCombine,stringr,fuzzyjoin,readxl,writexl,plm,lmtest,multiwayvcov,sandwich,broom,jtools,kableExtra,huxtable,ggpubr,stargazer) 
#load data
dataset.small <- read_xlsx("/Users/aina/Documents/RAProjects/SN & HHA/Data/dataset.small.xlsx")
#function to create robust SE
robust <- function(x) {
   cov.model <- vcovHC(x, type = "HC3")       
   robust.model <- sqrt(diag(cov.model))
   return(robust.model)
}

#################### REGRESSION TESTS 

RegFormulas <- list(); logitforms <- list()
OLSmodels <- list(); FEmodels <- list(); logitmodels <- list()
OLSrobust_se <- list(); FErobust_se <- list(); logitcluster_se <- list()

#################### REGRESSION FORMULAS for ALLEGATIONS ~ HHA
dataset.small$PercentIndepDiff75
{RegFormulas$form04   <- "HHA_per_1000oct20.residents  + metro + micro + Male.pop	+ income + Black.pop	+ NativeAmerican.pop + Hispanic.pop + Pop.Disabled"
RegFormulas$form05   <- "HHA_per_1000oct20.residents  + metro + micro + Male.pop	+ income + Black.pop	+ NativeAmerican.pop + Hispanic.pop + Medicare.age65.pop"
RegFormulas$form06   <- "HHA_per_1000oct20.residents  + metro + micro + Male.pop	+ income + Black.pop	+ NativeAmerican.pop + Hispanic.pop + Medicaid.age65.pop"
RegFormulas$form07   <- "HHA_per_1000oct20.residents  + metro + micro + Male.pop	+ income + Black.pop	+ NativeAmerican.pop + Hispanic.pop + IndepLive.pop.age75.over"
RegFormulas$form08   <- "HHA_per_1000oct20.residents  + metro + micro + Male.pop	+ income + Black.pop + Hispanic.pop + IndepLive.pop.age75.over"
}

{RegFormulas$form01   <- "HHA_oct20 + total.pop + metro + micro + Male.pop	+ income + Black.pop + Hispanic.pop + Pop.Disabled"
RegFormulas$form02   <- "HHA_oct20 + total.pop + metro + micro + Male.pop	+ income + Black.pop + Hispanic.pop + Medicare.age65.pop"
RegFormulas$form05   <- "HHA_oct20 + total.pop + metro + micro + Male.pop	+ income + Black.pop + Hispanic.pop + Pop.Disabled + Medicare.age65.pop + Medicaid.age65.pop +IndepLive.pop.age75.over"

RegFormulas$form06   <- "HHA_oct20 + total.pop + metro + micro + Male.pop	+ income + Black.pop + Hispanic.pop + Pop.Disabled + Medicare.age65.pop"
RegFormulas$form07   <- "HHA_oct20 + total.pop + metro + micro + Male.pop	+ income + Black.pop + Hispanic.pop + Pop.Disabled + Medicaid.age65.pop"
RegFormulas$form08   <- "HHA_oct20 + total.pop + metro + micro + Male.pop	+ income + Black.pop + Hispanic.pop + Pop.Disabled + IndepLive.pop.age75.over"
RegFormulas$form09   <- "HHA_oct20 + total.pop + metro + micro + Male.pop	+ income + Black.pop + Hispanic.pop + Medicare.age65.pop + Medicaid.age65.pop"
RegFormulas$form10   <- "HHA_oct20 + total.pop + metro + micro + Male.pop	+ income + Black.pop + Hispanic.pop + Medicare.age65.pop + IndepLive.pop.age75.over"
RegFormulas$form11   <- "HHA_oct20 + total.pop + metro + micro + Male.pop	+ income + Black.pop + Hispanic.pop + Medicaid.age65.pop + IndepLive.pop.age75.over"
RegFormulas$form12 <- "HHA_oct20 + total.pop + Male.pop	+ income + Black.pop"
}
RegFormulas$form03   <- "HHA_oct20 + total.pop + metro + micro + Male.pop + income + Black.pop + Hispanic.pop + Medicaid.age65.pop"
RegFormulas$form04   <- "HHA_oct20 + total.pop + metro + micro + Male.pop + income + Black.pop + Hispanic.pop + IndepLive.pop.age75.over"

RegFormulas$form05   <- "HHA_oct20 + total.pop + metro + micro + PercentMale + income + PercentAfricanAmerican + PercentHispanic + PercentMedicaid65"
RegFormulas$form06   <- "HHA_oct20 + total.pop + PercentMale + income + PercentAfricanAmerican + PercentHispanic + PercentAmbulatory75"
RegFormulas$form07   <- "HHA_oct20 + total.pop + metro + micro + PercentMale + income + PercentAfricanAmerican + PercentHispanic + PercentIndepDiff75"

################################################################################### REGRESSIONS, FE & OUTPUT FOR ALLEGATIONS ~ x

for (i in RegFormulas){                                                                 #loop for generating regressions, SE, summaries for OLS
   OLSmodels[[i]] <- lm(paste("allegations_20 ~", i[[1]]), data=dataset.small)       #run OLS regs from the RegFormulas list 
   OLSrobust_se[[i]] <- robust(OLSmodels[[i]])                      #generate robust SE, stored in cluster_se list 
}                                                     #OLS loop, clustered SE, summaries for OLS                

for (i in RegFormulas) {
   FEmodels[[i]] <- plm(paste("allegations_20 ~", i[[1]]), data=dataset.small,      #run FE regs from the RegFormulas list 
                        index = c("STATE"),
                        model = "within", 
                        effect = "twoways")        
   FErobust_se[[i]] <- robust(FEmodels[[i]])                                                #generate robust SE, stored in robust_se list 
}                                                    #FE loop, robust SE, summaries for FE 

stargazer(OLSmodels, 
           title="Results", 
           align=TRUE,
           type = "text",
           no.space = TRUE,
           out = "results3.text")            #OLS model summaries, with robust se for quick viewing 

FErobust_se[1]
OLSrobust_se[1]


