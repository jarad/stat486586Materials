library(dplyr)
library(classdata)

# select
str(fbi)
dat <- select(fbi, State, Year, Type, Count)
str(dat)

# same as
fbi[, c("State", "Yeart", "Type", "Count")]

dat2 <- select(fbi, c(1, 3, 5, 6))
str(dat2)

dat3 <- select(fbi, -Abb, -Population, -Violent.crime)

dat4 <- select(fbi, contains("St"))

a <- select(fbi, Year)
b <- fbi$Year # different

# filter: row
dat <- filter(fbi, 
              Year == 2014 & Type == "Burglary")
str(dat)

# same as
fbi[fbi$Year == 2014 & fbi$Type == "Burglary", ]

dat2 <- filter(fbi, 
       Abb %in% c("IA", "IL") | 
         Year >= 2014)

iowa2017 <- filter(fbi, State == "Iowa" & Year == 2017)
iowa2017sub <- select(iowa2017, State, Year, Type, Count)
str(iowa2017sub)

# mutate
dat <- mutate(fbi,
        Rate = Count / Population * 1000,
        Year = Year + 0.1)

dat2 <- mutate(fbi,
       Violent.crime2 = ifelse(Violent.crime == TRUE,
                               "Yes",
                               "No"),
       Count = ifelse(Year <= 1980, NA, Count))

# dplyr uses non-standard evaluation
select(fbi, State)
varname <- "State"

select(fbi, varname)
filter(fbi, varname == "Iowa")
filter(fbi, State == "Iowa")

# your turn
d1 <- select(fbi, Abb, Year, Population, Type, Count)
d2 <- filter(d1, Year == 2017 & Abb != "IA")
d3 <- mutate(d2, Rate = Count / Population * 1000)
d4 <- select(d3, -Count, -Population)

mutate(
  filter(select(fbi, Abb, Year, Population, Type, Count),
       Year == 2017 & Abb != "IA"),
       Rate = Count / Population * 1000)

# %>%
x <- 1:3
mean(x)
x %>% mean
x %>% mean()

y <- c(x, NA)
mean(y, na.rm=TRUE)
y %>% mean(na.rm=TRUE)

str(head(fbi))
fbi %>% head %>% str

dat <- select(fbi, -Abb)
dat1 <-fbi %>%
  select(-Abb) # same
identical(dat, dat1)

dat2 <- filter(dat1, State == "Iowa" & Year == 2017)
dat3 <- dat1 %>%
  filter(State == "Iowa" & Year == 2017)
identical(dat2, dat3)

dat4 <- fbi %>%
  select(-Abb) %>% 
  filter(State == "Iowa" & Year == 2017)
identical(dat4, dat3)


d1 <- select(fbi, Abb, Year, Population, Type, Count)
d2 <- filter(d1, Year == 2017 & Abb != "IA")
d3 <- mutate(d2, Rate = Count / Population * 1000)
d4 <- select(d3, -Count, -Population)

dat <- fbi %>% 
  select(Abb, Year, Population, Type, Count) %>% 
  filter(Year == 2017 & Abb != "IA") %>% 
  mutate(Rate = Count / Population * 1000) %>% 
  select(-Count, -Population)

# distinct
str(fbi)
distinct(fbi, State)
dat <- distinct(fbi)
dim(dat)

fbi %>%
  distinct(State)

a <- fbi %>%
  distinct(State, Year)

# arrange
fbi2017 <- fbi %>% 
  select(State, Year, Type, Count) %>%
  filter(Year == 2017 & Type != "Legacy.rape")
head(fbi2017)

fbi2017 %>%
  arrange(Count) %>%
  head
fbi2017 %>%
  arrange(desc(Count)) %>%
  head

a <- fbi2017 %>% 
  arrange(Type, desc(Count))

# summarize
# summarise
summarize(fbi,
          mean = mean(Count, na.rm=TRUE),
          sd =   sd(Count, na.rm=TRUE),
          nTotal  = n(),
          nNonNA = sum(!is.na(Count)))

# group_by
fbi %>%
  group_by(Type)

a <- fbi %>%
  group_by(Type) %>% 
  summarize(mean = mean(Count, na.rm=TRUE),
            sd =   sd(Count, na.rm=TRUE),
            nTotal  = n(),
            nNonNA = sum(!is.na(Count)))
a
as.data.frame(a)
