system.time(writeLines("What's the plate number?"))

A <- matrix(1, nrow=1e3, ncol=1e3)
system.time(A %*% A)

system.time(
  writeLines("Flash says: What's the plate")
  Sys.sleep(2)
  writeLines("number?"))

system.time({
  writeLines("Flash says: What's the plate")
  Sys.sleep(2)
  writeLines("number?")
})

wantAJoke <- FALSE # try setting to FALSE

if (wantAJoke) {
  writeLines("What do you call a three humped camel? Pregnant")
}
## What do you call a three humped camel? Pregnant
writeLines("Go back to work!")


wantAJoke <- FALSE # try setting to FALSE
if (wantAJoke) {
  writeLines("What do you call a three humped camel? Pregnant")
} else {
  writeLines("Go back to work!")
}

# x <- matrix(c(1, 1))
# x <- 1:3
x <- list(1, 2, 3)
if (is.matrix(x)) {
  x <- c(x)
} else {
  x <- unlist(x)
}
x

today <- "Tuesday"
if (today == "Monday") {
  writeLines("Tell me a joke")
} else if (today == "Tuesday") {
  writeLines("Work work")
} else if (today == "Friday") {
  writeLines("Ready to break")
} else {
  writeLines("Have some fun")
}


if (today == "Monday") {
  writeLines("Tell me a joke")
} else {
  if (today == "Tuesday") {
    writeLines("Work work")
  } else if (today == "Friday") {
    writeLines("Ready to break")
  } else {
    writeLines("Have some fun")
  }
}



FALSE && TRUE
FALSE & TRUE  

FALSE && stop("123")
FALSE & stop("123")

TRUE || stop("123")

x <- c(1, 1)
y <- c(1, 2)
x == 1 & x >= y

x == 1 && x >= y # DON'T use on vectors

x <- 1
if (length(x) > 1 & length(optionalInput) > 0) {
  writeLines("vector")
} else {
  writeLines("scalar") 
}


# Your turn
x <- matrix(1:6, 2, 3)
# x <- 1:6
if (is.matrix(x)) {
  rowMeans(x)
} else {
  mean(x)
}

i <- 1
if (is.matrix(x) && i > 0) {
  mean(x[i, ])
} else {
  mean(x)
}

rm(i)
x <- 1:6
if (is.matrix(x) && i > 0) {
  mean(x[i, ])
} else {
  mean(x)
}


for (i in 1:5) {
  print(i)
}

for (method in c("mean", "trimmed.mean")) {
  writeLines(stringr::str_c("Using method: ", 
                            method))
}


for (i in 1:3) {
  for (j in 1:2) {
    writeLines(stringr::str_c("i = ", i, 
                   "\n j = ", j,
                   "\n i * j = ", i * j))
    #print(i * j)
  }
}

# cumulative sum
n <- 10
cusum <- vector("numeric", length=n)
for (i in 1:n) {
  if (i == 1) {
    cusum[i] <- i
  } else {
    cusum[i] <- cusum[i - 1] + i
  }
}
cusum

n <- 6
for (i in 1:n) {
  print(rep(1, i))
}

l <- vector("list", n)
for (i in 1:n) {
  l[[i]] <- rep(1, i)
}
str(l)
