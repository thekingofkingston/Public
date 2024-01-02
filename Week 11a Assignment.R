# Name: Christopher Kingston
# Date: 04/08/2023
# Assignment 11a

#Install Tidyverse

install.packages('tidyverse')
library(tidyverse)

March2023 <- as.Date('2023-03-01') + 0:30
rpois(10,50)

Inventory <- tibble(
  Date = March2023,
  Product_A = rpois(31,50),
  Product_B = rpois(31,100),
  Product_C = rpois(31,250)
)
View(Inventory)

# tidy up the data

Inventory.tidy <- gather(data = Inventory,
       key = Product,
       value = Count,
       Product_A, Product_B,Product_C)
View(Inventory.tidy)

Inventory %>%
  gather(key = Product,
          value = Count,
          Product_A : Product_C,
         -Date)

# Min and Max of Tidy

Inventory.tidy %>%
  group_by(Product) %>%
  summarise(min(Count), max(Count))

#Spread Tidy

Inventory.tidy %>%
spread(key = Product,
       value = Count)  

# Use a Tribble

x1 <- tribble(
  ~code, ~count, ~cost, ~warehouse,
  '1',50,10.20,'B',
  '4',25,17.25,'A'
)

x2 <- tribble(
  ~code, ~count, ~cost, ~warehouse,
  '1',600,11.50,'C',
  '3',40,37.65,'A',
  '4',120,17,'D'
)

x3 <- tribble(
  ~code, ~count, ~cost, ~warehouse,
  '2',700,125,'C',
  '3',15,40.00,'A'
)

View(x1)

warehouse <- tribble(
  ~warehouse, ~location, ~manager,
  'A','Costco 1 - Los Angeless', 2,
  'B', 'Costco 7- Los Angeles', 1,
  'C', 'Costco 9 - Anaheim', 2,
  'D', 'Costco 3 - Tustin', 3,
  'E', 'Costco 82 - Santa Ana', 2
)

manager <- tribble(
  ~manager, ~name,
  1, 'John Diaz',
  2, 'Marcia Lee',
  3, 'David Kinn'
)

View(x1)

# Joins like SQL

x1 %>%
  inner_join(warehouse, by = 'warehouse') %>%
  inner_join(manager, by = 'manager')

library(stringr)

# String can be written in singoe or double quotation marks

s1 <- 'A string'
s2 <- "A string"
cat(s1)
s1
s <- 'He said, "How are you?"'
cat(s)

# Special characters ing strings
s <- 'Special characters: \\ \"'
cat(s)

s <- '\u00b5'
cat(s)

s <- 'The house'
length(s)
str_length(s)
cat(s,'has length', str_length(s))

s1 <- 'the'
s2 <- 'house'
cat(s1,s2)
str_c(s1,s2,sep='-')
str_c(s1,s2,'is','red',sep='-')

greeting <- 'Good morning'
reminder1 <- 'You have a meeting in room 6A'
reminder2 <- 'You have a meeting in room 9H'

{
name <- 'Carly'
job_code <- 232
}

str_c(greeting, ' ',name,'.',
      if (job_code>200 & job_code<300) reminder1,
      if (job_code>=300 & job_code<400) reminder2)

x <- c('Jacob lina',
       'adeline mila',
       'barbara linage',
       'barb'
       )
y <- 'abcdefghi'

str_sub(y,1,3)
y %>% str_sub(1,3)
y %>% str_sub(-3,-1)
str_to_upper(y)
str_to_lower(y)
str_sort(x)

x %>% str_to_title %>% str_sort

# Pattern Matching

x
str_view(x,'lin')
str_view_all(x,'lin')

str_view(x,'li.')
str_view(x,'li*')

# anchors (search end) & (search start)
str_view(x,'a$')
str_view(x,'^a')

x3 <- c('dhernandez', 'hjub39', 'klee88', 'ttran43', 'knance385', 'bmont123')

# search digits 'numbers'
str_view_all(x3,'\\d')
# search specific numbers like 4 &/or 8
str_view(x3,'[48]')
