# Muhammed Sevim

## Übung: Data Frames

#1.

library(readr)
swiss <- read_csv("swiss")
is.data.frame(swiss)
View(swiss)

#2.

df[10:12,]

#3.

df[swiss$Infant.Mortality > 20 & swiss$Infant.Mortality < 22, 4:5] 

df

## Übung: Funktionen 

# 1.

f_1 <- function(x) {
  (x + 2)^2
}

f_1 (1:10)

## 2.Schreiben Sie eine Funktion mit zwei Inputvariablen x und w, 
#  die einen gewichteten Mittelwert berechnet (x gewichtet mit w) und zurückgibt: ???Ni=1wixi???Ni=1wi. 
#  Testen Sie ihre Funktion mit x <- 1:5 und w <-  c(2,4,5,6,7).

# Ich konnte leider keine Funktion erstellen.

f_2 <- function(x,w) {
  sum(x*w) / sum(w)
}

f_2 (1:5,c(2,4,5,6,7))

x <- 1:5
w <-  c(2,4,5,6,7)
