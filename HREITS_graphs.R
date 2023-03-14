# install.packages("plm")
library(plm)
library(stargazer)
library(ggplot2)
library(plot3D)
library(rgl)
library(plot3Drgl)

data<- read.csv("/Users/aina/Documents/Grad School/FALL 2020/ECON 743/data/clean.csv")
attach(data)

TreatFirms <- subset.data.frame(data, treatment == 1)
UntreatedFirms <- subset.data.frame(data, treatment == 0)

#descriptive stats 
stargazer(data)
stargazer(data[1:5,], summary=FALSE, rownames=FALSE)
stargazer(pooling, fixed, firstdiff, title="Results", align=TRUE)

#plot comparisons 
plot1 <- ggplot(data, mapping = aes(x = Year, y = housing.portfolio, group = firmID, colour=firmID)) +
  geom_line(show.legend = TRUE)+
  geom_vline(xintercept = 2008, color="black")+
  labs(y="Portfolio Share", title = "Senior Housing Share of Total REIT Portfolio for U.S.-REITs")+
  theme(text=element_text(size=16, family="Times New Roman"))
plot1
plot2 <- ggplot(UntreatedFirms, mapping = aes(x = Year, y = housing.portfolio, group = firmID, colour=firmID)) +
  geom_line(show.legend = TRUE)+
  geom_vline(xintercept = 2008, color="black")+
  labs(y="Portfolio Share", title = "Portfolio Share of Senior Housing for Controlled REITs")
ggsave("plot.png", plot1)

#firm rev 
firmrev<- read.csv("/Users/aina/Documents/Grad School/FALL 2020/ECON 743/data/firm rev.csv")
attach(firmrev)

names(firmrev)[names(firmrev) == "Market.cap.billions"] <- "Market Capitalization(Billions)"
names(firmrev)[names(firmrev) == "rev.2019.millions"] <- "Revenue(Millions)"

as.numeric(firmrev$`Market Capitalization(Billions)`)

treated <- firmrev %>% 
  slice(-4,-5,-7,-8,-9) %>%
  select(Firm,`Revenue(Millions)`)

control <- firmrev %>% 
  slice(-1,-2,-3,-6,-9) %>%
  select(Firm,`Revenue(Millions)`)

stargazer(treated[1:4,],summary=FALSE, rownames=FALSE)
stargazer(control[1:4,],summary=FALSE, rownames=FALSE)

#3D plots 

plot5 <- hist3D (x = 1:5, y = 1:4, z = VADeaths,
          bty = "g", phi = 20,  theta = -60,
          xlab = "", ylab = "", zlab = "", main = "VADeaths",
          col = "#0072B2", border = "black", shade = 0.8,
          ticktype = "detailed", space = 0.15, d = 2, cex.axis = 1e-9)
# Use text3D to label x axis
text3D(x = 1:5, y = rep(0.5, 5), z = rep(3, 5),
       labels = rownames(VADeaths),
       add = TRUE, adj = 0)
# Use text3D to label y axis
text3D(x = rep(1, 4),   y = 1:4, z = rep(0, 4),
       labels  = colnames(VADeaths),
       add = TRUE, adj = 1)

hist3D_fancy(iris$Sepal.Length, iris$Petal.Width, colvar=as.numeric(iris$Species))


#avg portfolio per year 

averages <- data %>%
  select(Year,housing.portfolio) %>%
  group_by(Year) %>%
  summarise_at(vars(housing.portfolio), funs(mean(housing.portfolio, na.rm = TRUE)))

plot3 <- averages %>%
  ggplot(averages, mapping=aes(x=Year, y=housing.portfolio)) +
  geom_point(size=3,shape=20) +
  geom_vline(xintercept = 2008, color="black")+
  geom_smooth(method= "auto", se=TRUE, fullrange=FALSE, level=0.95) +
  labs(y="Average Senior Housing Share of Total Portfolio", 
       title = "Average Senior Housing Share of Portfolio for U.S.-REITs by Year")+
  theme(text=element_text(size=16, family="Times New Roman"))
plot3
ggsave("plot3.png", plot3)



