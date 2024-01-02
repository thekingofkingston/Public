# Name: Christopher Kingston
# Date: 03/16/2023
# Assignment 9a

# EDA = Exploratory Data Analysis or Visualization

# Setup
getwd()
setwd('C:/CODING/Math17/Week09/')
list.files()
library(ggplot2)

x <- diamonds
typeof(x)
class(x)
names(x)

q <- ggplot(x,
       aes(x=carat, y=price))
q + geom_point(aes(colour=factor(clarity)))
q + geom_point(aes(colour=factor(cut)))       
names(x)

index <- which(x$carat<1.1)
x1 <- x[index,]

q <- ggplot(x1,
            aes(x=carat, y=price))
q + geom_point()
q + geom_point(aes(colour=factor(clarity)))
q + geom_point(aes(colour=factor(clarity)))
q + geom_point(aes(shape=factor(clarity)))

index <- which(x$carat<1.1 & x$price<5001)
x2 <- x[index,]

q <- ggplot(x2,
            aes(x=carat, y=price))
q2 <- q + geom_point() +
  labs(title='Diamond price vs. carat',
    x='diamond carat',
    y='price ($)')

# Linear modeling

q2 + geom_smooth(method=lm, color='red')

# LOESS = locally weighted scatter plot smoothing
q2 + geom_smooth(method=loess,se = F,
                 color='red') +
  facet_grid(. ~clarity)

# Bar graph, histogram, distributions
names(x)
Q <- ggplot(x2, aes(depth))
Q2 <- Q + geom_histogram(col='darkblue',fill='lightblue')
Q2 + geom_density(
  aes(x=depth,y=(..count..))
)

# Bow plot
Q <- ggplot(x2,
       aes(x=price, y=color))
Q + geom_boxplot()
