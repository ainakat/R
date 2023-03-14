#load packages

library(AER)
library(dplyr)
library(tidyr)
library(tidyverse)
library(ggplot2)
library(magrittr)
library(plyr)
library(countreg)
library(pscl)
library(ggpubr)
library(gt)
library(MLmetrics)
library(writexl)
library(broom)

#load the data 
dataset <- read.csv("/Users/aina/Documents/RA Projects/NV AB 122 Feasibility Study/Hurdle Model/R/dataset.csv")
attach(dataset)


####################################################

## Hurdle 2, Negative Binomial
mod.hurdle.nb.2 <- hurdle(alf ~ pop.rate.200.below.fpl+mcaid.pop.rate+indep.liv.diff.75+age.ratio.75.over.25.64|
                            urban.2.3.4.5+urban.6.7.8.9+urban.10.11.12,
                          data = dataset,
                          dist = "negbin", 
                          zero.dist = "binomial", 
                          link = "logit")
summary(mod.hurdle.nb.2)


#MSE
MSE <- MSE(y_pred= mod.hurdle.nb.2$fitted.values, y_true= dataset$alf)
MSE

#null model, only intercept, no covariates 
null.mod.hurdle.nb.2 <- hurdle(alf ~ 1,
                               data = dataset,
                               dist = "negbin", 
                               zero.dist = "binomial", 
                               link = "logit")

#mcfadden R-squared 
R.sqrd <- 1-(logLik(mod.hurdle.nb.2)/logLik(null.mod.hurdle.nb.2))
R.sqrd

summary(mod.hurdle.nb.2)$r.squared

#export output to txt
sink("mod.hurdle.nb.2.txt")           
summary(mod.hurdle.nb.2)
sink() 

#expected counts and probabilities 
expected.prob <- as.data.frame(predict(mod.hurdle.nb.2, dataset,
                       type = c("prob"),
                       se.fit = TRUE, dispersion = NULL, terms = c("terms"))[180:196])

#export output to excel 
write_xlsx(expected.prob, "/Users/aina/Documents/RA Projects/NV AB 122 Feasibility Study/Hurdle Model/R/Data Files/expected.prob.xlsx")


#######################################model 1

mod.1 <- glm(alf.dummy ~ A+B.2+C+D,
             data = dataset,
             family = "binomial"
             (link="probit"))
summary(mod.1)

#export coeff, std. error & p-value
mod.1.coef <- as.data.frame(summary(mod.1)$coefficients)
write_xlsx(mod.1.coef, "/Users/aina/Documents/RA Projects/NV AB 122 Feasibility Study/Hurdle Model/R/Data Files/mod.1.coef.xlsx")

#mcfadden R-squared 
R.sqrd.1 <- 1-(logLik(mod.1)/logLik(null.mod))

#export Rsqrd
MSE.Rsqrd.1 <- as.data.frame(cbind(R.sqrd.1))
write_xlsx(MSE.Rsqrd.1, "/Users/aina/Documents/RA Projects/NV AB 122 Feasibility Study/Hurdle Model/R/Data Files/MSE.Rsqrd.1.xlsx")

# Percent correctly predicted values
table.1 <- (table(true = alf.dummy, pred = round(fitted(mod.1))))
table.1

# Probit model predicted probabilities
mod.1.pp <- as.data.frame(predict(mod.1, type="response") [180:196])
write_xlsx(mod.1.pp, "/Users/aina/Documents/RA Projects/NV AB 122 Feasibility Study/Hurdle Model/Output/predictions/predicted.probabilities.xlsx")






