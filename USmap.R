
#### import libraries ######

library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)

#### import U.S. map #######
usa <- map_data("usa")

#### Plot U.S. map with ggplot###### 

ggplot() + geom_polygon(data = usa, aes(x=long, y = lat, group = group),fill ="#a0a62f") + 
  coord_fixed(1.3)+  theme(axis.line = element_blank(),
                           panel.grid.major = element_blank(),
                           panel.grid.minor = element_blank(),
                           panel.border = element_blank(),
                           panel.background = element_blank(),
                           axis.title.x=element_blank(),
                           axis.text.x=element_blank(),
                           axis.ticks.x=element_blank(),
                           axis.title.y=element_blank(),
                           axis.ticks.y=element_blank(),
                           axis.text.y=element_blank()) 
