# Name: Christopher Kingston
# Date: 03/06/2023
# Assignment 7c

# Call up Melbourne data
getwd()
setwd('C:/CODING/Math17/Week05/')
list.files()
library('readxl')
MelbourneHousing <- read_excel('MelbourneHousing.xlsx')
names(MelbourneHousing)
Data <- MelbourneHousing
MelbourneHousing$Suburb

# (A) compute and print the 90% confidence interval for the mean home price of homes in Heidelberg
Heidelberg <- which(MelbourneHousing$Suburb=="Heidelberg",
                    select.list(MelbourneHousing$Price))
Heidelberg
H <- t.test(Heidelberg,conf.level = 0.90)
A <- H

# (B) compute and print the 90% confidence interval for the mean home price of homes in Richmond
Richmond <- which(MelbourneHousing$Suburb=="Richmond",
                    select.list(MelbourneHousing$Price))
Richmond
print(Richmond)
R <- t.test(Richmond,conf.level = 0.90)
B <- R

# (C) apply hypothesis test to determine at the 10% significance level whether the mean price of 
# homes in Heidelberg is less than the mean home prices in Richmond.  State the p-value, and 
# conclusion of the hypothesis test.
C_work <- t.test(Heidelberg,Richmond,
       conf.level = 0.90,
       alternative = 'less')

C <- "Reject the null hypothesis. The evidence shows that the mean property price of Heidelberg is lower than that of the mean property price of Richmond. At the ten percent level  of significance, from the data, the p-value was 1."

# Redirect your output for (A), (B), and (C) to a text file (extension .txt) to upload it.
getwd()
setwd('C:/CODING/Math17/Week07/')
sink('Assignment 7c.txt')
Name_Date <- "Name: Christopher Kingston Date: 03/06/2023 Assignment 7c"
Name_Date
A
B
C_work
C
sink()
