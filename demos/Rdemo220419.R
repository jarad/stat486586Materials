library(ISLR2)
library(purrr)
qVec <- 1:10
dat <- Wage[1:200, ]
n <- nrow(dat)

# LOOCV 
MSEi <- map_dfr(seq_len(n), function(i) {
  datTest <- dat[i, ]
  datTrain <- dat[-i, ]
  
  res <- map_dbl(qVec, function(q) {
    m <- lm(wage ~ poly(age, q), datTrain)
    err <- datTest$wage - predict(m, datTest)
    mean(err^2)
  })
  setNames(res, qVec)
})
MSECV <- colMeans(MSEi)
MSECV
plot(qVec, MSECV, type="b")

qSelect <- qVec[which.min(MSECV)]
finalModel <- lm(wage ~ poly(age, qSelect), dat)

grid <- seq(min(Wage$age), max(Wage$age), length.out=100)
yhat <- predict(finalModel, 
                newdata=data.frame(age=grid))
plot(dat$age, dat$wage)
lines(grid, yhat, col="red")


# 
library(boot)
# install.packages("boot")
q <- 2
m <- glm(wage ~ poly(age, q), dat, 
         family = "gaussian")
res <- cv.glm(dat, m) # LOOCV by default
str(res)
res$delta[1] # LOOCV error

cv.glm(dat, m, K=5) # 5 fold CV

err5Fold <- map_dbl(qVec, function(q) {
  m <- glm(wage ~ poly(age, q), dat, family="gaussian")
  res <- cv.glm(dat, m, K=5)
  res$delta[1] #CV error
})
err5Fold
plot(qVec, err5Fold, type="o")
