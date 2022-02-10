x <- 1:6
x1 <- matrix(x, 3, 2)
x1

rowMeans(x1)
colMeans(x1)
x1[rowMeans(x1) > 4, ]

x1 + 1
x1 + 1:3 # add 1:3 to each column
x1 + 1:2

x1 + matrix(1:2, nrow=nrow(x1), ncol=ncol(x1), byrow=TRUE)

# matrix multiplication
z <- matrix(1:9, 3, 3)
z
dim(z)
dim(x1)

z %*% x1 # matrix multiplication
z * x1 # elementwise multiplication

z %*% x1[, 1, drop=FALSE]
t(x1) %*% x1

v1 <- matrix(1:3)
v2 <- matrix(1:3, 1, 3)
v1 %*% v2
v2 %*% v1

z[1, ] %*% z
z[1, , drop=FALSE] %*% z # rigorous
z[, 1] %*% z[1, ] # not what you want
z[, 1, drop=FALSE] %*% z[1, , drop=FALSE] # what you want

A <- t(x1) %*% x1
solve(A)
solve(A) %*% A 
A^(-1)

det(A)
eigen(A)
kappa(A)
z
solve(z)
kappa(z)

# your turn
x <- c(2, 4, 6)
diag(x, length(x))

A <- matrix(5:10, 2, 3)
2 * A
A * A
t(A) %*% A
A %*% t(A)

# linear regression
library(ggplot2)
str(mpg)

Y <- as.matrix(mpg$hwy)
X <- as.matrix(mpg[, c("year", "displ")])
X <- cbind(1, X)

betaHat <- solve(t(X) %*% X) %*% t(X) %*% Y
betaHat

YHat <- X %*% betaHat
head(YHat)
head(Y)
plot(YHat, Y)

X0 <- matrix(c(1998, 2000, 1.8, 2.5), 2, 2)
X0 <- cbind(1, X0)
Y0 <- X0 %*% betaHat
Y0

# list
l <- list(1:2, c("ha", "ma", "da"))
str(l)

lNamed <- list(foo = 1:2,
               bar = c("ha", "ma", "da"))
str(lNamed)

lName1 <- l
str(lName1)
names(lName1) <- c("foo", "bar")
str(lName1)

l[2]
l[1:2]
lNamed["bar"]

l[[2]]
l[[1:2]] # problematic

lNamed$foo

x <- list(1, 2, 3)
y <- c(1, 2, 3)
x[1]
y[1]

x[[1]]
y[[1]]


