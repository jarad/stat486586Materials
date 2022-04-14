cubic <- function(x, xi) {
  pmax((x - xi)^3, 0)
}
library(ISLR2)
mSpl0 <- lm(wage ~ age + I(age^2) + I(age^3) +
              cubic(age, 25) + cubic(age, 40) + 
              cubic(age, 60), data=Wage)
summary(mSpl0)
grid <- seq(min(Wage$age), max(Wage$age), length.out=100)
yhatSpl0 <- predict(mSpl0, newdata=list(age=grid))
plot(Wage$age, Wage$wage)
lines(grid, yhatSpl0, col="red", lwd=2)

library(splines)
mSpl <- lm(wage ~ bs(age, knots=c(25, 40, 60)), data=Wage)
summary(mSpl)
