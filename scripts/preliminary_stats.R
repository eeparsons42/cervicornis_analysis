#Code to run preliminary stats on A. cervicornis data 
#See README.md in cervicornis_analysis repository for more detailed instructions 


#Read in data sets 

#Dataset for testing the effect of direction on fertilization rates organized by genet
all_dir_night <- read.csv("C:/Users/Emily/Desktop/cervicornis_analysis/data/data for statistical analysis/all_dir_night.csv")
#Dataset for testing the effect of night on fertilization rates
acer_all_together <- read.csv("C:/Users/Emily/Desktop/cervicornis_analysis/data/data for statistical analysis/acer_all_together.csv")

#load these libraries before analysis 
library(ggplot2) #for making plots using ggplot 


#boxplot examining differences in fertilization rates between night 1 and night 2 
boxplot(Fert.rate~Night, data = acer_all_together, main = "Mean fertilization rates between night 1 and night 2", ylab = "Mean fertilization rates")


#testing for significant difference between average fertilization rate per night 
t.test(Fert.rate~Night, data = acer_all_together)
# p-value indicates no significant differece between fertilization rates of night 1 and night 2 


#If no significant difference is found, can proceed to treat both nights as the same dataset as all other variables were controlled for

#plotting differences in fert rate based on directionality, organized by each cross
cross_dir_boxplots <- ggplot(all_dir_night, aes(cross, fert)) + ggtitle("fertilization rates based on directionality of cross") +
  geom_boxplot(aes(col = dir)) +
  geom_smooth(method = "lm", se = FALSE)



#plotting differences in fert rate based on directionality, organized by genet
genet_dir_boxplots <- ggplot(all_dir_night, aes(genet, fert)) + ggtitle("fertilization rates based on directionality of genet") +
  geom_boxplot(aes(col = dir)) +
  geom_smooth(method = "lm", se = FALSE)


#run a linear model on all_dir_night dataset 
direction_lm <- lm(fert ~ dir, data = all_dir_night)
summary(direction_lm)


#run a linear model on all_dir_night dataset adding in night as an effect 
acer_dir_night_lm <- lm(fert~ dir * night, data = all_dir_night)
summary(acer_dir_night_lm)

#saving plots to "figs" in directory 
ggsave(cross_dir_boxplots,filename="cross_dir_boxplots.png",height=5.5,width=8.8,units="in",dpi=200) 
ggsave(genet_dir_boxplots,filename="genet_dir_boxplots.png",height=5.5,width=8.8,units="in",dpi=200)

