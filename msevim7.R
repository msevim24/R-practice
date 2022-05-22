# Muhammed Sevim

# Übung: Datenimport und -export / Mergen / Tidy Data
# 1. 

# Ich habe die Datei auf meinen Computer-Desktop heruntergeladen. Ich habe sie "swissdaten" genannt.
library(readxl)
library(dplyr)

swissdaten <- read_excel("C:\\Users\\admin\\Desktop\\swissdaten.xlsx", sheet = "2016", range = "A8:B33",col_names = c("Kanton", "Bevölkerung"))
View(swissdaten)

# oder
download.file("https://www.bfs.admin.ch/bfsstatic/dam/assets/3222015/master",
              destfile = "bevoelkerung.xlsx", 
              mode = "wb")
bevoelkerung <- read_excel("bevoelkerung.xlsx", sheet = "2016", range = "A8:B33",col_names = c("Kanton", "Bevölkerung"))
View(bevoelkerung)

# 2.
download.file("https://www.bfs.admin.ch/bfsstatic/dam/assets/2381852/master",
              destfile = "waldflaeche.xls", 
              mode = "wb")
waldflaeche <- read_excel("waldflaeche.xls", sheet = "2016", range = "A12:C48", col_names = c("Kanton", "Eigentümer", "Hektar"), trim_ws = TRUE)
View(waldflaeche)
waldflaeche <- waldflaeche[!apply(is.na(waldflaeche) | waldflaeche == "", 1, all),]
head(waldflaeche)

# 3.
data1 <-merge(bevoelkerung, waldflaeche, by="Kanton")
View(data1)
#Diese Daten enthalten nicht alle Kantone. Deshalb benutze ich full_join.
data2 <- full_join(bevoelkerung, waldflaeche, by="Kanton")
View(data2)

# 4.
# Obwohl ich diese Frage nicht verstanden habe,
# habe ich eine Liste (descending) nach Eigentümer gemacht.

data3 <- data2 %>%
  group_by(Kanton, Bevölkerung, Eigentümer) %>%
  arrange(desc(Eigentümer))

# 5.
write.csv(data3, "data3.csv")


# LÖSUNG.....

library(readxl)
download.file("https://www.bfs.admin.ch/bfsstatic/dam/assets/3222015/master", 
              "bevoelkerung.xlsx", 
              mode="wb")
bevoelkerung <- read_excel("bevoelkerung.xlsx", sheet = "2016", range = "A8:B33", col_names=FALSE)
names(bevoelkerung) <- c("Kanton", "Einwohner")

download.file("https://www.bfs.admin.ch/bfsstatic/dam/assets/2381852/master",
              "wald.xls", 
              mode="wb")

wald <- read_excel("wald.xls", sheet = "2016", range = "A13:C48",col_names=FALSE)[, c(1, 3)]
names(wald) <- c("Kanton", "Waldflaeche")

library(stringr)
wald$Kanton <- str_trim(wald$Kanton, side="both")

library(dplyr)
left_join(bevoelkerung, wald, by="Kanton")

wald$Kanton <- str_replace(wald$Kanton, pattern = "\\. ", replacement = ".") 

waldranking <- left_join(bevoelkerung,wald,by="Kanton") %>%
  mutate(bpp = Waldflaeche*400/Einwohner) %>%
  arrange(-bpp)

waldranking

write.csv(waldranking, "waldranking.csv")