# Name: Christopher Kingston
# Date: 05/22/2023
# Assignment 17a

# Setup
getwd()
setwd('C:/CODING/Math17/Week17/')
list.files()
library(tidyverse)
library(ggplot2)
library(modelr)
library(lubridate)
library(dplyr)

D <- diamonds
View(D)

# Cuts
ggplot(D,
       aes(cut,price)) + geom_boxplot()

# Colors
ggplot(D,
       aes(color,price)) + geom_boxplot()

# Clarity
ggplot(D,
       aes(clarity,price)) + geom_boxplot()

# Hex plot
install.packages('hexbin')
install.packages('stat_hexbin')

ggplot(D,
       aes(carat,price)) + geom_hex(bin=100)

SmallDiamonds <- D |>
  filter(carat <= 2) |>
  mutate(logprice=log10(price), logcarat=log10(carat))
View(SmallDiamonds)

ggplot(SmallDiamonds,
       aes(logcarat,logprice)) + geom_hex(bin=100)

# Linear Model
SmallDiamonds_LinearModel <- lm(logprice ~ logcarat, data=SmallDiamonds)
SmallDiamonds_LinearModel

# Add linear model line
ggplot(SmallDiamonds,
       aes(logcarat,logprice)) + geom_hex(bin=100) + 
  geom_abline(aes(intercept=3.675, slope=1.697),
              col='yellow', size=2)

summary(SmallDiamonds$carat)

Grid <- SmallDiamonds |>
  data_grid(carat = seq_range(carat,20)) |>
  mutate(logcarat=log10(carat)) |>
  add_predictions(SmallDiamonds_LinearModel, 'logprice') |>
  mutate(price = 10^logprice)
Grid
plot(Grid)

# Use residual to factor out the correlation

ggplot(SmallDiamonds,
       aes(carat,price)) +
  geom_hex(bins = 100) +
  geom_line(data = Grid, color='red', size=2)

SmallDiamonds <- SmallDiamonds |> 
  add_residuals(SmallDiamonds_LinearModel,'logresid')

ggplot(SmallDiamonds,
       aes(logcarat, logresid)) + geom_hex(bin = 100)    

ggplot(SmallDiamonds,
       aes(cut, logresid)) + geom_boxplot()   

ggplot(SmallDiamonds,
       aes(color, logresid)) + geom_boxplot()  

ggplot(SmallDiamonds,
       aes(clarity, logresid)) + geom_boxplot()  

# A better model (Uses Modelr)

SmallDiamonds_Model_AllVariables <- 
  lm(logprice ~ logcarat + color + cut + clarity,
     data = SmallDiamonds)

Grid <- SmallDiamonds |>
  data_grid(color, .model = SmallDiamonds_Model_AllVariables) |>
  add_predictions(SmallDiamonds_Model_AllVariables)
Grid
# ( Not sure why syntax is .model)

ggplot(Grid,
       aes(color, pred)) + geom_point()
# Just a linear model


# Return to Time-series data
# Flight data from 2013

Flights <- nycflights13::flights
View(Flights)

# Pipe date and group by date, then set to count not mean

DailyFlights <- Flights |>
  mutate(date = make_date(year,month,day)) |>
  group_by(date) |>
  summarise(n=n())
View(DailyFlights)

ggplot(DailyFlights,
       aes(date,n)) + geom_line()
# List days as days of the week
DailyFlights <- DailyFlights |>
  mutate(day = wday(date,label=T))

ggplot(DailyFlights,
       aes(day,n)) + geom_boxplot()

# Start with a linear model
DailyFlights_LinearModel <- 
  lm(n ~ day, data=DailyFlights)

Grid <- DailyFlights |>
  data_grid(day) |>
  add_predictions(DailyFlights_LinearModel, 'n')

# 'n' was Predicted_n, but n was the original variable and variables must stay
# the same or an error prevents ggplot from displaying the predicted values

Grid
ggplot(DailyFlights,
       aes(day,n)) + geom_boxplot() +
  geom_point(data=Grid, color='red')

# Predictor hits Saturday well, but not so much on the other days

# Now adding residual

DailyFlights <- DailyFlights |> 
  add_residuals(DailyFlights_LinearModel)

View(DailyFlights)

# h is a horizontal reference line
ggplot(DailyFlights,
       aes(date, resid)) + geom_line() +
  geom_ref_line( h=0 )
# Now aggregate data by week day
ggplot(DailyFlights,
       aes(date, resid, color=day)) + geom_line() +
  geom_ref_line( h=0 )
# Dive into large residuals like Thursday and Friday with a filter

DailyFlights |>
  filter(resid < -100)

ggplot(DailyFlights,
       aes(date, resid)) + geom_line() +
  geom_ref_line(h = 0) + 
  geom_smooth(se = F)
# Holidays are clearly what messed up the residuals and could be removed to strengthen the model

DailyFlights |>
  filter(day=='Sat' | day=='Sun') |>
  ggplot(aes(date,n)) + geom_line() +
  geom_smooth(se = F)
# Modeled non-linear model