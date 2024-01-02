data()
?Nile
N <- Nile
N

N.sorted <- sort(N)
N.sorted
summary(N)
N.mean = mean(N)
N.mean
N.std = sd(N)
N.std

{
  msg1 <- sprintf('Nile River Flow Mean: %f', N.mean)
  msg2 <- sprintf('Nile River Flow Standard Deviation: %f', N.std)
  cat(msg1,'\n',msg2)
}


N.left = N.mean - 2*N.std
N.right = N.mean + 2*N.std
sprintf('N_left = %.1f and N_right = %.1f', N.left, N.right)
N.sorted
y <- which(N.sorted > N.right)
y
z <- which(N.sorted < N.left)
z
N.sorted[y]
N.sorted[z]

Outlier1 <- list(N.sorted[y])
Outlier1
Outlier2 <- list(N.sorted[z])
Outlier2
N.Outliers <- c(Outlier1,Outlier2)
N.Outliers

{
  msg3 <- sprintf('Possible Nile River Flow Outliers Exceeding Two Standard Deviations of the Mean:')
  msg4 <- N.Outliers
  print(paste(msg3,msg4))
}
