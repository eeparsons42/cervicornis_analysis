#analysis of reformatted dataset 

all_dir_night <- read.csv("C:/Users/Emily/Desktop/cervicornis_analysis/data/all crosses/all_dir_night.csv")

acer_all_together <- read.csv("C:/Users/Emily/Desktop/cervicornis_analysis/data/all crosses/acer_all_together.csv")

all_dir_both <- read.csv("C:/Users/Emily/Desktop/cervicornis_analysis/data/all crosses/all_dir_both.csv")


library(nlme)
library(ggplot2)

boxplot(Fert.rate~Night, data = acer_all_together, main = "Mean fertilization rates between night 1 and night 2", ylab = "Mean fertilization rates")

t.test(Fert.rate~Night, data = acer_all_together)
# p-value indicates no significant differece between fertilization rates of night 1 and night 2 

ggplot(all_dir_both, aes(cross, fert)) + ggtitle("fertilization rates based on directionality of cross") +
  geom_boxplot(aes(col = dir)) +
  geom_smooth(method = "lm", se = FALSE)


ggplot(all_dir_night, aes(genet, fert)) + ggtitle("fertilization rates based on directionality of genet") +
  geom_boxplot(aes(col = dir)) +
  geom_smooth(method = "lm", se = FALSE)


direction_lm <- lm(fert ~ dir, data = all_dir_night)
summary(direction_lm)

#directionality does not appear to be a significant preditor variable for these data 


acer_dir_night_lm <- lm(fert~ dir + night, data = all_dir_night)
summary(acer_dir_night_lm)





ggplot(all_dir_night, aes(night, fert)) + ggtitle("fertilization rates based on directionality of genet") +
  geom_point(aes(col = dir)) + 
  geom_smooth(aes(col=dir))
#add in linear regression 





