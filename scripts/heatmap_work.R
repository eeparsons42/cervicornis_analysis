library(ggplot2)
library(dplyr)
library(tidyr)
library(stringr)
str(acer_all_split)

acer_all_split <- read.csv("C:/Users/Emily/Desktop/cervicornis_analysis/data/data for heatmap/acer_all_split.csv")

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
night1 <- acer_all_split[1:51,]                 


night2 <- acer_all_split[52:246,]

library(RColorBrewer)


heatmap_night1 <- ggplot(night1, aes(Sperm, Ova, fill = Fert.rate)) + geom_tile(colour="white", size = 0.25 )+
  scale_y_discrete(expand=c(0,0))+
  #define new breaks on x-axis
  scale_x_discrete(expand=c(0,0))+
 
  
  guides(fill=guide_legend(title="Fertilization rate"))+
  labs(title="Fertilization of A. cervicornis crosses (August 21st, 2019)")+
  
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
    panel.border=element_blank())+
  theme_grey(base_size=10)+
  theme(legend.position="right",legend.direction="vertical",
        legend.title=element_text(colour=textcol),
        legend.margin=margin(grid::unit(0,"cm")),
        legend.text=element_text(colour=textcol,size=7,face="bold"),
        legend.key.height=grid::unit(0.8,"cm"),
        legend.key.width=grid::unit(0.2,"cm"),
        axis.text.x=element_text(size=10,colour=textcol),
        axis.text.y=element_text(vjust=0.2,colour=textcol),
        axis.ticks=element_line(size=0.4),
        plot.background=element_blank(),
        panel.border=element_blank(),
        plot.margin=margin(0.7,0.4,0.1,0.2,"cm"),
        plot.title=element_text(colour=textcol,hjust=0,size=14,face="bold"))
  
  
  


heatmap_night2 <- ggplot(night2, aes(Sperm, Ova, fill = Fert.rate)) + geom_tile(colour = "white", size = 0.25)+
  scale_y_discrete(expand=c(0,0))+
  #define new breaks on x-axis
  scale_x_discrete(expand=c(0,0))+

  
  guides(fill=guide_legend(title="Fertilization rate"))+
  labs(title="Fertilization of A. cervicornis crosses (August 23rd, 2019)")+
  
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
    panel.border=element_blank())+
  theme_grey(base_size=10)+
  theme(legend.position="right",legend.direction="vertical",
        legend.title=element_text(colour=textcol),
        legend.margin=margin(grid::unit(0,"cm")),
        legend.text=element_text(colour=textcol,size=7,face="bold"),
        legend.key.height=grid::unit(0.8,"cm"),
        legend.key.width=grid::unit(0.2,"cm"),
        axis.text.x=element_text(size=10,colour=textcol),
        axis.text.y=element_text(vjust=0.2,colour=textcol),
        axis.ticks=element_line(size=0.4),
        plot.background=element_blank(),
        panel.border=element_blank(),
        plot.margin=margin(0.7,0.4,0.1,0.2,"cm"),
        plot.title=element_text(colour=textcol,hjust=0,size=14,face="bold"))

heatmap_night1
heatmap_night2

ggsave(heatmap_night1,filename="acer1_heatmap.png",height=5.5,width=8.8,units="in",dpi=200)
ggsave(heatmap_night2,filename="acer2_heatmap.png",height=5.5,width=8.8,units="in",dpi=200)



  