# Muhammed Sevim

# Übung: Lineare Regression
# 1. 
library(foreign)
allbus <- read.dta("http://www.farys.org/daten/bmi.dta")

# 2.
install.packages("car")
library(car)
install.packages("rgl")
library(rgl)
fit1 <- lm(bmi ~ alter + sex + bjahre, data = allbus)
summary(fit1)
allbus$alter2 <- allbus$alter^2
fit2 <- lm(bmi ~ alter + alter2 + sex + bjahre , data = allbus)
summary(fit2)

# Ich wollte "scatter3d" Funktion auch verwenden, aber ich konnte nicht alle Variablen sehen. Liegt es daran, dass es zu viele Variablen gibt?
scatter3d(allbus$bmi, allbus$alter, allbus$bjahre, allbus$sex, fit = "linear")
scatter3d(allbus$bmi, allbus$alter, allbus$alter2, allbus$bjahre, allbus$sex, allbus$alter2, fit = "quadratic")

# 3.
library(huxtable)
library(dplyr)
library(tidyr)
huxreg(fit1, fit2)
# Oder
tabelle <- huxreg(fit1, fit2, coefs = c("Alter" = "alter", "Geschlecht" = "sexFRAU", "Bildungsjahre" = "bjahre", "Alterq" = "alter2"))
quick_html(tabelle, file = "regtab.html")
