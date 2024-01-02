# Name: Christopher Kingston
# Date: 03/06/2023
# Assignment 7a

getwd()
setwd('C:/CODING/Math17/Week07')
list.files()
source('Week 7a Assignment.R')

#Redirect output to a file
sink('Output01.txt',split = F)
names(iris)
sink()
names(iris)

jpeg('iris_petal_length.jpg')
plot(iris$Petal.Length)
dev.off()

# Confidence Interval
# Constructing 90% confidence interval

x <- c(59.4,71.6,69.3,56.0,62.9,66.5,
  61.7,55.2,67.5,67.2,63.8,62.9,
  63.0,63.9,68.7,65.5,61.9,69.6,
  58.7,63.4,61.8,60.6,69.8,60.0,
  64.9,66.1,66.8,60.6,65.6,63.8,
  61.3,59.2,64.1,59.3,64.9,62.4,
  63.5,60.9,63.3,66.3,61.5,64.3,
  62.9,60.6,63.8,58.8,64.9,65.7,
  62.5,70.9,62.9,63.1,62.2,58.7,
  64.7,66.0,60.5,64.7,65.4,60.2,
  65.0,64.1,61.1,65.3,64.6,59.2)
Q <- t.test(x,conf.level = 0.90)
xl <- Q$conf.int[1]
xr <- Q$conf.int[2]
sprintf('The 90-percent confience interval of he mean is between %.2f and %.2f',xl,xr)

x <- c(1.11,1.07,1.11,1.07,1.12,1.08,0.98,0.98,1.02,0.95,0.95)
signifiance_level <- 0.05
t.test(x,mu=1,conf.level = 0.95,
       alternative = 'greater')
Q$p.value

# State the Conclusions Since the p-value 
# (p=0.036) is less than our alpha value, 
# we will reject the null hypothesis. 
# It is reasonable to state that the data 
# supports the claims that the average 
# conductivity level is greater than one.

# x1 = online classes, x2 = face to face classes

x1 <- c(67.6,41.2,85.3,55.9,82.4,91.2,
        73.5,94.1,64.7,64.7,70.6,38.2,
        61.8,88.2,70.6,58.8,91.2,73.5,
        82.4,35.5,94.1,88.2,64.7,55.9,
        88.2,97.1,85.3,61.8,79.4,79.4)
x2 <- c(77.9,95.3,81.2,74.1,98.8,88.2,
        85.9,92.9,87.1,88.2,69.4,57.6,
        69.4,67.1,97.6,85.9,88.2,91.8,
        78.8,71.8,98.8,61.2,92.9,90.6,
        97.6,100,95.3,83.5,92.9,89.4)
t.test(x1,x2,
       conf.level = 0.95,
       alternative = 'less')

# Reject the null hypothesis
# The professor was correct. 
# The evidence shows that the 
# mean of the final exam scores 
# for the online class is lower 
# than that of the face-to-face 
# class. At the 5-percent level 
# of significance, from the 
# sample data, there is 
# sufficient evidence to 
# conclude that the mean of the 
# final exam scores for the 
# online class is less than the 
# mean of the final exam scores 
# of the face-to-face class.

# Pair t-test
x1 <- c(6.6,6.5,9.0,10.3,11.3,8.1,6.3,11.6)
x1 <- c(6.8,2.4,7.4,8.5,8.1,6.1,3.4,2.0)
length(x2)
wilcox.test(x1,x2,
       conf.level = 0.95,
       alternative = 'greater')

# Conclusion: At 5% level of signicance,
# from the sample data, there is sufficient
# evidence to conclude that
# the sensory measurements, on average,
# are lower after hypnotism Hypnotism appears
# to be effective in reducing pain.

# ggplot time!
install.packages('ggplot2')
library(ggplot2)
x <- mtcars
names(x)

Q <- ggplot(x,
       aes(cyl,mpg))
Q <- Q + geom_point() + labs(x="number of cylinders",
         y="gas milage (mpg)")

Q + ggtitle("MPG vs number of cylinders")

Q + annotate("text", x=6, y=23,
              label="6-cylinder cars")
Q + annotate("rect", xmin=5.8, xmax6.2,
             ymin=17, ymax=25, alpha=0.1)

surveydata <- data.frame(
  age=c(23,32,25,27,40,39,43),
  athletes=c(rep('swim',4),rep('run',3))
)
surveydata
ggplot(surveydata,
       aes(x=athletes,y=ages)) + geom_point()
