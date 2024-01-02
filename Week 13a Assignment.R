# Name: Christopher Kingston
# Date: 04/24/2023
# Assignment 13a

library(tidyverse)
library(ggplot2)
library(modelr)

df <- sim1
view(sim1)

Displaymodel <- function(model,data){
  ggplot(data,
       aes(x=x,y=y)) + geom_point() +
    geom_abline(intercept = model[1], slope = model[2])
}

DistanceBetweenModelAndData <- function(model,data){
  Prediction <- model[1] + model[2]*data$x
  Residual <- data$y - Prediction
  return(sqrt(sum(Residual^2)))
}
  
# what function to use to model the data?
# f(x)=a1 + a2*x

mymodel <- c(4,2)
Displaymodel(mymodel,df)
dist <- DistanceBetweenModelAndData(mymodel,df)
cat('model: ', mymodel,'; dist=',dist,'\n')

# Parameter space
Mymodels <- expand.grid(
  a1 = seq(0,15,by=0.5),
  a2 = seq(-2,5,by=0.5)
)
plot(Mymodels)
View(Mymodels)


# Calculate the distances between each model to the data set
Dist <- c()
for(i in 1:length(Mymodels$a1)){
  mymodel <- c(Mymodels$a1[i], Mymodels$a2[i])
  dist <- DistanceBetweenModelAndData(mymodel,df)
  Dist <- append(Dist,dist)
}
Mymodels$Distance <- Dist

i <- which(Mymodels$Distance == min(Mymodels$Distance))
i
cat('Minimum distance = ', Mymodels$Distance[i],'\n')
best_a1 <- Mymodels$a1[i]
best_a2 <- Mymodels$a2[i]
cat('Best model is y=', best_a1,'+',best_a2,'x.','\n')
Displaymodel(c(best_a1,best_a2),df)

# View all possible models
ggplot(df,
       aes(x=x,y=y)) + geom_point() +
  geom_abline(aes(intercept=a1, slope=a2),
              data=Mymodels)

# View the parameter space and the best models

Rank <- 15
ggplot(Mymodels,
       aes(x=a1,y=a2)) + geom_point() +
  geom_point(data=filter(Mymodels, Dist<Rank),
             size=5, color='red')

# Continued Parameter space
Mymodels <- data.frame(
  a1 = runif(100,-1,12),
  a2 = runif(100,-2,7)
)
plot(Mymodels)
View(Mymodels)

# Linear model command
q <- lm(y~x, data=df)
summary(q)
