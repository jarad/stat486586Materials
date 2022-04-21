library(glmnet)
library(classdata)

str(ames)

X <- model.matrix(SalePrice ~ . - Neighborhood, ames)
X <- X[, -c(1, 2)]
y <- ames$SalePrice
ridge <- glmnet(X, y, alpha=0)
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

