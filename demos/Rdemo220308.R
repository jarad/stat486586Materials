f <- function() {
  print("hello world")
}

f()

g <- function() {
  f()
}

g()


double <- function(x) { 
  message("Calculating...")
  x * 2
}
h2 <- function(x) {
  c(x, x)
}
h2(double(20))


tripple <- function(x)  x * 3
h3 <- function(x) {
  y <- 100
  x
}
y <- 1
h3(tripple(y))


h4 <- function(x = 2 * y, y) {
  c(x, y)
}
h4(y=1)


library(classdata)
x <- "classdata"
library(x)
library(x, character.only = TRUE)


myX <- 1:10
plot(myX, sin(myX))

power1 <- function(exp) {
  function(x) {
    x ^ exp
  }
}
square <- power1(2)
class(square)

square(1:3)

cube <- power1(3)
cube(1:3)

# Integrate
integrate(function(x) x^3, 0, 1)
integrate(cube, 0, 1)
integrate(power1(4), 0, 1)

?optimize
quad <- power1(4)
optimize(quad, c(-100, 100))

optimize(function(x) x^2 - 2 * x + 1, c(-100, 100))

getg <- function(X) {
  function(x) {
    mean((x - X)^2)
  }
}
g1 <- getg(c(-1, 0, 1))
g1
g1(0)
2/3
testthat::expect_equal(g1(0), 2/3)

g2 <- getg(cars$speed)
g2
g2(15)
g2(30)

res <- optimize(g2, c(-100, 100))
res$minimum
mean(cars$speed)

power1 <- function(exp) {
  function(x) {
    x ^ exp
  }
}

a <- 1
linear <- power1(a)
a <- 2
linear(3)

power2 <- function(exp) {
  force(exp)
  function(x) {
    x ^ exp
  }
}
a <- 1
linear <- power2(a)
a <- 2
linear(3)


getl <- function(X) {
  force(X)
  
  n <- length(X)
  function(lam) {
    n * log(lam) - lam * sum(X)
  }
}

lCars <- getl(cars$speed)
lCars(0.5)

optimize(lCars, c(0, 100), maximum=TRUE)

1 / mean(cars$speed)
