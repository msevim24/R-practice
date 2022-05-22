# Muhammed Sevim

## Übung: Strings säubern

# 1.
paste0('objekt_', 1:100)

# 2.
s <- c("Kontostand: 100 EUR", "Kontostand: 150 EUR", "Kontostand: 185 EUR")
gsub('EUR', 'CHF', 'Kontostand: 100 EUR, Kontostand: 150 EUR, Kontostand: 185 EUR')

# Oder
install.packages("stringr")
library("stringr") 
s <- str_replace(s, "EUR", "CHF")
s

# 3.
str_replace_all(s, "([Kontostand:CHF])", "")

## Übung: Reguläre Ausdrücke / Pattern Matching

# 1. 
s <- "George Bush, born July 6, 1946, is a former American president. His full name is George Walker Bush."
substr(s, 27, 30)

# Oder
str_extract(c("George Bush, born July 6, 1946, is a former American president. His full name is George Walker Bush."), "[0-9]{4}")

#2.
substr(s, 88, 94)

# Oder
word(s, -2)

# Oder
gsub(".*George (.+) Bush.*", "\\1", s)

# Oder (Ich denke, "str_match" wird auch funktionieren, aber ich konnte das Ergebnis nicht finden.)
str_match_all(s, "George\\s*(.*?)\\s*Bush")
str_match_all(s, "George(.*?)Bush")

