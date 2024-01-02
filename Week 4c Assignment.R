# Name: Christopher Kingston
# Date: 02/12/2023
# Assignment 4c

# Download data set and import to R
getwd()
setwd('C:/CODING/Math17/Week04/')
list.files()
library('readxl')
Physics.Experiemnt <- read_excel('PHYSICS_EXPERIMENT.xlsx')
names(Physics.Experiemnt)
Trial1 <- Physics.Experiemnt$TRIAL1
Trial2 <- Physics.Experiemnt$TRIAL2
Trial3 <- Physics.Experiemnt$TRIAL3

# Scatter plot of Trial 2
plot(Trial2, pch=16,type='b')
abline(h=mean(Trial2))
abline(h=mean(Trial2)+sd(Trial2*1.5))
abline(h=mean(Trial2)-sd(Trial2*1.5))    

#dev.off()

# Number of values outside 1.5 times the standard deviation
Trial2.right <- mean(Trial2)+sd(Trial2*1.5)
Trial2.left <- mean(Trial2)-sd(Trial2*1.5)
Trial2.left
Trial2.right
Trial2

High <- which(Trial2>Trial2.right)
High
Trial2.right[High]
Low <- which(Trial2<Trial2.left)
Low
Trial2.left[Low]
Trial2.right[High]
str(Trial2.left[Low])
str(Trial2.right[High])
sprintf('There are 12 outlies.')