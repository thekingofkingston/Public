# Name: Christopher Kingston
# Date: 02/25/2023
# Assignment 6c

# Create two groups of data for comparison (number values changed each test)
x <- rnorm(1850, mean = 10, sd = 50)
y <- rnorm(350, mean = 60, sd = 15)         

# Take means of sample for use in function
xmean <- mean(x)
ymean <- mean(y)
xmean
ymean

# Function to compare means
CompareMeans <- function(x,y){
  if (mean(x)==mean(y)) return('same')
  if (mean(x)>mean(y)) return('positive')
  if (mean(x)<mean(y))return('negative')
}
CompareMeans(x,y)

# Test 1 Complete xmean=38.39294 ymean=40.89892 resulted correctly in 'negative' result
# Test 2 Complete xmean=38.84763 ymean=41.17103 resulted correctly in 'negative' result
# Test 3 Complete xmean=40.55862 ymean=41.41814 resulted correctly in 'negative' result
# Test 4 Complete xmean=77.41595 ymean=60.29083 resulted correctly in 'positive' result
# Test 5 Complete xmean=9.953273 ymean=61.02894 resulted correctly in 'negative' result

runif(2, min=0, max=100)
xmean <- 13.6956
ymean <- 3.1602

# Changed mean values to test equal and positive for wider tests
# Test 6 Complete xmean=10 ymean=10 resulted correctly in 'same' result
# Test 7 Complete xmean=12.6498 ymean=9.6853 resulted correctly in 'positive' result
# Test 8 Complete xmean=83.1574 ymean=7.3398 resulted correctly in 'positive' result
# Test 9 Complete xmean=12.6341 ymean=12.6341 resulted correctly in 'same' result
# Test 10 Complete xmean=12.6956 ymean=3.1602 resulted correctly in 'positive' result

# All ten tests passed and proceeding to student score2 and score3

setwd('C:/CODING/Math17/Week06')
list.files()
Students <- read.csv('studentslist.csv')
names(Students)

Score2 <- Students$score2
Score3 <- Students$score3
Score2
Score3

# Omitting NAs
Score2 <- na.omit(Students$score2)
Score3 <- na.omit(Students$score3)

na.omit()

xmean <- mean(Score2)
ymean <- mean(Score3)
CompareMeans(xmean,ymean)

# Means results of Score2=68.16496 and Score3=69.49469 with a correct result of 'negative'
