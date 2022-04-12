library(purrr)

X <- mtcars$qsec
str(X)

mu0 <- 18
n <- length(X)
B <- 2000
T <- function(x) {
  mu0 - mean(x)
}
t0 <- T(X)

centeredX <- X - mu0
TPerm <- map_dbl(seq_len(B), function(b) {
  sign <- sample(c(-1, 1), n, replace=TRUE)
  centeredXPerm <- centeredX * sign
  XPerm <- centeredXPerm + mu0
  T(XPerm)  
})
pv <- mean(TPerm >= t0)
pv


m1 <- lm(wage ~ age, Wage)
summary(m1)


grid <- seq(min(Wage$age), max(Wage$age), length.out=100)
plot(Wage$age, Wage$wage)
abline(m1, col="blue")

m4 <- lm(wage ~ poly(age, 4), Wage)

yhat4 <- predict(m4, 
                 newdata=data.frame(age=grid),
                 se.fit=TRUE)
str(yhat4)
lines(grid, yhat4$fit, col="red", lwd=2)
lines(grid, yhat4$fit - 2 * yhat4$se.fit, lty=2, lwd=2, col="red")
lines(grid, yhat4$fit + 2 * yhat4$se.fit, lty=2, lwd=2, col="red")

m4year <- lm(wage ~ poly(age, 4) + year, Wage)
summary(m4year)


# Your turn
m3edu <- lm(wage ~ poly(age, 3) + education, Wage)
summary(m3edu)
table(Wage$education)

yhat3edu <- predict(m3edu, 
                    newdata = data.frame(age = grid,
                                         education = "1. < HS Grad"),
                    se.fit = TRUE)
plot(Wage$age, Wage$wage, pch=".")
lines(grid, yhat3edu$fit, col="red")
