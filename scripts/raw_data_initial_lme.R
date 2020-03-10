library(nlme)
library(ggplot2)

raw.counts <- read.csv("C:/Users/Emily/Desktop/acer.all.csv")
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


acer.lm <- lm(Fert.rate ~ Night + Sample.ID , data = raw.counts)
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




means<- aggregate(raw.counts[,6], by = list(raw.counts[,2]), FUN = mean)
head(means)



barplot(means$x, main = "Fert rates")
