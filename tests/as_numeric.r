library(fastercaster)

n <- 1e2

x <- factor(sample(1:3, size=n, replace=TRUE))
all.equal(as_numeric(x), as.numeric(as.character(x)))
all.equal(as_numeric(x, by.level=FALSE), as.numeric(x))


x <- factor(sample(rnorm(10), size=n, replace=TRUE))
all.equal(as_numeric(x), as.numeric(as.character(x)))
all.equal(as_numeric(x, by.level=FALSE), as.numeric(x))
