# Name: Christopher Kingston
# Date: 03/30/2023
# Assignment 10a

# dplyr: manipulate data frames, tabular data
#

install.packages('dplyr')
remove.packages("dplyr")
install.packages('dplyr')
library(dplyr)
df <- mtcars
View(df)
?mtcars

# Select command

df1 <- select(df,mpg,cyl,hp,wt)
View(df1)

df2 <- select(df,-vs,-am,-gear,-carb)
View(df2)

# Make car make into data

df
rownames(df)

df1$Cars <- rownames(df1)
df1
View(df1)

# Filter
df3 <- filter(df1, grepl('Merc', Cars))
View(df3)

# Find all cars with mpg>20 and hp<70
df4 <- filter(df1, mpg>20 & hp<70) %>%
  arrange(-wt)
View(df4)

# Group_by command
df1 %>%
  group_by(cyl) %>%
  summarise(Mean = mean(mpg)) %>%
  arrange(-Mean)

# Mutate
df1 %>%
  mutate(mpg_per_cyl = mpg/cyl,
         wt_cyl = wt*cyl) %>%
  select(mpg,cyl,mpg_per_cyl,wt_cyl) %>%
  arrange(rownames(df1))

# Aggregate command
aggregate(mpg ~ as.factor(cyl),
          data = df1,
          function(x) c(Mean = mean (x),Std = sd(x)))

# ANOVA test
# One-way ANOVA test: Do different samples have the same mean?

library(ggplot2)
Q <- ggplot(df1,
            aes(x=as.factor(cyl),y=mpg,color=cyl))
Q + geom_point() + geom_jitter()

# Reinstalling rlang
install.packages("rlang")
library("rlang")

Q + geom_boxplot()
# As.factor keeps box plot as seperate cylinders

# H0: The mpg for the three types of cars (4,6, and 8 cyl) have 
#     the same means
# Ha: The means are not all the same.

oneway.test(mpg ~ as.factor(cyl),
            data = df1,
            var.equal = F)
# Similar syntax to aggregate
# Conclusion: Since the p-value < 0.05 the data provides sufficient evidence
# to show that the means are not all the same.
