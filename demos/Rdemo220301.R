
x <- list(3, 5, 6)
map(x, f) # same as list(f(x[[2]]), f(x[[2]]), f(x[[3]]))
do.call(f, x) # same as f(x[[1]], x[[2]], x[[3]])

# infix functions
1 + 2 # infix form
`+`
`+`(1, 2) # prefix form

`[[`
y <- list(1, 2)
y[[1]]
`[[`(y, 1)

?`[[`

M <- matrix(1:6, 2, 3)
M[1, 2]
`[`(M, 1, 2)

x <- list(c(1, 2, 3, 10), 2:3)
x
library(purrr)
map(x, `+`, 1)

map(x, `+`, 1:2)

map(x, `[[`, 2)
map(x, 2) # shorthand

l <- list(
  list(male =10, female = 15),
  list(male = 13, female = 10)
)
l

x
x[[2]]
x[2]

a <- map(l, `[[`, 2)
b <- map(l, `[`, 2)
str(a)
str(b)

map(l, `[[`, "female")

walk(1:2, plot) # no output

imap(6:8, function(x, i) {
  x + i 
})

imap(iris[1:4], function(x, i) {
  stringr::str_c(i, " has mean ", mean(x))
})

map2(6:8, 1:3, function(x, y) {
  x + y
})

trim <- c(0.3, 0)
map2(x, trim, function(v, trim) mean(v, trim=trim))
# list(mean(x[[1]], trim[1]), mean(x[[2]], trim[2]))

l <- list(
  c(1, 3, 5),
  c(4, 6, 8),
  c(1, 1, 2)
)
pmap(l, function(a, b, c) seq(a, b, by=c))
pmap(l, seq) # if l is unnamed, argument matching is by location

dat <- data.frame(
  from = c(1, 3, 5),
  to = c(4, 6, 8),
  length.out = c(1, 1, 2)
)
dat
pmap(dat, seq) # if dat is named, seq will match arugments by name, not by location


l <- list(c(1, 3, 5, 100),
          c(NA, 3, 5, 100),
          c(NA, 1:10, 100))

map(l, `+`, 1:3) # not right

imap(l, `+`)
imap(l, function(x, i) {
  x + i
})
map2(l, 1:3, `+`)
pmap(list(l, 1:3), `+`)

seq_along(l)
map(seq_along(l), function(i) {
  l[[i]] + i
})

sLenBySpecies <- split(iris$Sepal.Length, iris$Species)
str(sLenBySpecies)

map_dbl(sLenBySpecies, mean)
summary(sLenBySpecies[[1]])
map(sLenBySpecies, summary)

irisBySpecies <- split(iris[1:4], iris$Species)
map(irisBySpecies, summary)

b <- map(irisBySpecies, function(dat) {
  map_dbl(dat, median)
})
b
str(b)
do.call(rbind, b)

l <- list(IA = c(2, 1), NE = c(1.5, 1), IL=c(5, 2))
reduce(l, `+`) # (c(2, 1) + c(1.5, 1)) + c(5, 2)

reduce(l, `+`, .init=c(0, -1))

accumulate(l, `+`)


x <- c(-2, 0, 2)

map_dbl(x, function(xx) {
  if (xx > 0) {
    return(1)
  } else if (xx == 0) {
    return(0)
  } else if (xx < 0) {
    return(-1)
  }
})
