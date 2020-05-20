#### import libraries ######

library(ggplot2)
library(tidyverse)

##### Set your directory ######
setwd("C:/Users/yasig/Downloads/Visualization")

##### Finding Race percentage and make a dataframe ######

data <- read.csv("NHANES_Dia2.csv")
nrow(data)
# number of rows : 246

df_MaxAmc <- filter(data,Class == "Mexican American")
percent_MaxAmc = (nrow(df_MaxAmc)/nrow(data))*100
p1<-round(percent_MaxAmc,1)

df_multi <- filter(data,Class == "Multi-Racial Or Other Race")
percent_multi = (nrow(df_multi)/nrow(data))*100
p2<-round(percent_multi,1)

df_black <- filter(data,Class == "Black")
percent_black = (nrow(df_black)/nrow(data))*100
p3<-round(percent_black,1)

df_White<- filter(data,Class == "White")
percent_white = (nrow(df_White)/nrow(data))*100
p4 <- round(percent_white,1)

df_Asian<- filter(data,Class == "Asian")
percent_Asian = (nrow(df_Asian)/nrow(data))*100
p5 <- round(percent_Asian,1)

df_Other_Hispanic<- filter(data,Class == "Other Hispanic")
percent_Other_Hispanic = (nrow(df_Other_Hispanic)/nrow(data))*100
p6 <- round(percent_Other_Hispanic,1)

Race <- c("Other Hispanic","Asian","White","Black","Other Race","Mexican American" )
Percentage <- c(p6,p5,p4,p3,p2,p1)

###### Using ggplot for Braplot ######


df<- data.frame(Race,Percentage)
c1 <- df[[1]]
c2 <-df[[2]]


ggplot(df, aes(x = fct_reorder(c1,c2),y = c2,fill=c1)) +
  geom_bar(stat = "identity")+
  coord_flip()+
  geom_text(aes(label = paste0(c2,"%")),size = 5, nudge_y = 2)+
  scale_fill_manual(values=c("#3d9f8e","#a0a62f","#cd6161","#EA6400","#5ce1e6","#dfab0b"))+
  guides(fill=FALSE)+
  theme(axis.line = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y = element_text(size = 15,face= "bold"),
        axis.ticks.y=element_blank()) +
 scale_y_discrete(breaks=NULL)


