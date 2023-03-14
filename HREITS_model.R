# install.packages("plm")
library(plm)

#load data
data<- read.csv("/Users/aina/Documents/Grad School/FALL 2020/ECON 743/data/clean.csv")
attach(data)

# Set data as panel data
pdata <- pdata.frame(data, index=c("firmID","Year"))

# Pooled OLS estimator
pooling <- plm(housing.portfolio ~ region+post+treatment+posttreatment, data=pdata, model= "pooling")
summary(pooling)

# Between estimator
between <- plm(housing.portfolio ~ region+post+treatment+posttreatment, data=pdata, model= "between")
summary(between)

# First differences estimator
firstdiff <- plm(housing.portfolio ~ region+post+treatment+posttreatment, data=pdata, model= "fd")
summary(firstdiff)

# Fixed effects or within estimator
fixed <- plm(housing.portfolio ~ region+post+treatment+posttreatment, data=pdata, model= "within")
summary(fixed)

# Random effects estimator
random <- plm(housing.portfolio ~ region+post+treatment+posttreatment, data=pdata, model= "random")
summary(random)

# LM test for random effects versus OLS
plmtest(pooling)

# LM test for fixed effects versus OLS
pFtest(fixed, pooling)

# Hausman test for fixed versus random effects model
phtest(random, fixed)
