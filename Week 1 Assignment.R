# Script 1 - week 1
# Math/CS 17
# Christopher Kingston
# 01/22/2023

print('Welcome to R')
cat('Welcome to R')
sprintf('Welcome to R')

# String in R
Mymessage <- 'Welcome to R'
Mymessage
print(Mymessage)
cat(Mymessage)
typeof(Mymessage)
str(Mymessage)

# Integers and real numbers
a <- 15
a
print(a)
cat(a)
typeof(a)
b <- 50
b
a+b
b-a
a*b
2*a+3*b
a/b

sprintf('a+b = %d',a+b)

mypi = 3.1415
print(mypi)
cat(mypi)
sprintf("%1.2f",mypi)

# Boolean variables
Flag <- TRUE
typeof(Flag)
print(Flag)

Flag <- FALSE
if (Flag) print('It is true') else print('False')

Flag <-False
if (Flag){
  a <- 10
  print(a)
}else {
  a <- 400
  print('a=400;)')
}

#Vectors
v <- c(1,7,9)
print(v)
v[1]
v[2]
v[3]
v[0]
v
v <- c('Joe',4.5,TRUE)
v
typeof(v)
str(v)

v <- c(1:10)
v
2*v
2*v+1
w <- 20*v
v
w
v+w

#Sequence
w <- seq(0,1,length.out=11)
w
w <- seq(5,100,5)
w

# List
x <- list('Jill', 32, 'IT Specialist')
x
Name <- x[[1]]
Name
x[[2]]
x[[3]]
names(x) <- c('Name', 'Age', 'Job description')
x

x$Name
x$Age
x$`Job description'
