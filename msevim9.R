# Muhammed Sevim
## Übung: Grafiken I
# 1.

library(haven)
ess <- read_dta("C:/Users/admin/Desktop/ESS4e04_de.dta")
View(ess)

library(dplyr)

# Barplot mit absoluten Häufigkeiten
barplot(table(ess$wahlentscheidung))

# 2.
data <-table(ess$geschlecht, ess$wahlentscheidung) 
rownames(data) <- c("geschlecht","wahlentscheidung")
barplot(data, beside=TRUE,
        col = c("green", "yellow"), 
        legend.text = rownames(data),
        args.legend = list(x = "topright", inset = c(-0.10, -0.20), cex=0.50))

# 3 und 4
pdf("alter.pdf")
hist(ess$age, breaks = 30, xlim = c(0,100))
dev.off()

## Übung: Grafiken II
# 1.
data(swiss)
View (swiss)

# 2.
x <- swiss$Education
y <- swiss$Fertility
plot(x, y, xlab = "Bildung", ylab = "Fruchtbarkeit", main="Zusammenhang zwischen Bildung und Fortpflanzung", pch = 21, xlim = c(0,100), ylim = c(0,100), col = "red")
