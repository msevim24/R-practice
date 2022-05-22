# Muhammed Sevim

## Übung: Export von Tabellen
# 1.

library(dplyr)
library(tidyr)
library(foreign)
library(huxtable)
allbus <- read.dta("http://www.farys.org/daten/bmi.dta")
head(allbus)

# 2.
allbus <- read.dta("http://www.farys.org/daten/bmi.dta") %>%
  select(bmi, alter, einkommen) %>%
  summarise_all(list(Minimum = min,
                     Median = median,
                     Mittelwert = mean,
                     Maximum = max,
                     Fallzahl = ~sum(!is.na(.))), na.rm = TRUE) %>%
  pivot_longer(everything()) %>%
  mutate(Dimension = gsub("_.*", "", name),
         Mass = gsub(".*_", "", name),
         value = as.character(round(value))) %>%
  select(-name) %>%
  pivot_wider(names_from = Mass, values_from = value) %>%
  as_hux(add_colnames = T) %>%
  set_bold(1,everywhere,TRUE)
View(allbus)

# 3. 
allbus[, 1] <- c("", "Body-Mass Index", "Age", "Income")
allbus <- allbus %>% set_text_color(1, everywhere, "red")%>%
          set_background_color(evens, everywhere, "grey80")%>% 
          set_all_borders(brdr(0.4, "solid", "white")) 

# 4.
quick_html(allbus, file ="Allbus_stats.html")

# 5.
bmimin <- read.dta("http://www.farys.org/daten/bmi.dta") %>%
  group_by(alter, sex, einkommen, bjahre, id) %>%
  summarise(bmi_min = bmi) %>%
  arrange(bmi_min)

bmitop <- read.dta("http://www.farys.org/daten/bmi.dta") %>%
  group_by(alter, sex, einkommen, bjahre, id) %>%
  summarise(bmi_top = bmi) %>%
  arrange(desc(bmi_top))%>%
  slice_head(bmi, n = 5)


