# Name: Christopher Kingston
# Date: 03/09/2023
# Assignment 8a

# Setup
getwd()
setwd('C:/CODING/Math17/Week08/')
list.files()

# Load & explore dales data set
install.packages('readxl')
library('readxl')
Mysales2021 <- read_excel("Sales2021.xlsx")
Mysales2021
names(Mysales2021)
summary(Mysales2021)

# Setup expected variable for testing
Expected.Distribution <- Mysales2021$Percent/sum(Mysales2021$Percent)
Expected.Distribution

# Create chi^2 for testing hypothesis
Q1 <- chisq.test(Mysales2021$Q1, p = Expected.Distribution)
Q2 <- chisq.test(Mysales2021$Q2, p = Expected.Distribution)
Q3 <- chisq.test(Mysales2021$Q3, p = Expected.Distribution)

# Show results
Q1$statistic
Q2$statistic
Q3$statistic

Q1$p.value
Q2$p.value
Q3$p.value

Sales2021a <- sprintf('Q1= xsq: %s p-value:%s Q2= xsq: %s p-value:%s Q3= xsq: %s p-value:%s',Q1$statistic,Q1$p.value,Q2$statistic,Q2$p.value,Q3$statistic,Q3$p.value)
Sales2021a

# H0: The sales for a given quarter was independent
#     of the Percent expectations for the quarter.
# Ha: The sales for a given quarter was dependent
#     of the Percent expectations for the quarter.

# Q1: p-value = 1 > 0.05 (Failed to reject the null hypothesis)
# Q2: p-value = 1 > 0.05 (Failed to reject the null hypothesis)
# Q3: p-value = 2.2e-16 < 0.05 (Reject the null hypothesis)

# Conclusion: At 5% level of significance, from the data, there 
# is sufficient evidence to conclude that Q1 & Q2 failed to meet
# the Percent of expected sales, however Q3 met the Percent of
# of expected sales for 2021.
