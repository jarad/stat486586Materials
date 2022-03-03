x <- 1

exists("x")

rm(x)
exists("x")

f2 <- function() {
  if (!exists("a")) {
    a <- 1
  } else {
    a <- a + 1
  }
  a
}
f2()
f2()


library(purrr)
power <- 2
map_dbl(1:3, function(x) x ^ power)

times <- 1
f3 <- function() rep(0, times)
g <- function() {
  times <- 2
  f3()
}
g() # lexical scoping. Search for variable in the environment where a function is defined, not where it is called.


x <- 0
f1_2 <- function() {
  browser()
  x <- 1
  g <- function() {
    y <- 2
    c(x, y)
  }
  g()
}
f1_2()

f1_2_1 <- function() {
  x <- 1
  g <- function() {
    y <- 2
    c(x, y)
  }
  g
}
g1 <- f1_2_1()
g1()

plus <- function(x) {
  function(y) x + y
}
plus_one <- plus(1)
plus_one
plus_one(1:5)

stop()
stop("an error here")

h <- function(x) {
  10
}
h(stop("an error here"))


h1 <- function(x) {
  x
  10
}
h1(stop("an error here"))
