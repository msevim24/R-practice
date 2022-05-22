# Muhammed Sevim

## Übung: Grafiken III 

# 1.
library(foreign)
allbus <- read.dta("http://www.farys.org/daten/bmi.dta")
head(allbus)

# 2.
library(ggplot2)
ggplot(allbus, aes(x = einkommen, y = alter)) +
  geom_point(aes(color = sex))

# 3. Ick konnte nich lösen
library(dplyr)
hohebildung <-filter(allbus, bjahre > 10)
niedrigebildung <-filter(allbus, bjahre <= 10)
ggplot(allbus$bjahre, aes(x = einkommen, y = alter, group = 1)) +
  geom_point() +
  theme_bw() + 
  facet_wrap(~sex+hohebildung)

# 4.
ggplot(allbus, aes(x = einkommen, y = alter)) +
  geom_point(aes(color = sex))+
  geom_smooth()

# 5.
ggplot(allbus, aes(x = einkommen, y = alter)) +
  geom_point(aes(color = sex))+
  geom_smooth()+
  xlab("salary")+
  ylab("age")+
  ggtitle("age/salary according to sex")

# und exportieren
ggsave("allbus.png")

## Übung: Grafiken IV

# 1. 

allbus <- read.dta("http://www.farys.org/daten/bmi.dta")
head(allbus)

# 2.
ggplot(allbus, aes(x = bmi)) +
  geom_histogram()

# 3.
ggplot(allbus, aes(x = bmi, color = sex)) +
  geom_histogram(alpha = 0.05)

# 4.
ggplot(allbus, aes(x = bmi, y = sex)) +
  geom_bar(stat="identity", color="green", width=0.5)
