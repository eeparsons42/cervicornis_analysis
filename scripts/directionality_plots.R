library(ggplot2) #for making plots using ggplot 

o_night1 <- read.csv("C:/Users/Emily/Desktop/cervicornis_analysis/data/data for statistical analysis/night_1_ova.csv")
s_night1 <- read.csv("C:/Users/Emily/Desktop/cervicornis_analysis/data/data for statistical analysis/night_1_sperm.csv")
o_night2 <- read.csv("C:/Users/Emily/Desktop/cervicornis_analysis/data/data for statistical analysis/night_2_ova.csv")
s_night2 <- read.csv("C:/Users/Emily/Desktop/cervicornis_analysis/data/data for statistical analysis/night_2_sperm.csv")


night1_ova_boxplots <- ggplot(o_night1, aes(genet, fert)) + ggtitle("fertilization rates based on directionality of genet - night 1 ova only") +
  geom_boxplot(aes(col = dir)) +
  geom_smooth(method = "lm", se = FALSE)
night1_ova_boxplots

night1_sperm_boxplots <- ggplot(s_night1, aes(genet, fert)) + ggtitle("fertilization rates based on directionality of genet - night 1 sperm only") +
  geom_boxplot(aes(col = dir)) +
  geom_smooth(method = "lm", se = FALSE)
night1_sperm_boxplots

night2_ova_boxplots <- ggplot(o_night2, aes(genet, fert)) + ggtitle("fertilization rates based on directionality of genet - night 2 ova only") +
  geom_boxplot(aes(col = dir)) +
  geom_smooth(method = "lm", se = FALSE)
night1_ova_boxplots

night2_sperm_boxplots <- ggplot(s_night2, aes(genet, fert)) + ggtitle("fertilization rates based on directionality of genet - night 2 sperm only") +
  geom_boxplot(aes(col = dir)) +
  geom_smooth(method = "lm", se = FALSE)
night2_sperm_boxplots