# Name: Christopher Kingston
# Date: 02/01/2023
# Assignment 3b

?iris
Myiris <- iris
typeof(Myiris)
class(Myiris)
str(Myiris)
dim(Myiris)

# Names of the Columns
Myiris_names <- names(Myiris)
Myiris_names

# Summary Stats of Petal Length
My.Petal.Length <- Myiris$Petal.Length
Petal.Length.stats <- summary(My.Petal.Length)
Petal.Length.stats

# Petal Length Mean & Standard Deviation
Petal.Length.mean <- mean(My.Petal.Length)
Petal.Leangth.std <- sd(My.Petal.Length)
sprintf('Mean=%f and std=%f',Petal.Length.mean,Petal.Leangth.std)

# Petal Scatterplot
plot(My.Petal.Length,
     pch = 19,
     col = 'purple',
     main = 'Scatterplot of Iris Petal Length',
     xlab = 'Count',
     ylab = 'Length of Iris Petals')

# Computing lines for 2 Standard Deviations and Mean
P.left = Petal.Length.mean - 2*Petal.Leangth.std
P.right = Petal.Length.mean + 2*Petal.Leangth.std
sprintf('P_left = %f and P_right = %f', P.left, P.right)
abline(h=0.227404)
abline(h=7.288596)
abline(h=3.758000)

max(My.Petal.Length)
min(My.Petal.Length)

# Lines for two standard deviations out from the mean are not visible within the bounded range of the data
