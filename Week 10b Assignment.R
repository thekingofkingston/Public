# Name: Christopher Kingston
# Date: 03/30/2023
# Assignment 10b


#Install data set
install.package('palmerpenguins')
# Install failure
install.packages("remotes")
remotes::install_github("allisonhorst/palmerpenguins")
library(palmerpenguins)

# Use dplyr
library(dplyr)

# The name of the data set is penguins
penguins <- palmerpenguins::
View(penguins)

# (A) compute the mean and standard deviation of the body mass for the different types of penguins in the data set.
pen1 <- penguins %>%
  group_by(species) %>%
  summarise(Mean = mean(body_mass_g, na.rm = TRUE),Std = sd(body_mass_g, na.rm = TRUE)) %>%
  arrange(-Mean)
View(pen1)

# (B) compute the mean and standard deviation of the body mass for the penguins from the different islands in the data set.  
pen2 <- penguins %>%
  group_by(island) %>%
  summarise(Mean = mean(body_mass_g, na.rm = TRUE),Std = sd(body_mass_g, na.rm = TRUE)) %>%
  arrange(-Mean)
View(pen2)

# (C) Perform the one-way ANOVA test to determine if male penguins from different islands have the same mean body mass (at 5% significance level).

# H0: The body_mass_g for the male penguins have the same means
# Ha: The means are not all the same.

# Filter for males
pen3 <- filter(penguins, !grepl('female', sex)) %>%
 na.omit(pen3)
View(pen3)

# RUn test
oneway.test(body_mass_g ~ as.factor(island),
            data = pen3,
            var.equal = F)

# Conclusion: Since the p-value < 0.05 the data provides sufficient evidence
# to show that the means are not all the same.

# Additional Visual (box plot) for evidence
pen_vis <- ggplot(pen3,
            aes(x=as.factor(island),y=body_mass_g))
pen_vis + geom_boxplot()
