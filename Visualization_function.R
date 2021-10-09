#create visualization function which in used in presentation.Rmd file
vf<-function(input,x_tax,y_inflation){
library(tidyverse) #load all "tidyverse" libraries
  picture<-ggplot(data=input,mapping=aes(x=x_tax,y=y_inflation,group=year,color=year))+geom_point()+xlab("tax")+ylab("inflation") 
  return(picture)
}