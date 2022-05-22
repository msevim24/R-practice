library(quantmod)
getSymbols("^SSMI")
head(SSMI)

install.packages("forecast")
library(forecast)

fit <- auto.arima(to.monthly(SSMI)[,"SSMI.Adjusted"])

plot(forecast(fit,h=6))
##### Benzer Ornek

getSymbols("MSFT", from ="1999-01-01")
microsoft <- data.frame(time(MSFT), MSFT[,6]) 
microsoft$time <- as.Date(microsoft$time.MSFT., "%Y-%m-%d")

microsoft <- microsoft %>%
  mutate(change = MSFT.Adjusted - first(MSFT.Adjusted),
         change.pc = change/first(MSFT.Adjusted)+1) 


library(rvest)
raw <- read_html("http://www.switzerland.org/schweiz/kantone/index.de")
table <- html_table(raw, fill = TRUE, header = TRUE)[[6]]

weather <- read.table("https://raw.githubusercontent.com/justmarkham/tidy-data/master/data/weather.txt", header=TRUE)
head(weather)

library(tidyr)
weather1 <- pivot_longer(weather, cols = d1:d31, values_drop_na = TRUE)
head(weather1)

library(stringr)    # für str_replace(), str_sub()
weather1$day <- as.integer(str_replace(weather1$name, "d", ""))

load(url("http://www.farys.org/daten/Satisfaction.RData"))
library(tidyr)

data.long <- pivot_longer(data, cols = p12c44:age14)


####

load(url("http://www.farys.org/daten/Satisfaction.RData"))
data <- read.table("http://www.farys.org/daten/Satisfaction.RData", header=TRUE)
data.long <- pivot_longer(data, cols = p12c44:age14)


bmi <- read.dta("http://www.farys.org/daten/bmi.dta")
tabelle <- bmi %>%
  select(bmi, alter, einkommen)%>%
summarise_all(list(Minimum = min,
                   Median = median,
                   Mittelwert = mean,
                   Maximum = max,
                   Fallzahl = ~sum(!is.na(.))), na.rm = TRUE)%>%
  pivot_longer(everything()) 


####sub

names(data) <- sub(
  "p([0-9]{2})c44", 
  "satisfaction\\2\\1", 
  names(data))

pivot_longer(data, cols = satisfaction12:age14, 
             names_to = c("dimension", "year"),
             names_pattern = "(.*)([0-9]{2})")

##
setNames(nm = sub(". Temperatur (°C)", names(.)))
t4 <- grep("^.", colnames(t3))

####### String, grep()
#\\s matches any white space character
#\\w matches any word character i.e. alphanumeric.
#\\W matches any non-word character i.e. symbols.
# grep(x = r_packages, pattern = "\\bstat", value = TRUE) "stat" ile baslayanlar
# grep(x = r_packages, pattern = "stat\\b", value = TRUE) "stat" ile bitenler
# grep(x = r_packages, pattern = "\\Bstat", value = TRUE) "stat" basta degil, ortada ya da sonda
# grep(x = r_packages, pattern = "stat\\B", value = TRUE) stat sonda degil
# package names that begin with a number: grep(x = r_packages, pattern = "^[0-9]", value = TRUE)
# package names that end with a number:"[0-9]$"

###tabelle

map_background_color(by_rows("grey95", "white")) 
map_text_color(by_rows(c(1, 3, 4), c("red", "black", "green3")))
set_background_color(evens, everywhere, "grey80") 
set_all_borders(brdr(0.4, "solid", "white")
set_caption("> tabelle")
set_col_width(1:3, 0)
set_align(1, everywhere, "center")
set_col_width(., -.1)
set_tb_padding(1, everywhere, 0) 
  

### commas nad dots
format(df, decimal.mark=".")
df$a <- gsub("\\.", ",", df$a)
df$a <- as.numeric(gsub("\\.", ",", df$a))

apply(apply(df, 2, gsub, patt=",", replace="."), 2, as.numeric)
#or you can read the data file with read.table using dec argument:
df <- read.table('clipboard', dec=",", header=T, row.names=1)

mysub <- function(x) {sub(",",".",x)}
mydata <- (apply(t3, 2, mysub ))
t4 <- data.frame(apply(mydata, 2, as.numeric))

t1[ , 2:3] <- lapply(t1[ , 2:3],
                     function(x){ as.numeric(as.character(gsub(",", ".", x))) })

t3 <- sapply(t3, gsub, pattern = ",", replacement= ".")
t3

df <- sapply(df, gsub, pattern = ",", replacement= ".")
df <- sapply(df, as.numeric)

conv <- c("Max", "Min")
t3[ , conv] <- lapply(t3[ , conv],
                     function(x){as.numeric(as.character(gsub(",", ".", x))) }

t1 <- sapply(t1, gsub, pattern = ",", replacement= ".")  
t3 <- gsub(",", ".", t3)

t3[ , 2:3] <- lapply(t3[ , 2:3],
                     function(x){as.numeric(as.character(gsub(",", ".", x))) })
t3 <- sub("NA", "-3.6", t3)
t3 <- sub("NA", "-3.1", t3)
t3 <- sub("NA", "-2.3", t3)


sel <- grepl("var",names(df))
df[sel] <- lapply(df[sel], function(x) replace(x,x %in% 3:4, NA) )
df

setClass("num.with.commas")
setAs("character", "num.with.commas", 
      function(from) as.numeric(gsub(",", "", from) ) )

DF <- read.csv('your.file.here', 
               colClasses=c('num.with.commas','factor','character','numeric','num.with.commas'))

### son bolum
reihe <- c("", c(1:12))
t3 <- as_hux(t3) %>%
      insert_column(reihe, after = 0)%>%
      map_align(., by_cols("left", "right", "right", "right"))%>%
      set_text_color(2:13, -2, "lightseagreen")%>%
      set_col_width(2:4, 0)%>%
      set_position("left")%>%
      set_caption("> tabelle")%>%  # Wenn "> tabelle" die Überschrift (caption) ist...
      set_caption_pos(., "topleft")%>%
#####

tabelle <- read.csv("http://farys.org/daten/Prestige.csv") %>%
  select(education, income) %>%
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
