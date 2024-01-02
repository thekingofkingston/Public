# Name: Christopher Kingston
# Date: 05/01/2023
# Assignment 14a

# Time Series Work

getwd()
setwd('C:/CODING/Math17/Week14')
list.files()

library(tidyverse)
library(ggplot2)
library(stringr)

x <- read.csv('NY-JFKairport-temperatures.csv')
View(x)

# pipping %>% or |>
# Average temperature data from 2010 to 2015

JFK_Temp <- x %>%
  select(DATE,TAVG) |>
  filter(DATE >= '2010-01' & DATE <= '2015-12') |>
  na.omit()
View(JFK_Temp)
Avg_Temp <- mean(JFK_Temp$TAVG)
Avg_Temp
summary(JFK_Temp)

# Convert Date to dates(needs days)
# Use head for smaller output
head(str_c(JFK_Temp$DATE,'-01'))
JFK_Temp$DATE <- str_c(JFK_Temp$DATE,'-01')
JFK_Temp$DATE <- as.Date(JFK_Temp$DATE)
str(JFK_Temp)

plot(JFK_Temp)
ggplot(JFK_Temp,
       aes(x=DATE,y=TAVG)) + geom_point() + geom_line()

install.packages('zoo')
library(zoo)
library(lubridate)

JFK_Temp <- x %>%
  select(DATE,TAVG) |>
  filter(DATE >= '2010-01' & DATE <= '2015-12') |>
  na.omit()
str(JFK_Temp)
JFK_Temp$DATE <- as.yearmon(JFK_Temp$DATE)
JFK_Temp$DATE <- as.Date(JFK_Temp$DATE)
plot(JFK_Temp)
ggplot(JFK_Temp,
       aes(x=DATE,y=TAVG)) + geom_point() + geom_line() +
  scale_x_date(date_labels = '%m/%y')

y <- read.csv('Raleigh-Durham North Carolina area electricity demand.csv')
View(y)
Electricity <- y %>%
  select(Datetime,Demand) %>%
  filter(Datetime >='2017-01-01' & Datetime <= '2017-02-01')
View(Electricity)
Summary(Electricity)

Electricity$Datetime <- as_datetime(as.POSIXct(Electricity$Datetime))
str(Electricity)

Electricity$Date <- date(Electricity$Datetime)
Electricity$Hour <- hour(Electricity$Datetime)

# XTS = Extensible Time Series
# XTS extends the zoo library

install.packages("xts", repos="http://cloud.r-project.org")
library(xts)

Electricity.xts <-
xts(Electricity$Demand, Electricity$Datetime)

View(Electricity.xts)
str(Electricity.xts)
plot(Electricity.xts)
# First seven hours
plot(head(Electricity.xts),7)
# First 72 hours
plot(head(Electricity.xts,24*3))

Electricity.zoo <-
zoo(Electricity$Demand,Electricity$Datetime)     
str(Electricity.zoo)     
plot(Electricity.zoo)
# First three days
plot(head(Electricity.zoo,24*3))
     
# What to do when data is missing in a time series analysis
# Data needed at a regular interval

# Extract data for March 2019
Electricity <- y %>%
  select(Datetime,Demand) %>%
  filter(Datetime >='2019-03-01' & Datetime <= '2019-04-01')
View(Electricity)
Summary(Electricity)
# NAs present
# Could omit
# Could average, use previous, or carry forward (often used)
# If number of NAs is small enough compared to the total data being used it may not matter, but the package requires entries
# Error is not corrected from datetime before XTS

Electricity$Datetime <- as_datetime(as.POSIXct((Electricity$Datetime)))
# Now XTS can be run
Electricity.xts <-
  xts(Electricity$Demand, Electricity$Datetime)
plot(Electricity.xts)
View(Electricity.xts)

# Stats window likely from zoo
Electricity.xts.window <-
  window(Electricity.xts,
         start = '2019-03-09',
         end = '2019-03-12')
View(Electricity.xts.window)
plot(Electricity.xts.window)
Electricity.xts.window.locf <-
  na.locf(Electricity.xts.window)
plot(Electricity.xts.window.locf)
mean(Electricity.xts.window.locf)

# NAs corrected, now group by
# What is the mean e;ectricity demand on each day?

plot(apply.daily(
  Electricity.xts.window.locf,
  mean
))


t <- '2017-04-27 6:30:14'

str(as_datetime(as.POSIXct(t)))
View(Electricity)
date(t)
hour(t)
minute(t)
second(t)
