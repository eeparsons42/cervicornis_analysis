library(nlme)
library(ggplot2)


raw.counts <- read.csv("C:/Users/Emily/Desktop/cervicornis_analysis/data/all crosses/acer_all_together.csv")
head(raw.counts)

# code crosses

same_letter <- function(x) {
  x_split <- strsplit(as.character(x), "")
  if (x_split[[1]][1] == x_split[[1]][2])
    return(TRUE)
  else 
    return(FALSE)
}

selfs <- sapply(raw.counts$Sample.ID, same_letter)

raw.counts$cross <- ifelse(selfs, 'self', 'out')


boxplot(raw.counts$Fert.rate~raw.counts$Night)

ggplot(raw.counts, aes(Sample.ID, Fert.rate)) + 
  geom_boxplot(aes(col = Night))


acer.lm <- lm(Fert.rate ~ Night + Sample.ID, data = raw.counts)
summary(acer.lm)


acer.lme <- lme(Fert.rate ~ Night, random = ~ 1 | Sample.ID, data=raw.counts)
summary(acer.lme)

head(raw.counts)

plot(acer.lme)


#Plot of standardized residuals - here we see a systematic increase in the variance of... 
#the Eij as the level of the response increases...
#(the residuals on the right-had side of the plot have a greater vertical spread than those on the left,... 
#forming a wedge-shaped pattern)...


intervals(acer.lme)

anova(acer.lme)


boxplot(raw.counts$Fert.rate ~ raw.counts$cross)



means<- aggregate(raw.counts[,6], by = list(raw.counts[,2]), FUN = mean)
head(means)


barplot(means$x, main = "Fert rates")

boxplot(raw.counts$Fert.rate ~ raw.counts$cross)

boxplot(a.dir$fert ~ a.dir$dir, main = "genet A directionality")
boxplot(b.dir$fert ~ b.dir$dir, main = "genet B directionality")
boxplot(c.dir$fert ~ c.dir$dir, main = "genet C directionality")
boxplot(d.dir$fert ~ d.dir$dir, main = "genet D directionality")



boxplot(U24_dir$fert ~ U24_dir$dir, main = "genet U24 directionality")

ggplot(U24_dir2, aes(cross, fert)) + 
  geom_boxplot(aes(col = dir))

boxplot(fert~dir, data = U24_dir2)

ggplot(aall.dir2, aes(cross, fert)) + 
  geom_boxplot(aes(col = dir))

ggplot(all2_dir2, aes(cross, fert)) +
  geom_boxplot(aes(col = dir))

ggplot(all_dir_both, aes(cross, fert)) + 
   geom_boxplot(aes(col = dir))

acer.lm <- lm(Fert.rate ~ Night + Sample.ID, data = raw.counts)
summary(acer.lm)

acer_dir_lm <- lm(fert ~ dir, data = all_dir_both)
summary(acer_dir_lm)

boxplot(fert~dir, data = all_dir_both, main ="directional crosses all acer data")
t.test(fert~dir, data = all_dir_both)
