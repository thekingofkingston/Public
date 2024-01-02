# Name: Christopher Kingston
# Date: 03/06/2023
# Assignment 7b

x <- rnorm(30)
x
n <- 5
n

# sample mean function
f <- function(x,n){
  mean(sample(x,n,replace = F))
}
# test
f(x,4)

# Create 100 sample means and store to w
w <- rep(NA,100)
for (i in 1:100) {
  sample <- f(x,9)
  w[i] <- mean(sample)
}
w
?append

# Generate histogram
hist(w,
     col='gold',
     border = 'black',
     main = 'Means of sampled normalized random numbers',
     xlab = 'Mean',
     ylab = 'Count'
     )

# Pull Melbourne Housing positive land sizes
getwd()
setwd('C:/CODING/Math17/Week05/')
list.files()
library('readxl')
MelbourneHousing <- read_excel('MelbourneHousing.xlsx')
names(MelbourneHousing)
AUSlandsizes <- MelbourneHousing$Landsize
CleanedAUSlandsizes <- which(MelbourneHousing$Landsize>1)
CleanedAUSlandsizes

# # Generate the histogram that is the distribution of 
# 2000 sample means where each sample has size 50.  
# Even though the original distribution may not be normal, 
# you still get something useful from the distribution of the means.
y  <- rep(NA,2000)
for (i in 1:2000) {
  sample <- f(CleanedAUSlandsizes,50)
  y[i] <- mean(sample)
}
y

