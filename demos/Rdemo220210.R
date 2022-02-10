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

## Additional demo
l1 <- c(list(TRUE), l)
str(l1)

append(l, list(TRUE))
l2 <- append(l, list(TRUE), 0)
str(l2)

# What about I want to append 3 TRUE, one in each list entry?
c(l, list(rep(TRUE, 3))) # doesn't work
list(rep(TRUE, 3))
as.list(rep(TRUE, 3))
c(l, as.list(rep(TRUE, 3)))

l1[2:3] <- NULL
str(l1)

str(l2[-c(2, 3)])

l3 <- c(list(1), l)
l3
unlist(l3[1:2])
unlist(l3)

# Creating DF
x <- data.frame(x = 1:2, 
                y = c("cat", "dog"), 
                "Can you meow?" = c(TRUE, FALSE),
                check.names=FALSE) # first without this

y <- as.data.frame(list(x=1:2, y=c("cat", "dog")))
y

x$Can you meow? # does not work
x$`Can you meow?`

z <- y
z$`Can you meow?` <- c(TRUE, FALSE)

z <- cbind(y, `Can you meow?`=c(TRUE, FALSE))

w <- rbind(y, y)
rbind(y, data.frame(3, "goat")) # names must match
rbind(y, data.frame(x=3, 4="goat")) # works

q <- z
q$x <- NULL

q[2, ] <- NULL # doesn't work
q <- q[-2, ] # works

q
as.matrix(q) # all character


