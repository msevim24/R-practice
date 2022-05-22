# Muhammed Sevim

## 10.4.1 Übung: Vektoren

# 2. Erzeugen Sie einen Vektor x der Länge 50, der die Zahlen von 1 bis 5 zehn mal wiederholt.

x <- rep(1:5, time=10)
x
# oder jede Zahl wird zehnmal wiederholt
x <- rep(1:5, each=10)
x

# 3. Erzeugen Sie einen Vektor y, der die Elemente von x an den Positionen 12, 20 und 50 enthält.

y <- c(x[12], x[20], x[50])
y

# 4. Erzeugen Sie einen Vektor freunde mit drei Namen Ihrer Wahl.

freunde <- c ("Sarah", "Luca", "Jonas")
freunde
class(freunde)

## 10.5.2 Übung: Faktoren und Listen

# 1. Erzeugen Sie einen Faktor obst, der vier Äpfel und drei Orangen enthält. 
#    Erzeugen Sie zudem einen Faktor gemuese, der einen Brokkoli und drei Tomaten enthält.

obst <- factor(c(rep(0, 4), rep(1, 3)), labels = c("Apfel", "Orange"))
obst
gemuese <- factor(c(rep(0, 1), rep(1, 3)), labels = c("Brokkoli", "Tomate"))
gemuese

# 2. Erzeugen Sie eine Liste einkaufskorb, die das Obst und Gemüse beherbergt.

einkaufskorb <- list(obst = c("Apfel", "Orange"),
                     gemuese = c("Brokkoli", "Tomate"))
einkaufskorb
