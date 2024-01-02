# Name: Christopher Kingston
# Date: 02/20/2023
# Assignment 5d

# Download data set and import to R
getwd()
setwd('C:/CODING/Math17/Week05/')
list.files()
library('readxl')
MelbourneHousing <- read_excel('MelbourneHousing.xlsx')
names(MelbourneHousing)

# Extract property missing land sizes and omit land sizes that are zero
AUSlandsizes <- MelbourneHousing$Landsize
CleanedAUSlandsizes <- which(MelbourneHousing$Landsize>1)
CleanedAUSlandsizes

# Plot landsizes
AUSHist <- hist(CleanedAUSlandsizes,
col = 'yellow',
border = 'black',
main = 'Histogram of Austrailian land sizes in Melbourne',
xlab = 'Land Size',
ylab = 'Count')

# Run a Shapiro-Wilk test
AUSNormal <- shapiro.test(CleanedAUSlandsizes)
# Data set exceeded Stapiro-wilks test's max 5000 sample size at 11641, however the histogram exposes that there is no normal distribution in land size within the data set

# Summary of AUS land size
AUSsummary <- summary(CleanedAUSlandsizes)
AUSsummary

# Generate report as PDF

                