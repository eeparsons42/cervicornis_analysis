---
  title: "Acer analysis"
author: "Emily Parsons"
date: "March 9, 2020"
output: html_document
---
  
  ```{r}
raw.counts <- read.csv("C:/Users/Emily/Desktop/acer.all.csv")
head(raw.counts)
```

```{r}
boxplot(raw.counts$Fert.rate~raw.counts$Night)
```

```{r}
install.packages("nlme")
```
```{r}
library(nlme)
```


```{r}
acer.lm <- lm(Fert.rate~Night, data = raw.counts)
summary(acer.lm)
```


```{r}
acer.lme <- lme(Fert.rate~Night, random = ~ 1 | Sample.ID, data=raw.counts)
summary(acer.lme)
```

```{r}
plot(acer.lme)
```

Plot of standardized residuals - here we see a systematic increase in the variance of the Eij as the level of the response increases (the residuals on the right-had side of the plot have a greater vertical spread than those on the left, forming a wedge-shaped pattern) 

```{r}
intervals(acer.lme)
```
```{r}
anova(acer.lme)
```


```{r}
means<- aggregate(raw.counts[,6], by = list(raw.counts[,2]), FUN = mean)
head(means)
```

```{r}
barplot(means$x, main = "Fert rates")
```