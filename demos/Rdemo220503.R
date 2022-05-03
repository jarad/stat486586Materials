library(ggplot2)
library(classdata)

p1 <- ggplot(fbiwide[fbiwide$Year == 2015, ], aes(x=State, weight=Population)) + geom_bar()
p1 + coord_flip()

ggplot(fbiwide, aes(x=Burglary, y=Murder)) + geom_point() + coord_cartesian(xlim=c(10000, 100000), ylim=c(100, 500))


# facetting
ggplot(fbiwide, aes(x=Year, y=Murder)) + geom_line() + facet_wrap(~ State)

ggplot(fbiwide, aes(x=Year, y=Murder)) + geom_line() + facet_wrap(~ State, scales="free_y")

# facet_wrap: good for one factor
# facet_grid: good for two factors

dat1 <- fbi[fbi$Year %in% 2016:2018 &
              fbi$State %in% c("Iowa", "Illinois", "Nebraska"), ]
ggplot(dat1, aes(x = Type, weight=Count)) + geom_bar()
ggplot(dat1, aes(x = Type, weight=Count)) + 
  geom_bar() + 
  facet_grid(Year ~ State)


ggplot(fbiwide, aes(x=Year, y=Murder, 
                    group=State)) + geom_line()
ggplot(fbiwide, aes(x=Year, y=Murder, 
                    group=State,
                    color=(State == "Iowa"))) + geom_line()


ggplot(fbiwide, aes(x=Murder, y=Motor.vehicle.theft)) + geom_point() + ylab("Motor vehicle theft") + ggtitle("Data for all states in all years")

ggplot(fbiwide, aes(x=Year, y=Motor.vehicle.theft)) + geom_line() + 
  facet_wrap(~ State, scale="free_y") + 
  scale_y_log10()

library(ggplot2)
library(classdata)
fbi2018 <- fbi[fbi$Year == 2018, ]
ggplot(fbi2018, aes(y = log10(Count))) + 
  geom_boxplot()



ggplot(fbiwide, aes(x = Motor.vehicle.theft)) + 
  geom_histogram()

bw <- 5000
ggplot(fbiwide, aes(x = Motor.vehicle.theft)) + 
  geom_histogram(binwidth = bw) + 
  ggtitle(stringr::str_c("binwidth = ", bw))


ggplot(fbi2018, aes(x = Type)) + geom_bar()

ggplot(fbi2018, aes(x = Type, weight=Count)) + 
  geom_bar() + 
  coord_flip()

ggplot(fbi2018, aes(x = Type, y = log10(Count))) +
  geom_boxplot() + 
  coord_flip()

dat <- fbi2018[fbi2018$Type %in% c('Burglary', 'Larceny.theft'), ]
ggplot(dat, aes(x = log10(Count), fill=Type)) +
  geom_histogram(position="dodge")


ggplot(dat, aes(x = log10(Count), color=Type)) +
  geom_histogram(position="dodge")


neigh <- fbi2018[fbi2018$State %in% c('Iowa', 'Nebraska'), ]
dat1 <-  neigh[neigh$Type %in% c('Larceny.theft', 'Burglary'), ]
ggplot(dat1, aes(x = Type, weight=Count, 
                 fill=State)) + 
  geom_bar(position="dodge")

ggplot(fbi[fbi$Type == "Robbery", ], 
       aes(x=State, y=Count)) + 
  geom_boxplot() + 
  coord_flip()

dat <- fbi[fbi$Type %in% c("Burglary", "Larceny.theft"), ]
ggplot(dat, aes(x=Count, fill=Type)) + geom_histogram(position="dodge")

dat1 <- fbi[fbi$Year == 2018, ]
ggplot(dat1, aes(x = State, weight = Count, fill=Type)) + geom_bar() + coord_flip()
