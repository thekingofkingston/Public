# Name: Christopher Kingston
# Date: 04/08/2023
# Assignment 11b

# Download the New York City flight data from 2013.

install.packages('nycflights13')

install.packages('dplyr')
remove.packages("dplyr")
install.packages('dplyr')
library(dplyr)
library(nycflights13)

# Examine the variables airlines, airports, planes, and flights.

nycairlines <- nycflights13::airlines
nycairlines
nycairports <- nycflights13::airports
nycairports
nycplaines <- nycflights13::planes
nycplaines
nycflights <- nycflights13::flights
nycflights

# Write a R script to display flights in February of 2013 to show only the make and model of the plane for each day.

Feb_2013_Scheduled_Flights <- filter(nycflights, year == 2013 & month == 2)
Feb_2013_Scheduled_Flights

Feb_2013_Scheduled_Planes <- Feb_2013_Scheduled_Flights %>%
  left_join(nycplaines, by = "tailnum", relationship = "many-to-many")

Result <- Feb_2013_Scheduled_Planes %>% select(1,2,3,"manufacturer","model") 

# Cleaning NAs

Result <- na.omit(Result)

# Requested product
View(Result)