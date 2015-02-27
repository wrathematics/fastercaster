library(fastercaster)

m <- 10000
n <- 1000
x <- runif(m*n)

system.time(as.matrix(x))
system.time(as_matrix(x))

dim(x)

x <- runif(m*n)
system.time(matrix(x, m, n))
system.time(as_matrix(x, m, n))

dim(x)

