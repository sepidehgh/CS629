
###### Import libraries ######
library(ggparliament)
library(ggplot2)
library(ggpol)

##### Set your directory ######

setwd("C:/Users/yasig/Downloads/Visualization")
data <- read.csv("NHANES_Dia2.csv")
df<- data.frame(data)
df_white <- filter(df,Class == "White")
count(df_white,Gender)
sum <- 22+17

##### clustering points along an arc ######

bt <- data.frame(
  parties = fontawesome(c('fa-male','fa-female')),
  seats   = c(floor((22/sum*100)/2), floor((17/sum*100)/2)),
  colors  = c("#dfab0b","#efd78b"),
  stringsAsFactors = FALSE)


bt$percentage <- c(round((bt[1,2]/sum(bt$seats))*100,1),round((bt[2,2]/sum(bt$seats))*100,1))


ggplot(bt) + 
  geom_parliament(aes(seats = seats, fill = parties), color = "black") + 
  scale_fill_manual(values = bt$colors,label = bt$percentage) +
  coord_fixed() + 
  theme_void()+
  theme(legend.position = "top",legend.direction="horizontal",
        legend.text=element_text(size =10,face="bold"),
        legend.spacing.x = unit(0.2, 'cm'))+
  labs(fill = "")
  

