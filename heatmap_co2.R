library(dplyr)
library(ggplot2)
library(reshape)

g<-read.csv("heatmap_co2.csv")

#this dataset shows per capita CO2 consumption (tonnes per person)

#Select certain columns (specific years)
g1<-g%>%select(country,X1950,X1955,X1960,X1965,X1970,X1975,X1980,X1985,X1990,X1995,X2000,X2005,X2010)

#Select certain rows (specific countries)
g2<-g1%>%filter(country=="China"|country=="India"|country=="United States"|country=="Indonesia"|
                  country=="Pakistan"|country=="Brazil"|country=="Nigeria"|country=="Bangladesh"|
                  country=="Russia"|country=="Mexico"|country=="Japan"|country=="Ethiopia"|
                  country=="Philippines"|country=="Egypt"|country=="Vietnam"|country=="Congo, Dem. Rep."|
                  country=="Turkey"|country=="Iran"|country=="Germany"|country=="Thailand"|
                  country=="United Kingdom"|country=="France"|country=="Italy"|country=="Tanzania"|
                  country=="South Africa")

#Remove "X" from the beginning of all column names
for ( col in 1:ncol(g2)){
  colnames(g2)[col] <-  sub("X", "", colnames(g2)[col])
}


#Change the dataset format
#The melt function takes data in wide format and
#stacks a set of columns into a single column of data.

g3<-melt(g2)

#Heatmap 1
plot1<-ggplot(g3, aes(variable, country, fill= value)) + 
  geom_tile()

plot1
  
plot2<-plot1+xlab("Year")+
  ylab("Country")+
  ggtitle("Per Capita Carbon dioxide Emission (Tonnes per person) from 1950-2010\n in the 25 Most Populous Countries")+
  labs(fill = "Per Capita Emission \n(Tonnes per person)")

plot2

#Let's learn about palette
?scale_fill_distiller

#Let's try some more palettes
plot2+  scale_fill_distiller(palette = "Accent") 
plot2+  scale_fill_distiller(palette = "PiYG")
plot2+  scale_fill_distiller(palette = "Spectral")

#Heatmap 2 <manually puttig colors>
plot2+scale_fill_gradient(low="pink",high="black")

