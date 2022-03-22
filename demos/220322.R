library(stringr)

str_sub("hello", 1, 3)
str_sub(c("hello", "world"), 1, 3)
str_sub("hello", 1, -2)

getf <- function(a) {
  ### Force evaluate a
  force(a)
  
  function(x) {
    ### Apply to vector x
    map_dbl(x, function(x) {
      ### Create polynomial
      do.call(
        sum,
        ### Create summand
        imap(a, function(a, i) {
          a * x^(i - 1)
        })
      )
    })
  }
}

library(purrr)
a <- c(0, 1)
f <- function(x) x
g1 <- getf(f(a))
a <- c(0, 2)
g1(1)


getf_noforce <- function(a) {
  
  function(x) {
    ### Apply to vector x
    map_dbl(x, function(x) {
      ### Create polynomial
      do.call(
        sum,
        ### Create summand
        imap(a, function(a, i) {
          a * x^(i - 1)
        })
      )
    })
  }
}

library(purrr)
a <- c(0, 1)
f <- function(x) x
g1 <- getf_noforce(f(a))
a <- c(0, 2)
g1(1)



X <- cars$speed

### Step 0
x <- 0
k <- 1
tol <- 1e-5
Kmax <- 1000

g.prime <- function(x, X){
  mean(2 * (x - X))
}

### Step 1 + 2
while ((abs(g.prime(x, X)) >= tol) && (k <= Kmax)) {
  x <- x - 0.99^k * g.prime(x, X)
  k <- k + 1
}

### Output
x



x <- c("Shaw, Jacob", "Jacobi, Neal", "Pearl, Jacob")
str_view_all(x, "Jacob$")
str_view_all(x, ".")
str_view_all(x, "e?a")
str_view_all(x, "e+a")
str_view_all(x, "e*a")


l <- list(1:3, "hello", c(TRUE, FALSE))
l

l[2]
l[[2]]
str(l[[2]])
str(l[2])

l[[c(1, 2)]]
l[c(1, 2)]

library(repurrrsive)

got_chars

char1 <- got_chars[[1]]
char1_1 <- got_chars[1]
summary(char1_1)

char1
length(char1)
map(char1, function(x) str_sub(x, 1, 5))


# difference between map and for

x <- 0
for (j in 1:3) {
  x <- x + j
  print(x)
}

x <- 0
map(1:3, function(j) {
  x <- x + j
  print(x)
})
