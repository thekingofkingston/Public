# Name: Christopher Kingston
# Date: 02/01/2023
# Week 3 of Math 17
# 
# Importing data set into a data frame
# Statistical analysis of columns of a data  frame
# Summary object.size
# Histogram, PDF, and CDF
# Scatter plot

data()
?rock
Mydf <- rock
typeof(Mydf)
class(Mydf)
str(Mydf)
dim(Mydf)

Mydf_names <- names(Mydf)
Mydf_names[4]
length(Mydf)

Mydf$area
Area <- Mydf$area
class(Area)
summary(Area)
Area_stats <- summary(Area)
Area_stats
class(Area_stats)
str(Area_stats)
Area_stats[[2]]
typeof(Area_stats[[2]])
Area_stats[5]

# Interquartile range = Q3-Q1
IQR <- Area_stats[[5]]-Area_stats[[2]]
sprintf('The IQR m= %f', IQR)

# Mean and standard deviation
Area_mean <- mean(Area)
Area_std <- sd(Area)
sprintf('Mean=%f and std=%f',Area_mean,Area_std)


#histogram

hist(Area,
     col = 'gold',
     border = 'black',
     main = 'Histogram of Rock Area',
     xlab = 'Area of Rocks',
     ylab = 'Count')

# PDF = Probability density function
hist(Area,
     col = 'gold',
     freq = FALSE)

# CDF
Area_CDF <- ecdf(Area)
plot(Area_CDF)


#Go back to the histogram
Area_hist <- hist(Area,
     col = 'gold')

Area_hist$equidist


# Using CDF to estimate percentile
# 80th percentile

Area_CDF <- ecdf(Area)
plot(Area_CDF)
abline(h=0.8)
abline(v=9350)
# dev.off()
sprintf('The 80th percentile is approvimately 9350')
