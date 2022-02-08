x <- c( 9.3, 8.7, 9.5, 10, 9,  8.9)
x[c(-2, -4)] # bad!
x[-c(which.min(x), which.max(x))]

x >= 9.5
x[c(3, 4)] # bad!

library(stringr)
str_view_all("hello world", "\\w+") # \w
str_view_all("hello world", "\w+")

0.0001 <= "0.05"

library(classdata)
x <- fbi$Year
str(x)
is.integer(x)
is.numeric(x)
is.factor(x)
x1 <- as.factor(x)
str(x1)
is.integer(x1)
is.factor(x1)

y <- fbi$Population
plot(x, y)
plot(x1, y)

summary(x)
summary(x1)

x2 <- as.numeric(x1) # does not work
x3 <- as.character(x1)
x4 <- as.numeric(x3)

x <- c(1998, 1999, 1998)
str(x)
is.numeric(x)
y <- as.character(x)
is.character(y)
is.numeric(y)
z <- as.factor(y)
is.factor(z)

w <- as.numeric(as.character(z))
identical(w, x)

## Matrix
x <- 1:6
x1 <- matrix(x, 3, 2)
x2 <- matrix(x, 2, 3)
x3 <- matrix(x, 3)
x4 <- matrix(x, 6, 2) # recycling rule
x5 <- matrix(x, 2, 6)
x6 <- matrix(x, 2, 6, byrow=TRUE)

cbind(x2, x6)
cbind(x2, 1)
cbind(x2, 1, 2)
cbind(x2, 1:2)
cbind(x2, matrix(1:2))

rbind(x1, 1)

c(x1)
as.vector(x1)

matrix(x)
as.matrix(x)
matrix(x1)
as.matrix(x1)

y <- matrix(5:10, 2, 3)
y1 <- rbind(y, matrix(1:3, nrow=1))
c(y1)
      
z <- matrix(1:9, 3, 3)
z
z[2:3, ]
z[1, ]
str(z[1, ])

z[1, , drop=FALSE]

x1
dim(x1)
nrow(x1)
ncol(x1)

x1
t(x1)
dim(t(x1))

z
diag(z)
diag(z) <- 0
z

diag(1, 3)
diag(c(1, 3, 5), 3)
x <- c(1, 3, 5)
diag(x, length(x))

diag(3) # Do not use the single argument version
diag(x)
diag(x[1:2])
diag(x[3])
