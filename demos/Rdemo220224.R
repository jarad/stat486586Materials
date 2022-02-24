mymean <- function(x, na.rm=FALSE) {
  ...
  }

mymean(x) # same as mymean(x, na.rm=FALSE)
mymean(x, na.rm=TRUE)

f <- function(x) {
  x[1] <- NA
  x
}

x <- 1:3
y <- f(x)
x



files <- c("1.csv", "2.csv", "3.csv")
x <- purrr::map(files, read.csv)
str(x)

library(purrr)
x <- list(
  c(1, 2, 3, 10),
  2:3
  )

map(x, mean)
list(mean(x[[1]]), mean(x[[2]])) # same 

standardize <- function(v) {
  (v - mean(v)) / sd(v)
}
map(x, standardize)

map(x, function(v) (v - mean(v)) / sd(v))

function(v) (v - mean(v)) / sd(v) # anonymous function

map(x, function(v) {
    v <- v^2
    (v - mean(v)) / sd(v)
  })

str(iris)

y <- map(iris[, 1:4], mean)
str(y)
unlist(y)

z <- map_dbl(iris[, 1:4], mean)
str(z)

map_int(iris[, 1:4], mean) # won't work

map_int(iris[, 1:4], which.max)
which.max(iris[, 1])

# find the mode of a vector
findMode <- function(x) {
  tab <- table(x)
  names(which.max(tab))
}

x <- iris[[1]]
findMode(x)

map(iris, findMode)
map_chr(iris, findMode)

x <- list(1:2, 1:3)
summary(x[[1]])
map_dbl(x, summary)

y <- map(x, summary)

cbind(y[[1]], y[[2]])

do.call(cbind, y)
# same as 
cbind(y[[1]], y[[2]])

do.call(c, y)
c(y[[1]], y[[2]])

y <- list(c(NA, 1:5),
          c(NA, 2:3))
y
map(y, mean, na.rm=TRUE)
map_dbl(y, mean, na.rm=TRUE)

l <- list(c(1, 3, 5, 100),
          c(NA, 3, 5, 100),
          c(NA, 1:10, 100))

map(l, sum)
map_dbl(l, sum)
map_dbl(l, sum, na.rm=TRUE)

map_dbl(l, function(x) sum(x, na.rm=TRUE))

x <- list(c(1:10, 100),
          2:5)

map(x, function(xx) {
    map_dbl(c(0, 0.3), function(trim) mean(xx, trim=trim))
  })
