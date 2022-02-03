library(stringr)
x <- c("Shaw, Jacob", "Jacobi, Neal", "Pearl, Jacob")
str_view_all(x, "Jacob$")

str_detect(x, "Jacob$")
str_count(x, "Jacob$")
str_count("Jacob Jacob", "Jacob")

str_view_all(x, "[:alnum:]")
str_count(x, "[:alnum:]")
str_extract(x, "Jacob$")
str_extract(x, "Jacob.?")

str_replace(x, "Jacob$", "Jake")

str_view_all(x, "[^[:alnum:]]+")
y <- str_split(x, "[^[:alnum:]]+")
y[[1]]


## Factor
x <- c("primary", "middle", "primary", "high")
str(x)
y <- factor(x)
str(y)
y

table(y)

y2 <- factor(x, levels=c("primary", "middle", "high"))
y2
table(y2)

library(classdata)
str(fbi)

boxplot(fbi$Count ~ fbi$Type)
str(fbi$Type)
levels(fbi$Type)

type2 <- reorder(fbi$Type, fbi$Count, mean, na.rm=TRUE)
str(type2)
boxplot(fbi$Count ~ type2)

type3 <- type2
levels(type3) <- str_sub(levels(type3), 1, 3)
str(type3)
boxplot(fbi$Count ~ type3)

type4 <- factor(type3,
                levels=rev(levels(type3)))
boxplot(fbi$Count ~ type4)


## Your turn
fbi$rate <- fbi$Count / fbi$Population
boxplot(fbi$rate ~ fbi$Type)

type5 <- reorder(fbi$Type, fbi$rate, median, 
                 na.rm=TRUE)
boxplot(fbi$rate ~ type5)


## Logical vectors
TRUE
FALSE
T # BAD! Please avoid
!TRUE
!c(TRUE, FALSE)

TRUE | FALSE
FALSE & TRUE

TRUE | FALSE & FALSE # & is calculated before |
TRUE | (FALSE & FALSE)
(TRUE | FALSE) & FALSE

a <- c(1, 10)
b <- c(2, 3)
a < b
a == b
a != b

a = b
a <- b

col <- "cardinal"
redCols <- c("red", "wine", "cherry", "cardinal")
col %in% redCols
c("red", "blue") %in% redCols

ifelse(c(TRUE, FALSE, TRUE), "even", "odd")
ifelse(1:10 %% 2 == 0, "even", "odd")

dat <- cities[cities$City %in% c("Ames", "Ankeny"), ]
plot(dat$Violent.crime, dat$Property.crime, 
     col = ifelse(dat$City == "Ames", "red", "blue"))


