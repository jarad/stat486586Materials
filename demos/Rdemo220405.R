library(purrr)

simWiener <- function(n, nStep) {
  t <- seq(0, 1, length.out=nStep + 1)
  Delta <- t[2] - t[1]
  W <- map(seq_len(n), function(i) {
    jumps <- rnorm(nStep, 0, sd=sqrt(Delta))
    traj <- cumsum(c(0, jumps))
    traj
  })
  W <- do.call(rbind, W)
  list(t=t, W=W)
}

simBB <- function(n, nStep) {    
  wiener <- simWiener(n, nStep)
  B <- wiener$W - 
    matrix(wiener$t, n, nStep + 1, byrow=TRUE) *
    matrix(wiener$W[, nStep + 1], n, nStep + 1)
  list(t=wiener$t, B=B)
}

X <- iris$Sepal.Length
hist(X)
Fn <- ecdf(X)
grid <- seq(min(X), max(X), length.out=100)
Fx <- pnorm(grid, mean(X), sd(X))
plot(Fn)
lines(grid, Fx, lty=2)
# observed test stat
dn <- sqrt(length(X)) * max(abs(Fn(grid) - Fx))

# null distribution
BB <- simBB(500, 1000)
str(BB)

D <- map_dbl(seq_len(nrow(BB$B)), function(i) {
  max(abs(BB$B[i, ]))  
})
hist(D)

pv <- mean(D >= dn)
pv <= 0.05 # no reject

?ks.test
ks.test(X, "pnorm", mean=mean(X), sd=sd(X))

str(BB)
save(BB, file="res.RData")
rm(BB)
load("res.RData")

# bootstrap
X <- mtcars$qsec
median(X)

n <- length(X)
B <- 2000
Tnstar <- map_dbl(seq_len(B), function(i) {
  Xstar <- sample(X, n, replace=TRUE)
  median(Xstar)
})
hist(Tnstar, main="bootstrap distribution")
# calc stand error
sd(Tnstar)
sqrt(mean((Tnstar - mean(Tnstar))^2))

T <- mean
Tnstar <- map_dbl(seq_len(B), function(i) {
  Xstar <- sample(X, n, replace=TRUE)
  T(Xstar)
})
sqrt(mean((Tnstar - mean(Tnstar))^2))

sd(X) / sqrt(length(X))
