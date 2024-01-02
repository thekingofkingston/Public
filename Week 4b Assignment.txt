# Name: Christopher Kingston
# Date: 02/01/2023
# Assignment 4b

NYSAT <- read.csv(destination_file)
NYSAT
# How many schools have students with average Writing SAT score > 500.
Score <- 500
names(NYSAT)
Index <- which(NYSAT$SAT.Writing.Avg..Score > Score)
Edited.New.Index.500 <- NYSAT$SAT.Math.Avg..Score[Index]
Edited.New.Index.500

# Remove "s" from Index and convert to numerical value
Edited.New.Index.500 <- gsub("s","",Edited.New.Index.500)
Edited.New.Index.500
Edited.New.Index_num <- as.numeric(Edited.New.Index.500)
Edited.New.Index_num
Index.500 <- Edited.New.Index_num
Index.500 <- data.frame(Index.500)
Index.500 <- na.omit(Index.500)
Index.500

# Answer to the number of students with SAT Writing scores above 500 in New York in 2012
Count.Index.500 <- nrow(Index.500)
Count.Index.500
sprintf('The number of students with SAT average writing scores greater than 500 is %f',Count.Index.500)

# Histogram of NYSAT Writing Scores
Edited.WS <- NYSAT$SAT.Writing.Avg..Score
Edited.WS
Edited.WS.1 <- Edited.WS
Edited.WS.1 <- gsub("s","",Edited.WS.1)
Edited.WS.1
Edited.WS.2 <- as.numeric(Edited.WS.1)
Edited.WS.2
Histo.WS <- Edited.WS.2
Histo.WS <- data.frame(Histo.WS)
Histo.WS <- na.omit(Histo.WS)
Histo.WS
list=as.list(Histo.WS)
list
list.histo <- as.numeric(list$Histo.WS)
hist(list.histo,
     col = 'gold',
     border = 'black',
     main = 'Histogram of 2012 New York SAT Writing Exam Scores',
     xlab = 'Exam Score',
     ylab = 'Count')

# Apply Sharipo-Wilk test to 2012  New York SAT Writing Exam Scores
WS.Normal <- shapiro.test(list.histo)
sprintf('The Histogram of students of SAT writing scores is not normal due to the p-value result of the Shapiro-Wilk test below the null')
