library(ISLR2)

str(Default)
str(Default$default)

m <- glm(default ~ ., Default, family=binomial)
summary(m)

p <- predict(m,
        data.frame(student = "No",
                   balance = 1000,
                   income = 20000),
        type="response")
p # prediction for probability
# prediction for default or not
YHat <- ifelse(p > 0.5, "Yes", "No")

# Should we include income as a predictor or not?
# Use CV to investigate the misclassification rates
library(boot)
cost <- function(Y, p) {
  mean(Y != (p > 0.5))
}
mCV <- cv.glm(Default, m, K=10, cost=cost)
mCV$delta[1] # misclassification rate

m1 <- glm(default ~ . - income, Default, family=binomial)
m1CV <- cv.glm(Default, m1, K=10, cost=cost)
m1CV$delta[1]
# exclude income as a predictor


library(classdata)
library(ggplot2)
str(fbiwide)

ggplot(fbiwide, aes(x=Burglary, y=Murder)) +
  geom_point()

p <- ggplot(fbiwide, aes(x=Burglary, y=Murder)) +
  geom_point()
p 
print(p)

ggplot(fbiwide, aes(x=Burglary, y=Murder, color=Year)) +
  geom_point()

ggplot(fbiwide, aes(x=Burglary, y=Murder, 
                    size=Year, color=Population)) +
  geom_point()

ggplot(fbiwide, aes(x=Burglary, y=Murder)) +
  geom_point() + 
  geom_line()

ggplot(fbiwide, aes(x=Burglary, y=Murder)) +
  geom_point() + 
  geom_smooth() # nonlinear fit

ggplot(fbiwide, aes(x=Burglary, y=Murder)) +
  geom_point() + 
  geom_smooth(method="lm") # linear regression fit

# bar chart
fbi2018 <- fbiwide[fbiwide$Year == 2018 &
                     fbiwide$State %in% 
                       c("Iowa", "Illinois", "Nebraska"), ]
fbi2018

ggplot(fbi2018, aes(x=State, weight=Population)) + 
  geom_bar() 

tmp <- fbi2018
tmp$State <- factor(tmp$State, 
                    levels=c("Iowa", "Illinois", "Nebraska"))
ggplot(tmp, aes(x=State, weight=Population)) + geom_bar()


# more options
ggplot(mpg, aes(x=cty, y=hwy)) + geom_point()

ggplot(mpg, aes(x=cty, y=hwy)) + 
  geom_point(position="jitter")

dat <- fbiwide[fbiwide$Year %in% 2016:2018 & 
                 fbiwide$State %in% 
                 c("Iowa", "Illinois", "Nebraska"), ]
dat$Year <- factor(dat$Year)
ggplot(dat, aes(x=State, weight=Population, fill=Year)) + 
  geom_bar()
ggplot(dat, aes(x=State, weight=Population, fill=Year)) + 
  geom_bar(position="dodge")

ggplot(fbiwide, aes(x=Burglary, y=Murder)) + geom_point() +
  scale_x_log10() + scale_y_log10()

ggplot(fbiwide, aes(x=log(Burglary), y=log(Murder), 
                    color=State)) + geom_point()
