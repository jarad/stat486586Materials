library(purrr)

set.seed(1)
alpha <- 0.1
n <- 30
mu0 <- 50
income <- rgamma(n, 10, 1) + 40
hist(income)
ts <- (mean(income) - mu0) / (sd(income) / sqrt(n))
pv <- 2 * pt(abs(ts), df=n-1, lower.tail = FALSE)
pv

pv <= alpha

# size
set.seed(1)
MC <- 500
pvs <- map_dbl(seq_len(MC), function(i) {
  income <- rgamma(n, 10, 1) + 40
  ts <- (mean(income) - mu0) / (sd(income) / sqrt(n))
  pv <- 2 * pt(abs(ts), df=n-1, lower.tail = FALSE)
  pv
})
hist(pvs)
mean(pvs <= alpha)

# power
set.seed(1)
MC <- 500
n <- 50
pvs <- map_dbl(seq_len(MC), function(i) {
  income <- rgamma(n, 10, 1) + 41
  ts <- (mean(income) - mu0) / (sd(income) / sqrt(n))
  pv <- 2 * pt(abs(ts), df=n-1, lower.tail = FALSE)
  pv
})
hist(pvs)
mean(pvs <= alpha)

# sample size calculate

calcPower <- function(n, MC) {
  pvs <- map_dbl(seq_len(MC), function(i) {
    income <- rgamma(n, 10, 1) + 41
    ts <- (mean(income) - mu0) / (sd(income) / sqrt(n))
    pv <- 2 * pt(abs(ts), df=n-1, lower.tail = FALSE)
    pv
  })
  mean(pvs <= alpha)
}
set.seed(1)
calcPower(30, 500)

beta <- 0.8
nVec <- seq(30, 100, by=5)
powerVec <- map_dbl(nVec, calcPower, MC=MC)
nVec[which(powerVec >= beta)[1]]
