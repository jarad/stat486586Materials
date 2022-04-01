library(purrr)

# X_1, \dots, X_10 follow an exponential distribution
mu <- 1
n <- 10
X <- rexp(n, rate=1 / mu)
hist(X)
mean(X)

MC <- 500
set.seed(1)
means <- map_dbl(seq_len(MC), function(i) {
  X <- rexp(n, rate=1 / mu)
  mean(X)
})
str(means)
hist(means, main="sampling distribution of XBar")

nVec <- c(10, 100, 1000, 10000)

walk(nVec, function(n) {
  means <- map_dbl(seq_len(MC), function(i) {
    X <- rexp(n, rate=1 / mu)
    mean(X)
  })
  hist(means, 
       main=stringr::str_c("sampling distribution of XBar", 
                           ", n = ", n))
})


par(mfcol = c(2, length(nVec)))
walk(nVec, function(n) {
  means <- map_dbl(seq_len(MC), function(i) {
    X <- rexp(n, rate=1 / mu)
    mean(X)
  })
  
  # LLN
  hist(means, xlim=c(0, 5))
  abline(v=mu)
  
  # CLT
  hist(sqrt(n) * (means - mu), xlim=c(-4, 4), 
       freq=FALSE)
})
par(mfcol=c(1, 1))


# Your turn
n <- 10

X <- rnorm(n)
s2 <- var(X)

MC <- 500
variances <- map_dbl(seq_len(MC), function(i) {
  X <- rnorm(n)
  s2 <- var(X)
  s2
})
hist(variances)

nVec <- c(10, 100, 1000, 10000)

walk(nVec, function(n) {
  variances <- map_dbl(seq_len(MC), function(i) {
    X <- rnorm(n)
    s2 <- var(X)
    s2
  })
  hist(variances)
})

# Simulate a Brownian motion on [0, 1]
nStep <- 1000

t <- seq(0, 1, length.out=nStep + 1)
head(t)
Delta <- t[2] - t[1]
jumps <- rnorm(nStep, 0, sd=sqrt(Delta))
traj <- cumsum(c(0, jumps))
plot(t, traj, type="l")


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

wiener <- simWiener(5, 50)
matplot(wiener$t, t(wiener$W), type="l")

n
nStep

simBB <- function(n, nStep) {
  wiener <- simWiener(n, nStep)
  B <- wiener$W - 
    matrix(wiener$t, n, nStep + 1, byrow=TRUE) *
    matrix(wiener$W[, nStep + 1], n, nStep + 1)
  # matplot(wiener$t, t(B), type = "l")
  list(t=wiener$t, B=B)
}
BB <- simBB(n, nStep)
str(BB)
matplot(BB$t, t(BB$B[1:5, ]), type="l")
