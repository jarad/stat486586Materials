1 + 1
1 + 2 * 3
2 ^ 3
5 / 2
5 %/% 2
5 %% 2

2 * 3 ^ 2 
?Syntax
2 * (3 ^ 2)
(2 * 3) ^ 2

x <- 1:3
x == 2
x
identical(x, 2)
identical(x, 1:3)

x != 2
x > 2
x <= 2

fruit <- c("apple", "pear", "orange", "pineapple")
bought <- c("apple", "orange", "milk")
bought
fruit
bought %in% fruit # %in% different  in

a <- rep(1, 4)
b <- 1:4
a
b
a + b
a + 1

a + c(1, 2)
a + rep(c(1, 2), 2)
a + c(1, 2, 3)
a


## Indexing

x <- month.abb
x
x[1]
x[0] # wrong
x[c(6, 7, 8)]
x[c(6, 6, 7, 8)]

x[6:8] <- "summer"
x

x[-1]
x[-(6:8)]

pets <- c(cat = 10, dog = 15, lizard = 2)
pets 
str(pets)
pets[c(1, 2)]
pets[c("cat", "dog")]

x <- 1:3
x[c(TRUE, FALSE, TRUE)]
x[c(TRUE, FALSE)] # bad practice. Length must match

x > 2
x[x > 2]

month.abb
month.abb == "Jun"
month.abb[month.abb == "Jun"]

logiVec <- month.abb == "Jun"
logiVec
which(logiVec)

month.abb[which(logiVec) + 2]


## indexing data frames
library(classdata)
str(cities)
cities$City
cities$Population[1:30]
cities$Population[cities$Year == 2006]

cities[1:5, 1:2]
cities[1:5, c("City", "Population")]
cities[cities$Year == 2006, c("City", "Population")]

a <- cities[, "Population"]
str(a)
b <- cities[, "Population", drop=FALSE]
str(b)

cities[1, ]
cities[1:5, ]


## Math functions
b <- 1:4
sqrt(b)
b ^ (1 / 2)

d <- seq(-0.5, 1.5, length.out=7)
d
abs(d)

d
ceiling(d)
floor(d)
round(d)
?trunc
round(d, 2)

log(10)
log10(10)
exp(1)
exp(c(0, 1))

x <- seq(0, 2 * pi, length.out=100)
plot(x, sin(x))

e <- 1:4
f <- 4:1
pmin(e, f)
pmax(e, f)

max(e, f)


g <- c(1, -3, 1, 4, 1)
cumsum(g)
cumprod(g)

cummax(g)
cummin(g)

h <- cumsum(g)
diff(h)
?diff

diff(h, lag = 2)
diff(h, differences = 2)
diff(diff(h))

# stat functions
b
sum(b)
mean(b)
min(b)
max(b)
sd(b)
var(b)
range(b)
c(min(x), max(x))

quantile(b, c(0.25, 0.75))
quantile(b, seq(0, 1, by=0.1))

cov(1:4, 4:1)
cor(1:4, 4:1)
