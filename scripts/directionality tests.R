#analysis of reformatted dataset 

> all_dir_night <- read.csv("C:/Users/Emily/Desktop/cervicornis_analysis/data/all crosses/all_dir_night.csv")

library(nlme)
library(ggplot2)

ggplot(all_dir_night, aes(cross, fert)) + 
  geom_boxplot(aes(col = dir))

acer_dir_lm <- lm(fert ~ dir, data = all_dir_night)
summary(acer.lm)

acer_dir_night_lm <- acer.lm <- lm(fert~ dir + night, data = all_dir_night)
summary(acer_dir_night_lm)

boxplot(fert~night, data = all_dir_night)

acer_all_together <- read.csv("C:/Users/Emily/Desktop/cervicornis_analysis/data/all crosses/acer_all_together.csv")

boxplot(Fert.rate~Night, data = acer_all_together)
t.test(Fert.rate~Night, data = acer_all_together)
#no significant difference with a t-test

t.test(fert~night, data = all_dir_night)
#cant use all_dir_night dataset to test for night effect accurately
#the fert rates are repeated in the way that the data are organized to test for direction effect 
