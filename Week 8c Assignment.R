# Name: Christopher Kingston
# Date: 03/09/2023
# Assignment 8c

# Setup
getwd()
setwd('C:/CODING/Math17/Week08/')
list.files()

# Creating data frame
diet <- data.frame(
  Diet = c('1','2','3','4','5'),
  FHD = c(8,9,5,2,12),
  NFHD = c(27,22,14,8,25),
  Cancer = c(4,3,11,8,11),
  Stroke = c(14,20,25,4,17),
  Healthy = c(156,175,210,80,312),
  row.names = 1
)
diet
summary(diet)

# Chi-squared tests
diet.chi2 <- chisq.test(diet)
diet.chi2

# H0: The number of hours volunteered is independent
#     of the type of volunteers.
# Ha: The number of hours volunteered is dependent
#     of the type of volunteers.

# p-value = 0.005563 < 0.05 (Reject the null hypothesis)

# Conclusion: At 5% level of significance, from the data, there is sufficient 
# evidence to conclude that health outcomes are dependent on the type of diet.

diet.chi2$expected
diet.chi2$statistic

install.packages('corrplot')
install.packages('gridExtra')

library(corrplot)
library(gridExtra)
library(ggplot2)

# Creating balloon plot of residuals
corrplot(diet.chi2$residuals, is.corr = FALSE)
