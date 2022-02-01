library(classdata)

str(cities)
unique(cities$City)
unique(cities$Murder)
length(unique(cities$City))

# ordering
dat2016 <- cities[cities$Year == 2016, ]
violent <- dat2016$Violent.crime
names(violent) <- dat2016$City
sort(violent)
sort(violent, decreasing = TRUE)
head(sort(violent, decreasing = TRUE))
worst5 <- head(sort(violent, decreasing = TRUE), 5)
names(worst5)

# rank
rank(violent)
rank(violent)["Des Moines"]

# order
order(violent)
violent[9]
violent[37]
violent[order(violent)] # same as sort(violent)
datSorted <- dat2016[order(violent), ]

# plots
hist(dat2016$Violent.crime)
hist(dat2016$Violent.crime / dat2016$Population)
boxplot(dat2016$Violent.crime / dat2016$Population)

barplot(c(3, 1))
amesPop <- dat2016$Population[dat2016$City == "Ames"]
ankenyPop <- dat2016$Population[dat2016$City == "Ankeny"]
pop <- c(Ames = amesPop, Ankeny = ankenyPop)
pop
barplot(pop)

cities$rate <- cities$Violent.crime / cities$Population
ames <- cities[cities$City == 'Ames', ]
plot(ames$Year, ames$rate)
plot(ames$Year, ames$rate, ylim=c(0, max(ames$rate)))
lines(ames$Year, ames$rate)

ankeny <- cities[cities$City == "Ankeny", ]
lines(ankeny$Year, ankeny$rate)
points(ankeny$Year, ankeny$rate)
abline(h=0.002)

plot(ames$Year, ames$rate, 
     ylim=c(0, max(ames$rate)), type="o",
     xlab = "Year",
     ylab = "Crime rate",
     main = "Crime rate over the years")
lines(ankeny$Year, ankeny$rate, col="blue", lty=2)
points(ankeny$Year, ankeny$rate, col="blue", pch=2)

legend("topright",
       c("Ames", "Ankeny"),
       col = c("black", "blue"),
       pch = c(1, 2),
       lty = c(1, 2))


## strings
"hello world"
""
hw <- 'hello world'
hw2 <- c("hello", "world")
hw
hw2

single <- "'"
double <- '"'
double2 <- "\""

writeLines(double)
print(double)

hw3 <- "hello

world"
hw3
print(hw3)
writeLines(hw3)

x <- "Mary's friend says: \n \t \"Hello!\""
print(x)
writeLines(x)

"\\"
writeLines("\\")

"O'Neal"
s <- "\n \\ \""
print(s)
writeLines(s)

# string functions
library(stringr)
hw2
str(hw2)
str_length(hw2)
length(hw2)

str_c(hw2, "!")
str_c(hw2, "Mary", "!", sep=" ")
c(hw2, "!")
str_c(hw2, collapse = ", ")

str_sub(hw2, 1, 3)
str_sub(hw2, -3, -1)
str_sub(hw2, str_length(hw2) - 2, str_length(hw2))

HW2 <- hw2
substr(HW2, 1, 1) <- str_to_upper(substr(HW2, 1, 1))
HW2

str_to_upper(hw)
str_to_lower(hw)
str_to_title(hw)
str_to_sentence(hw)

# patterns
x <- c("Shaw, Jacob", "Jacobi, Neal", "Pearl, Jacob")
str_view_all(x, "Jacob")
str_view_all(x, "Jacob$")
str_view_all(x, "^Jacob")
