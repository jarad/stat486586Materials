dnorm(0)
dnorm(0, 0, 1) # N(0, 1) density at 0
x <- seq(-5, 5, by=0.1)
dnorm(x)
plot(x, dnorm(x), type="l")
lines(x, dnorm(x, mean=1, sd=2), lty=2)

pnorm(1) 
pnorm(1) - pnorm(-1) 
pnorm(1, lower.tail = FALSE)

plot(x, pnorm(x), type="l")

qnorm(0.95)
qnorm(0.05, lower.tail = FALSE)

quantile(cars$speed, 0.95)

rnorm(5)
X <- rnorm(500, 10, 2)
hist(X)
hist(X, freq=FALSE)
xx <- seq(0, 20, length.out=100)
lines(xx, dnorm(xx, 10, 2))

rbinom(3, 2, 0.5)

X <- rbeta(500, 1, 1)
summary(X)

hist(X, freq=FALSE)
x <- seq(0, 1, length.out=100)
lines(x, dbeta(x, 1, 1))

Y <- rbinom(100, 1, 0.6)
mean(Y == 1)

Fn <- ecdf(cars$speed)
class(Fn)
Fn(c(5, 10, 15))
xxx <- seq(0, 30, length.out=100)
plot(xxx, Fn(xxx))

plot(Fn)
methods(class="ecdf")
summary(Fn)

set.seed(1)
runif(3)
rbeta(3, 1, 2)


n <- 10
wait <- rexp(n, rate=0.5)
wait
arrival <- cumsum(wait)
arrival

Fn <- ecdf(arrival)
tVec <- seq(0, 20, length.out=1000)
plot(tVec, Fn(tVec) * n, ylab="# of customers")

# How likely are we going to find the restaurant gets busy and has at least 3 customers within 5 minutes after it opens?

nDays <- 1000
n <- 3

busy <- purrr::map_lgl(seq_len(nDays), function(i) {
  wait <- rexp(n, rate=0.5)
  wait3 <- sum(wait)
  wait3 <= 5
})

summary(busy)
mean(busy)


sample(1:5, 1)
sample(1:5, 5)
sample(1:5, 10) # wrong

sample(1:5, 10, replace=TRUE)

sample(c("H", "T"), 10, replace=TRUE)
sample(c("H", "T"), 10, replace=TRUE, prob=c(0.8, 0.2))
