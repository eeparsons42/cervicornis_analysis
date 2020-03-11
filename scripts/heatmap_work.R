library(ggplot2)
library(dplyr)
library(tidyr)
library(stringr)
str(acer_all_split)

heatmap <- acer_all_split %>%
  mutate(Sperm=factor(Sperm)) %>%
  mutate(Ova=factor(Ova)) %>%
  mutate(Fert.rate=as.numeric(Fert.rate))
  
  
  
ggplot(heatmap, aes(Sperm, Ova, fill = Fert.rate)) + geom_tile(colour="white",size=0.25)+
  #remove x and y axis labels
  labs(x="",y="")+
  #remove extra space
  scale_y_discrete(expand=c(0,0))+
  #define new breaks on x-axis
  scale_x_discrete(expand=c(0,0))+

  theme_grey(base_size=8)+
  #theme options
  theme(
    #bold font for legend text
    legend.text=element_text(face="bold"),
    #set thickness of axis ticks
    axis.ticks=element_line(size=0.4),
    #remove plot background
    plot.background=element_blank(),
    #remove plot border
    panel.border=element_blank())
                 
                     
                 



  