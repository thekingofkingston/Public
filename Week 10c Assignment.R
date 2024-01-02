# Name: Christopher Kingston
# Date: 03/30/2023
# Assignment 10c

# You are researching for diamonds to purchase in the near future.  As a data scientist, you are going to explore the diamonds data set for this purpose.
# Load Diamons
?diamonds
dia <- diamonds

# Suppose you are interested in diamonds with cuts that are either very good, premium, or ideal.
# In addition, you want the clarity to be either VVS2, VVS1, or IF.  The diamond has to be greater
# than 0.75 and less than 1.1 carats.  Expensive!  
colnames(dia)
View(dia)
d <- dia %>%
  filter((cut == "Very Good" | cut == "Premium" | cut == "Ideal") & (clarity == "VVS2" | clarity == "VVS1" | clarity == "IF") & (carat > 0.75 & carat < 1.1))
View(d)

# Use the dplyr tools

# (A) display the mean and standard deviation of prices of diamonds for the three different cuts you are interested in,
dia1 <- d %>%
  group_by(cut) %>%
  summarise(Mean = mean(price, na.rm = TRUE),Std = sd(price, na.rm = TRUE)) %>%
  arrange(-Mean)
View(dia1)

# (B) display the mean and standard deviation of prices of diamonds for the three different clarity you are interested in.
dia2 <- d %>%
  group_by(clarity) %>%
  summarise(Mean = mean(price, na.rm = TRUE),Std = sd(price, na.rm = TRUE)) %>%
  arrange(-Mean)
View(dia2)

# (C) Using ggplot, create the box plot of the prices for diamonds with the three different clarities in your data set.
library(ggplot2)
library(rlang)
dia3 <- ggplot(d,
                  aes(x=as.factor(clarity),y=price))
dia3 + geom_boxplot()
