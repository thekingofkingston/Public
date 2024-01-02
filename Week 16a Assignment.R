# Name: Christopher Kingston
# Date: 05/12/2023
# Assignment 16a

# Time Series Work
AirPassengers
?AirPassengers
AP <- AirPassengers
class(AP)
str(AP)
plot(AP)
start(AP)
end(AP)
frequency(AP)
# Break out to annual
aggregate(AP)
plot(aggregate(AP))
# Different boxplot per year
boxplot(AP ~ cycle(AP))
# Apply both graphs together
layout(1:2)
plot(aggregate(AP))
boxplot(AP ~ cycle(AP))
# Return to single graph layout
layout(1)
plot(AP)

# Decomposition of a time series
# Additive vs multiplicative decomposition
AP.Decomp_Additive <- decompose(AP)
# Additive is the default
plot(AP.Decomp_Additive)
# First is the data
# Second is the trend
# Third is the behavior when the trend is the mid line (seasonal)
# Fourth is the extra stuff (compounding variables) noise
# Being additive the three will almost add together to equal the original data
AP.Add.Components <- AP.Decomp_Additive$trend + AP.Decomp_Additive$seasonal + AP.Decomp_Additive$random
plot(AP)
lines(AP.Add.Components,col='blue',lwd=3)
# Overlay the components on the original data
# Uses a moving average

# Multiplicative components
# The non-linear (exponential) nature of the data makes it better to use a multiplicative model

AP.Decomp_Mult <- decompose(AP,type='multiplicative')
plot(AP.Decomp_Mult)
# Same, but random bits have changed
# Random should become small
# Reconstitute data from components
AP.Decomp_Mult <- AP.Decomp_Mult$trend * AP.Decomp_Mult$seasonal * AP.Decomp_Mult$random
plot(AP)
lines(AP.Decomp_Mult,col='blue',lwd=3)

# Back to JFK temp data
getwd()
setwd('C:/CODING/Math17/Week14')
list.files()

library(lubridate)
library(zoo)
library(xts)
# install.packages('forecast')
library(forcast)

Temp_Monthly <- read.csv('NY-JFKairport-temperatures.csv')
View(Temp_Monthly)
# Convert data data to the correct format
Temp_Monthly$DATE <- as.Date(as.yearmon((Temp_Monthly$DATE)))
Temp_Monthly$Year <- floor_date(Temp_Monthly$DATE)

# Convert data structure to zoo structure
Temp_monthly.zoo <- zoo(Temp_Monthly$TAVG, Temp_Monthly$DATE)
# Same with XTS
Temp_monthly.xts <- xts(Temp_Monthly$TAVG, Temp_Monthly$DATE)
View(Temp_monthly.xts)
colnames(Temp_monthly.xts) <- c('Temperature')
plot(Temp_monthly.xts, main='Monthly Temperature', xlab='Months', ylab='Temperature')
View(Temp_monthly.zoo)
# Look at first points and notice first missing
plot(head(Temp_monthly.zoo, main='Monthly Temperature', xlab='Months', ylab='Temperature'))
# First three years forming trend
plot(head(Temp_monthly.zoo,36, main='Monthly Temperature', xlab='Months', ylab='Temperature'))
plot(head(Temp_monthly.zoo,48, main='Monthly Temperature', xlab='Months', ylab='Temperature'))
# Just tail
plot(tail(Temp_monthly.zoo,48, main='Monthly Temperature', xlab='Months', ylab='Temperature'))
Temp_monthly_2010s.xts <- window(Temp_monthly.xts, start='2010-01-01', end='2019-12-31')
plot(Temp_monthly_2010s.xts)
summary(Temp_monthly_2010s.xts)
# No NAs
summary(Temp_monthly.xts)
# Two NAs
# omit NAs
Temp_monthly.xts <- na.omit((Temp_monthly.xts))
summary(Temp_monthly.xts)
# No more NAs
mean(Temp_monthly.xts)
# Used xts without NAs

# Aggragate by periods
# Quarter
apply.quarterly(Temp_monthly.xts,mean)
# Year
apply.yearly(Temp_monthly_2010s.xts,mean)
# plot aggragation
plot(apply.yearly(Temp_monthly_2010s.xts,mean))
# Add frequency to avoid error
Q <- decompose(ts(Temp_monthly_2010s.xts, frequency=12))
plot(Q)

# ARIMA Model
# Auto Regressive Integrated Moving Average

Temp.arima <- arima(Temp_monthly.xts,order=c(0,0,0))
summary(Temp.arima)
mean(Temp_monthly.xts)
# linear model with zero slope
fitted(Temp.arima)
xts_fitted <- xts(fitted(Temp.arima), index(Temp_monthly.xts))
View(xts_fitted)
Temp_Model <- merge(xts_fitted, Temp_monthly.xts)
View(Temp_Model)
colnames(Temp_Model) <- c('Predicted_Temp', 'Original_Temp')
plot(Temp_Model)
predict(Temp.arima,5)
predict(Temp.arima,10)
forecast(Temp.arima,12)
# Plot 80 and 95 high low
plot(forecast(Temp.arima,12))
