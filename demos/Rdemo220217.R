month.name

i <- 1

while (month.name[i] != "June") {
  i <- i + 1
  print(i)
}
i
month.name[i]

n <- 20
x <- 1:n
sum((-1) ^ (x + 1) / x)


tolerance <- 1e-5

# Initialize
n <- 10
total <- 0
error <- Inf

while (error > tolerance) {
  n <- n * 2
  x <- 1:n
  newTotal <- sum((-1) ^ (x + 1) / x)
  error <- abs(newTotal - total)
  total <- newTotal
  print(n)
  print(error)
}



for (i in 1:1e4) {
  x <- i^3
  print(x)
  if (x > 2000) {
    break
  }
}
i
i^3


while (TRUE) {
  print("hello world")
}

i <- 1
while (TRUE) {
  month <- month.name[i]
  if (month == "June") {
    break
  } 
  i <- i + 1
}

if (i == 2) {
  print("yes")
} 
print("no")

if (i == 2) {
  print("yes")
} else {
  print("no")
}



i <- 1
repeat {
  month <- month.name[i]
  if (month == "June") {
    break
  } 
  i <- i + 1
}
i
month

plans <- rep("", 12)
names(plans) <- month.abb
plans[c("Jun", "Jul", "Aug")] <- "have fun"

for (i in 1:length(plans)) {
  if (plans[i] != "") {
    next
  }
  plans[i] <- "study"
}


# Doesn't work
plans <- rep("", 12)
names(plans) <- month.abb
plans[c("Jun", "Jul", "Aug")] <- "have fun"

for (i in 1:length(plans)) {
  if (plans[i] != "") {
  }
  plans[i] <- "study"
}

i <- 1
while (i < 11) {
  print(sqrt(i))
  i <- i + 1
}


i <- 1
repeat {
  print(sqrt(i))
  i <- i + 1
  if (i >= 11) {
    break
  }
}


i <- 1
repeat {
  if (i == 5) {
    i <- i + 1
    next
  }
  
  print(sqrt(i))
  i <- i + 1
  if (i >= 11) {
    break
  }
}


## Functions
x <- 1:5
y <- c(100, 1000)
z <- c(-1, 1, 3)
w <- c(1, 3, NA, 5)

standardize <- function(x) {
  res <- (x - mean(x)) / sd(x)
  res
}

standardize(x)
standardize(y)
standardize(z)
standardize(w)
