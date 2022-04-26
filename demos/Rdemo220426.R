library(glmnet)
library(classdata)

str(ames)

X <- model.matrix(SalePrice ~ . - Neighborhood, ames)
X <- X[, -c(1, 2)]
y <- ames$SalePrice
ridge <- glmnet(X, y, alpha=0) # X should not contain the intercept column
beta <- coef(ridge) # 12 rows, 100 col
dim(beta)
ridge$lambda[59]
beta[, 59]

matplot(log(ridge$lambda), t(beta[-1, ]), type="l", lwd=2)
legend("topright", rownames(beta)[-1], 
       col=1:6, lty=1:5, lwd=2)

lambda1 <- 50000
beta1 <- predict(ridge, s=lambda1, type="coefficients")[, 1]
resp <- predict(ridge, newx=X, s=lambda1, type="response")

# set aside a test set to estimate the prediction error
set.seed(123)
n <- nrow(X)
testInd <- sample(n, round(n/2), replace=FALSE)
trainInd <- setdiff(seq_len(n), testInd)

ridgeTrain <- glmnet(X[trainInd, ], y[trainInd], alpha=0)
yPredTest <- predict(ridgeTrain, newx=X[testInd, ], type="response")
str(yPredTest)
testMSE <- colMeans((yPredTest - y[testInd])^2)
plot(log(ridgeTrain$lambda), testMSE, type="l")

# CV
ridgeCV <- cv.glmnet(X[trainInd, ], y[trainInd], alpha=0)
str(ridgeCV)
plot(ridgeCV)
lambda2 <- ridgeCV$lambda.min
lambda3 <- ridgeCV$lambda.1se
yPredTest <- predict(ridgeCV, newx = X[testInd, ], 
        s = c(lambda2, lambda3), type="response")
str(yPredTest)

testMSERidge <- colMeans((yPredTest - y[testInd])^2)

# The lasso
lassoCV <- cv.glmnet(X[trainInd, ], y[trainInd], alpha=1)
plot(lassoCV)
lambda4 <- lassoCV$lambda.min
lambda5 <- lassoCV$lambda.1se
betaMin <- predict(lassoCV, s="lambda.min",
                   type="coefficients")
beta1se <- predict(lassoCV, s="lambda.1se",
                   type="coefficients")
yPredTest <- predict(lassoCV, newx=X[testInd, ], 
                     s=c(lambda4, lambda5),
                     type="response")
testMSELasso <- colMeans((yPredTest - y[testInd])^2)
testMSELasso
testMSERidge

betaAll <- predict(lassoCV$glmnet.fit, type="coefficients")
matplot(log(lassoCV$lambda), t(betaAll[-1, ]), type="l", lwd=2)
legend("bottomright", rownames(beta)[-1], col=1:6, lty=1:5)




# KNN
library(ISLR2)
library(class)
library(purrr)
dat <- Default
n <- nrow(dat)
testInd <- sample(n, round(n / 2), replace=FALSE)
trainInd <- setdiff(seq_len(n), testInd)

X <- model.matrix(default ~ ., dat)[, -1, drop=FALSE]
# Standardize the continuous variables to make them on the same scale
X[, c("balance", "income")] <- 
  apply(X[, c("balance", "income")], 2, scale)
y <- dat$default

# Select K
candidate <- seq(1, 100, by=5)
cvErr <- map_dbl(candidate, function(K) {
  YHatKNNCV <- knn.cv(X[trainInd, ], y[trainInd], k=K)
  mean(YHatKNNCV != y[trainInd])
})
plot(candidate, cvErr)
KChosen <- candidate[which.min(cvErr)]

YHatKNN <- knn(X[trainInd, ], X[testInd, ], 
               y[trainInd], k=KChosen)

# Confusion matrix
table(YHatKNN, truth=y[testInd])

# Misclassification rate:
mean(YHatKNN != y[testInd])

