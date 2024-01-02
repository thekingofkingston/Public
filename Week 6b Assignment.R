# Name: Christopher Kingston
# Date: 02/23/2023
# Assignment 6b


# Pulling data set and make a bar plot of gender vs minor
setwd('C:/CODING/Math17/Week06')
list.files()
Students <- read.csv('studentslist.csv')
names(Students)
Students$minor
Table_MinorVSGender <- table(Students$minor,
                             Students$gender)
Table_MinorVSGender
# Swapping axis
Table_MinorVSGender <- t(Table_MinorVSGender)
# Create bar plot
y <- barplot(Table_MinorVSGender,
        cex.names = 2,
        xlab = 'count',
        col = rainbow(2),
        beside = TRUE,
        horiz=T,
        las=1,
        xlim = c(0,750),
        main='Minors by Gender',
        legend = rownames(Table_MinorVSGender),
        args.legend = list(x ='topleft'))
# Setting margins
par(oma=c(1,18,1,1)) # 3 sides have 1 lines of space and the other 18 lines of space
par(mar=c(5,4,4,2) + 0.1)
