
###### Import libraries ######

library(ggparliament)
library(ggplot2)
library(ggpol)

##### Set your directory ######

setwd("C:/Users/yasig/Downloads/Visualization")
data <- read.csv("NHANES_Dia2.csv")
df<- data.frame(data)
df_Asian<- filter(df,Class == "Asian")
count(df_Asian,Gender)
sum<- 18+28

##### clustering points along an arc ######

bt <- data.frame(
    parties = factor(c('male', 'female')),
    seats   = c(floor((18/sum*100)/2), floor((18/sum*100)/2)),
    colors  = c("#3d9f8e","#98cfc6"),
    stringsAsFactors = FALSE)
  
##### add percentage column ######

bt$percentage <- c(round((bt[1,2]/sum(bt$seats))*100,1),round((bt[2,2]/sum(bt$seats))*100,1))
  
#### Using ggplot and geom_parliament to plot ######
ggplot(bt) + 
    geom_parliament(aes(seats = seats, fill = parties), color = "black") + 
    scale_fill_manual(values = bt$colors,label = bt$percentage) +
    coord_fixed() + 
    theme_void()+
    theme(legend.position = "top",legend.direction="horizontal",
          legend.text=element_text(size =10,face="bold"),
          legend.spacing.x = unit(0.2, 'cm'))+
    labs(fill = "")