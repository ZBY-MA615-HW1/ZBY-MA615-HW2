library(tidyverse) 
library(pacman)
library(dplyr)

# I choose two indicators: tax and inflation
tax<-read.csv("tax_revenue_percent_of_gdp.csv",header=TRUE)
#head(tax)
tax<-tax%>%
  pivot_longer(-country,names_to="year",values_to="tax") #tidy tax 

inflation<-read.csv("inflation_annual_percent.csv",header=TRUE)
#head(inflation)
inflation<-inflation[,-c(2,3,4,5,6,7,8,9,10,11,12)] #delete non-repeated years in "inflation"
for (i in 2:50) {  # transform "character" columns into "double"
if (typeof(inflation[,i])=="character")
inflation[,i]=as.numeric(inflation[,i])
}
inflation<-inflation%>%
  pivot_longer(-country,names_to="year",values_to="inflation") #tidy inflation 

same_country<-intersect(tax[,1],inflation[,1]) #countries appear in both table

#compare tax and inflation  between Afghanistan and Australia
tax_inflation<-merge(tax,inflation) #combine two table
Afghanistan_tax_inflation<-filter(tax_inflation,country=="Afghanistan") 
Australia_tax_inflation<-filter(tax_inflation,country=="Australia")

