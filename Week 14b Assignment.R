# Name: Christopher Kingston
# Date: 05/01/2023
# Assignment 14b

# setup
getwd()
setwd('C:/CODING/Math17/Week14')
list.files()

library(tidyverse)
library(ggplot2)
library(stringr)
install.packages("devtools")
devtools::install_github("tidyverse/modelr")
library(modelr)
install.packages("plotly")
library(plotly)

# In this assignment, you are going to explore nonlinear modeling.
# Use the code from last week and make some modification to model the data in the file
# by the model function:  f(t) = A + Bt + Ct^2
lastweek <- read.csv('Datafile.csv')
View(lastweek)

base <- ggplot(lastweek,
       aes(x=lastweek$X1,y=lastweek$X6.862272018)) + geom_point()
base


# Attempt to use code off Stack Overflow
x <- lastweek$X1
base +
  stat_smooth(method = 'nls', formula = 'y~A+B(x)+C(x)^2',
              method.args = list(start=c(A=3, B=7, c=-11)), se=FALSE +
                geom_point(size=4, pch=21, color = 'black', stroke=1.5, aes(fill=group)))

a1 + a2*x + a3*x^2

# Model from homework is linear and doesn't apply
mymodel <- c(3,7)

DisplayModel <- function(mymodel,data){
  ggplot(lastweek,
         aes(x=lastweek$X1,y=lastweek$X6.862272018)) + geom_point() +
  geom_abline(intercept = model[1], slope = model[2])
}

Displaymodel(mymodel,lastweek)
dist <- DistanceBetweenModelAndData(mymodel,df)
cat('model: ', mymodel,'; dist=',dist,'\n')

# Parameter space
Mymodels <- expand.grid(
  a1 = seq(0,15,by=0.5),
  a2 = seq(-2,5,by=0.5)
)
plot(Mymodels)
View(Mymodels)

# The first column in the file is the independent variable t and the second column is the dependent variable.
# You will have to change various functions in lecture 13 to accommodate the given model. 
# In ggplot, to graph the function: g(x) = 3 + 7x - 11x^2
# first define it as a function, and use the stat_function in the form stat_function(fun=g).
# Another attempt
g <- 3+7(x)-11(x)^2

base + geom_function(fun = g)

a1 + a2*x + a3*x^2


# Trash attempts
# Make Model
g <- c(3,7,-11)

DisplayModel(mymodel,lastweek)

# Prepare Data with x^2 
f <- lm(X1~X6.862272018+I(X1)+I(X1^2),data = lastweek)

lastweek$x.sq <- lastweek$X1^2

# Something
set.seed(1014)
df <- tibble::tibble(
  x = sort(runif(100)),
  y = 5 * x + 0.5 * x ^ 2 + 3 + rnorm(length(x))
)

mod <- lm(y ~ x, data = df)
df %>% add_predictions(mod)

# Display
DisplayModel <- function(model, data){
  ggplot(lastweek,
         aes(x=lastweek$X1,y=lastweek$X6.862272018)) + geom_point()  
    geom_abline(intercept = model[1], slope = model[2])
}

# Created function
#Displaymodel <- (mymodel,lastweek)
# used z for make the variable squared
#<- function(A,B,C){
#  A+B*(lastweek$X1)+C*(lastweek$z)
#}

