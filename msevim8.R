# Muhammed Sevim

# Übung: XPath

library(rvest)
daimler <- read_html("https://www.onvista.de/aktien/Daimler-Aktie-DE0007100000")
aktie <- html_node(daimler, ".NEGATIV span") %>%
  html_text()
aktie

aktie %>% 
  strsplit(., ",") %>%
  .[[1]] %>% .[1] %>%
  as.numeric

# Oder wir können so zusammen schreiben

daimler <- read_html("https://www.onvista.de/aktien/Daimler-Aktie-DE0007100000")
daimler %>% 
  html_node(".NEGATIV span") %>%
  html_text %>%
  strsplit(., ",") %>%
  .[[1]] %>% .[1] %>%
  as.numeric



