library(purrr)
lsat <- c(576,  635,  558,  578,  666,  580,  555,  661,  651,  605,  653,  575,  545,  572,  594)
gpa  <- c(3.39, 3.30, 2.81, 3.03, 3.44, 3.07, 3.00, 3.43, 3.36, 3.13, 3.12, 2.74, 2.76, 2.88, 2.96)

plot(lsat, gpa)

B <- 1000
n <- length(lsat)
t0 <- cor(lsat, gpa)

set.seed(1)
TStar <- map_dbl(seq_len(B), function(b) {
  ind <- sample(seq_len(n), n, replace=TRUE)
  XStar <- lsat[ind]
  YStar <- gpa[ind]
  cor(XStar, YStar)
})
hist(TStar)

# normal method
alpha <- 0.05
t0 - qnorm(alpha / 2, lower.tail = FALSE) * sd(TStar)
t0 + qnorm(alpha / 2, lower.tail = FALSE) * sd(TStar)

# pivotal method
2 * t0 - quantile(TStar, c(1 - alpha / 2, alpha / 2))

# percentile method
quantile(TStar, c(alpha / 2, 1 - alpha / 2))


X <- iris$Sepal.Length[iris$Species == "setosa"]
Y <- iris$Sepal.Length[iris$Species == "versicolor"]

n <- length(X)
m <- length(Y)
B <- 1000

TFunc <- function(X, Y) {
  mean(X) - mean(Y)
}
t0 <- TFunc(X, Y)

TStar <- map_dbl(seq_len(B), function(b) {
  # form bootstrap 2-sample
  XStar <- sample(X, n, replace=TRUE)
  YStar <- sample(Y, m, replace=TRUE)
  # calculate bootstrap stat
  TFunc(XStar, YStar)
})
hist(TStar)
sd(TStar) * sqrt((n -1) / n)
