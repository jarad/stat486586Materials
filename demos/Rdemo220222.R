x <- 1:5
y <- c(100, 1000)
z <- c(-1, 1, 3)
w <- c(1, 3, NA, 5)

standardize <- function(x) {
  (x - mean(x)) / sd(x) 
}


standardize <- function(x, na.rm=FALSE) {
  (x - mean(x, na.rm=na.rm)) / sd(x, na.rm=na.rm)
}

standardize(x)
standardize(w)
standardize(w, na.rm=TRUE)


standardize <- function(x, na.rm=FALSE) {
  m <- mean(x, na.rm=na.rm)
  s <- sd(x, na.rm=na.rm)
  standardized <- (x - m) / s
  
  list(standardized = standardized,
       mean = m,
       sd = s
    )
}

standardize(x)$standardized


myMean <- function(x) {
  sum(x) / length(x)
}
myMean

a <- c(1, 3, 4) 
b <- c(1, 3, 4, 5)
myMean(a)
mean(a)
myMean(b)
mean(b)


myMean <- function(x, na.rm=FALSE) {
  if (na.rm) {
    x <- x[!is.na(x)]
  }
  sum(x) / length(x)
}
myMean(a)
myMean(c(NA, a))
myMean(c(NA, a), na.rm=TRUE)
mean(c(NA, a), na.rm=TRUE)


estLocation <- function(x, method, na.rm=FALSE, trim=0) {
  
  # deal with NA
  if (na.rm) {
    x <- x[!is.na(x)]
  }
  
  # Perform the calculation
  if (method == "mean") {
    # implement the mean method
    res <- myMean(x)
  } else if (method == "median") {
    # implement the median method 
    res <- median(x)
  } else if (method == "trimmed mean") {
    # implement the trimmed mean method 
    res <- myTrimmedMean(x, trim=trim)
  }
  
  # Output: location estimate. A scalar
  res
}

myTrimmedMean <- function(x, trim) {
  
  # trim out some observations
  
  # take the average
}

trim <- 0.1
x <- c(1:10, 100)

# trim out obs
thresh <- quantile(x, c(trim /2 , 1 - trim / 2))
xTrimmed <- x[x >= thresh[1] & x <= thresh[2]]

# average
sum(xTrimmed) / length(xTrimmed)


myTrimmedMean <- function(x, trim) {
  # trim out obs
  thresh <- quantile(x, c(trim /2 , 1 - trim / 2))
  xTrimmed <- x[x >= thresh[1] & x <= thresh[2]]
  
  # average
  sum(xTrimmed) / length(xTrimmed)
}

myTrimmedMean(x, 0.3)

estLocation(x, "mean")
mean(x)

estLocation(x, "median")
median(x)

estLocation(x, "trimmed mean")
estLocation(x, "trimmed mean", trim=0.1)
mean(x, trim=0.1)


library(testthat)

x <- 1:3
expect_equal(myMean(x), 2)

y <- seq(-100, 100, by=0.1)
myMean(y) == 0 
expect_equal(myMean(y), 0)
expect_equal(myMean(y), 0, tolerance = 1e-16)
expect_equal(myMean(y), 0, tolerance = 1e-10)

rm(x)
rm(y)
test_that("myMean works", {
  x <- 1:3
  y <- seq(-100, 100, by=0.1)
  expect_equal(myMean(x), mean(x))
  expect_equal(myMean(y), mean(y))
})
