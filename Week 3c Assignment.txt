# Name: Christopher Kingston
# Date: 02/01/2023
# Assignment 3c

?mtcars
Mymtcars <- mtcars
typeof(Mymtcars)
class(Mymtcars)
str(Mymtcars)

# Isolated MPG
Mymgp <- Mymtcars$mpg
Mymgp

# Histogram
hist(Mymgp,
     col = 'gold',
     border = 'black',
     main = 'MPG of Automobiles (1973-74 models)',
     xlab = 'MPG',
     ylab = 'Count')

# Probability Density Function
# pdf(Mymgp)
hist(Mymgp,
     col = 'gold',
     freq = FALSE)

#Cumulative Density Function
MPG_CDF <- ecdf(Mymgp)
plot(MPG_CDF)
abline(h=0.8)
abline(v=23.75)
sprintf('The 80th percentile is approximately 23.75')
