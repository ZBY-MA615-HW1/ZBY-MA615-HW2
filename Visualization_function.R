#create visualization function which in used in presentation.Rmd file
vf<-function(input,x_tax,y_inflation){
library(tidyverse) #load all "tidyverse" libraries
  picture<-ggplot(data=input,mapping=aes(x=x_tax,y=y_inflation,group=year,color=year))+geom_point()+xlab("tax")+ylab("inflation") 
  return(picture)
}
p1<-vf(input=Afghanistan_tax_inflation,x_tax=Afghanistan_tax_inflation$tax,y_inflation=Afghanistan_tax_inflation$inflation) #transfer the functionn file to display the picture of Afghanistan
p1<-p1+labs(title = "Afghanistan")
p1

p2<-vf(input=Australia_tax_inflation,x_tax=Australia_tax_inflation$tax,y_inflation=Australia_tax_inflation$inflation) #transfer the functionn file to display the picture of Australia
p2<-p2+labs(title = "Australia")
p2
#A new visualization function recommended
new<-function(input,x_tax,y_inflation){
  picture_new<-ggplot(data = input)+geom_point(mapping = aes(x=x_tax,y=y_inflation,size=year,col=year))
  return(picture_new)
}
p1<-new(input=Afghanistan_tax_inflation,x_tax=Afghanistan_tax_inflation$tax,y_inflation=Afghanistan_tax_inflation$inflation) #transfer the function file to display the picture of Afghanistan
p1<-p1+labs(title = "Afghanistan")
p1

p2<-new(input=Australia_tax_inflation,x_tax=Australia_tax_inflation$tax,y_inflation=Australia_tax_inflation$inflation) #transfer the function file to display the picture of Australia
p2<-p2+labs(title = "Australia")
p2
###Here I modified the author's visualization file with 'size' character because I think it will be difficult for someone to distinguish with the colors although using size for a discrete variable is not advised.
###In this way, we can see the difference from year to year more visually.
f<-function(data,xvar,yvar){
  ggplot(data,aes_string(xvar,yvar))+
    geom_point()+
    geom_smooth(method = "lm")+theme(panel.grid = element_blank(),panel.background = element_rect(fill='transparent',color='black'))+
    guides(color=guide_legend(title="x"))
}
p3<-f(Afghanistan_tax_inflation,Afghanistan_tax_inflation$tax,Afghanistan_tax_inflation$inflation)
p3

p4<-f(Australia_tax_inflation,Australia_tax_inflation$tax,Australia_tax_inflation$inflation)
p4
###Here I added two images using 'geom_smooth', we can clearly see the distribution of data for each year and the respective regression
###lines.From the plots, maybe we can draw a conclusion that the more tax is, the less inflation will be. We can calculate
###the relationship between inflation and tax better in this way.

