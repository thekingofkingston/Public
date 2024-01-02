# Name: Christopher Kingston
# Date: 04/24/2023
# Assignment 13b

# Setup
getwd()
setwd('C:/CODING/Math17/Week13/')
list.files()
library(tidyverse)
library(ggplot2)
library(dplyr)
LifeExpectancy <- read.csv("LifeExpectancy.csv")
View(LifeExpectancy)

# Extract life expectancy and adult mortality data for the year 2014 for all countries and save it in a data set df.  
df <- LifeExpectancy %>%
  select(Life.expectancy, Adult.Mortality, Year) %>%
  filter(Year == '2014')
View(df)
# Insured data was not lost so removing Year column
df <- within(df, rm(Year))

# Plot the life expectancy vs. adult mortality using ggplot.
graph.life <- ggplot(df,
  aes(x=Life.expectancy,y=Adult.Mortality)) + geom_point()

# Generate the linear model (using lm) to model the given data.  
Life.model <- lm(Adult.Mortality~Life.expectancy, data=df)
Summary <- summary(Life.model)

# Give the equation of the linear regression.
best_a1 <- Life.model$coefficients[1]
best_a2 <- Life.model$coefficients[2]
cat('Best model is y=', best_a1,'+',best_a2,'x.','\n')

# Plot the linear model together with the given data.
graph.life.regression <- graph.life + geom_abline(intercept=best_a1, slope=best_a2)

# Compute the adjusted r2 value.
r <- Summary$adj.r.squared
cat('The adjusted r2 value =', r,'\n')

# What percent of the variation in life expectancy can be accounted for by the variable adult mortality?
s <- r*100
cat(s, '% of the variation in life expectancy can be accounted for by the variable adult mortality in the 2014 data')

# Now investigate whether the relationship between life expectancy and adult mortality that is represented by the 
# adjusted r2 values change with time.  Give a table in two columns, year and the adjusted r2 values.

df <- LifeExpectancy %>%
  select(Life.expectancy, Adult.Mortality, Year)
View(df)

# 2014 taken from earlier work
y2014 <- r

# Create a data frame filtered for each year
y2000 <- df %>%
  select(Life.expectancy, Adult.Mortality, Year) %>%
  filter(Year == '2000')
y2001 <- df %>%
  select(Life.expectancy, Adult.Mortality, Year) %>%
  filter(Year == '2001')
y2002 <- df %>%
  select(Life.expectancy, Adult.Mortality, Year) %>%
  filter(Year == '2002')
y2003 <- df %>%
  select(Life.expectancy, Adult.Mortality, Year) %>%
  filter(Year == '2003')
y2004 <- df %>%
  select(Life.expectancy, Adult.Mortality, Year) %>%
  filter(Year == '2004')
y2005 <- df %>%
  select(Life.expectancy, Adult.Mortality, Year) %>%
  filter(Year == '2005')
y2006 <- df %>%
  select(Life.expectancy, Adult.Mortality, Year) %>%
  filter(Year == '2006')
y2007 <- df %>%
  select(Life.expectancy, Adult.Mortality, Year) %>%
  filter(Year == '2007')
y2008 <- df %>%
  select(Life.expectancy, Adult.Mortality, Year) %>%
  filter(Year == '2008')
y2009 <- df %>%
  select(Life.expectancy, Adult.Mortality, Year) %>%
  filter(Year == '2009')
y2010 <- df %>%
  select(Life.expectancy, Adult.Mortality, Year) %>%
  filter(Year == '2010')
y2011 <- df %>%
  select(Life.expectancy, Adult.Mortality, Year) %>%
  filter(Year == '2011')
y2012 <- df %>%
  select(Life.expectancy, Adult.Mortality, Year) %>%
  filter(Year == '2012')
y2013 <- df %>%
  select(Life.expectancy, Adult.Mortality, Year) %>%
  filter(Year == '2013')
y2015 <- df %>%
  select(Life.expectancy, Adult.Mortality, Year) %>%
  filter(Year == '2015')

# Create a linear regression between mortality and life expectancy by year
lm2000 <- lm(Adult.Mortality~Life.expectancy, data=y2000)
Summary2000 <- summary(lm2000)
lm2001 <- lm(Adult.Mortality~Life.expectancy, data=y2001)
Summary2001 <- summary(lm2001)
lm2002 <- lm(Adult.Mortality~Life.expectancy, data=y2002)
Summary2002 <- summary(lm2002)
lm2003 <- lm(Adult.Mortality~Life.expectancy, data=y2003)
Summary2003 <- summary(lm2003)
lm2004 <- lm(Adult.Mortality~Life.expectancy, data=y2004)
Summary2004 <- summary(lm2004)
lm2005 <- lm(Adult.Mortality~Life.expectancy, data=y2005)
Summary2005 <- summary(lm2005)
lm2006 <- lm(Adult.Mortality~Life.expectancy, data=y2006)
Summary2006 <- summary(lm2006)
lm2007 <- lm(Adult.Mortality~Life.expectancy, data=y2007)
Summary2007 <- summary(lm2007)
lm2008 <- lm(Adult.Mortality~Life.expectancy, data=y2008)
Summary2008 <- summary(lm2008)
lm2009 <- lm(Adult.Mortality~Life.expectancy, data=y2009)
Summary2009 <- summary(lm2009)
lm2010 <- lm(Adult.Mortality~Life.expectancy, data=y2010)
Summary2010 <- summary(lm2010)
lm2011 <- lm(Adult.Mortality~Life.expectancy, data=y2011)
Summary2011 <- summary(lm2011)
lm2012 <- lm(Adult.Mortality~Life.expectancy, data=y2012)
Summary2012 <- summary(lm2012)
lm2013 <- lm(Adult.Mortality~Life.expectancy, data=y2013)
Summary2013 <- summary(lm2013)
lm2015 <- lm(Adult.Mortality~Life.expectancy, data=y2015)
Summary2015 <- summary(lm2015)

# Extract r-squared values by year
y2000 <- Summary2000$adj.r.squared
y2001 <- Summary2001$adj.r.squared
y2002 <- Summary2002$adj.r.squared
y2003 <- Summary2003$adj.r.squared
y2004 <- Summary2004$adj.r.squared
y2005 <- Summary2005$adj.r.squared
y2006 <- Summary2006$adj.r.squared
y2007 <- Summary2007$adj.r.squared
y2008 <- Summary2008$adj.r.squared
y2009 <- Summary2009$adj.r.squared
y2010 <- Summary2010$adj.r.squared
y2011 <- Summary2011$adj.r.squared
y2012 <- Summary2012$adj.r.squared
y2013 <- Summary2013$adj.r.squared
y2015 <- Summary2015$adj.r.squared
print(y2015)
# Compiling r-squares for each year into a data frame

Year <- c(2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2002,2013,2014,2015)
rsquared <- c(0.3900234,0.3989747,0.3754431,0.3442121,0.5928241,0.3838388,0.4425049,0.4413589,0.6214754,0.5609838,0.6077775,0.5982878,0.5268386,0.5195551,0.5731593,0.604856)
rsquared.by.year <- data.frame(Year,rsquared)
View(rsquared.by.year)

# Plot the adjusted r2 values with the years.
graph.rsquared <- ggplot(rsquared.by.year,
                     aes(x=Year,y=rsquared)) + geom_point()
graph.rsquared
# rsquared for life expectancy to mortality is not consistent