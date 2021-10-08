

library(tidyverse)
library(pacman)
library(dplyr)

tax<-read.csv("tax_revenue_percent_of_gdp.csv",header=TRUE)
#head(tax)
tax<-tax%>%
  pivot_longer(-country,names_to="year",values_to="tax")

inflation<-read.csv("inflation_annual_percent.csv",header=TRUE)
#head(inflation)
inflation<-inflation[,-c(2,3,4,5,6,7,8,9,10,11,12)] #delte years in "inflation"
for (i in 2:50) {
if (typeof(inflation[,i])=="character")
inflation[,i]=as.numeric(inflation[,i])
}
inflation<-inflation%>%
  pivot_longer(-country,names_to="year",values_to="inflation")

#same_country<-intersect(tax[,1],inflation[,1]) #countires appear in both table
#tax_inflation<-inner_join(tax,inflation,by="country") #retai rows with same coutry??
#tax_inflation<-tax_inflation[!duplicated(as.list(tax_inflation))]
tax_inflation<-merge(tax,inflation)
Afghanistan_tax_inflation<-filter(tax_inflation,country=="Afghanistan")