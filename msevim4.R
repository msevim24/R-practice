# Muhammed Sevim
# Übung: Kontingenztabellen und einfache Tests

# 1. 

install.packages("foreign")
library("foreign")
titanic <- read.dta("http://www.stata-press.com/data/kkd/titanic2.dta")
head(titanic)
tail(titanic)
summary(titanic)
str(titanic)
nrow(titanic)
ncol(titanic)
which(is.na(titanic))

# 2.

table(titanic$class, titanic$survived)
100*prop.table(table(titanic$class, titanic$survived))
round(100*prop.table(table(titanic$class, titanic$survived)), 2)

# 3.

summary(titanic$survived)
prop.table(table(titanic$survived))
aggregate(titanic$age2,list(titanic$survived),mean)
aggregate(titanic$age2,list(titanic$survived),median)

# 4.

x <- (titanic$survived =="yes")
y <- (titanic$survived =="no")
t.test(titanic$age2, x)
t.test(titanic$age2, y)
