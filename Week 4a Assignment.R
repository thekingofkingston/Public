# Name: Christopher Kingston
# Date: 02/08/2023
# Week 4 of Math 17

# Data type conversion

x <- c('4','10','1')
mean(x)
x.real <- as.double(x)
class(x.real)
mean(x.real)

#Data frames

Height <- c(5.5,6.0,5.2,5.5,6.2)
Age <- c(34,18,20,22,27)
Weight <- c(190,150,120,155,145)
Gender <- c('m','f','f','m','m')

Participant <- data.frame(
  Height,
  Age,
  Weight,
  Gender,
  stringsAsFactors = TRUE
)

Participant
str(Participant)

# Install the data.table package
install.packages('data.table')

library(data.table)

Participant_tb <- data.table(
  Height,
  Age,
  Weight,
  Gender
)

class(Participant_tb$Gender)
Participant_tb
Participant

Participant[2]
Participant_tb[2]

#Functionalities of tables
Participant_tb

# Sorting
Participant_tb[order(Gender)]
Participant_tb[order(Age)]
Participant_tb[order(Gender,Weight)]
Participant_tb[order(-Gender,Weight)]

#Extract columns
Participant_tb[,.(Weight,Gender)]
Participant_tb[,.(Gender,Height)]
Participant_tb[,.(Gender,Height,Weight)]

#Finding rows
#find data about male participants
Males <- Participant_tb[Gender=='m']
Males
Males <- Participant_tb[Gender=='m' & Age<30]
Males

Participant_tb

#Counting: How many participants have weight < 160?
count <- Participant_tb[,sum(Weight<160)]
print(count)


#Review: visualization methods
?rock
x <- rock$area
y <- rock$peri
z <- rock$shape
plot(x, pch=16,type='b')
abline(h=mean(x))
abline(h=mean(x)+sd(x))
abline(h=mean(x)-sd(x))


#Multiple scatter plots
plot(x, pch=16,type='b',ylim=c(300,12000))
points(y,pch=17,col='blue',type='b')
points(10000*z,pch=18,col='red',type='b')

legend(
  'topright',
  c('Area', 'Perimeter','Shape'),
  pch = c(16,17,18),
  col = c('black','blue','red')
)

#dev.off()
# plot(z)

# Test for normality
x <- rock$area
y <- rock$shape
hist(x)
W <- shapiro.test(x)

# Hypothesis testing
# Null hypothesis : distribution is normal
# 5% significance level.
W$statistic
W$p.value
W$method

hist(y)
shapiro.test(y)

# Navigating file system on your computer
getwd()
setwd('C:/CODING/Math17/Week04/')
list.files()

#install.packages('readxl')
library('readxl')
Cars <- read_excel('Cars.xlsx')
names(Cars)
x <- Cars$MPG
hist(x)
shapiro.test(x)

# Download data from the internet
url <- 'https://data.cityofnewyork.us/api/views/f9bf-2cp4/rows.csv?accessType=DOWNLOAD'
destination_file <- 'NYSAT2012.csv'
download.file(url,destination_file)
list.files()

NYSAT <- read.csv(destination_file)
NYSAT
# How many schools have students with average math SAT score > 400.
Score <- 400
Index <- which(NYSAT$SAT.Math.Avg..Score > Score)
NYSAT$SAT.Math.Avg..Score[Index]
New.index <- NYSAT$SAT.Math.Avg..Score[Index]
New.index

# Remove "s" from Index, convert to numerical value, and display the number of students that scored above 400 on the sat math exam

Edited.New.Index <- gsub("s","",New.index)
Edited.New.Index
Edited.New.Index_num <- as.numeric(Edited.New.Index)
Edited.New.Index_num
Index.400 <- Edited.New.Index_num
Index.400 <- data.frame(Index.400)
Index.400 <- na.omit(Index.400)
Index.400
Count.Index.400 <- nrow(Index.400)
Count.Index.400
sprintf('The number of New York students that scored above 400 on the SAT Math Exam was %f',Count.Index.400)