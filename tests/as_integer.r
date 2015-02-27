library(fastercaster)

n <- 1e2

x <- factor(sample(1:3, size=n, replace=TRUE))
all.equal(as_integer(x), as.integer(as.character(x)))
all.equal(as_integer(x, by.level=FALSE), as.integer(x))


x <- factor(sample(rnorm(10), size=n, replace=TRUE))
all.equal(as_integer(x), as.integer(as.character(x)))
all.equal(as_integer(x, by.level=FALSE), as.integer(x))

