### Muhammed Sevim

## Übung: Rechnen und Vergleichen

### 1. Arbeiten Sie in einem Scriptfile innerhalb von RStudio. 
# Bewahren Sie den Code für diese Übung (und generell für die weiteren Übungen) in diesem Scriptfile auf.

### 2.Berechnen Sie folgende Terme in R
# 2.1.
(3 + 4) ^ 2

# 2.2.
-99 / 33 + 42

# 2.3.
log(1)

# 2.4.
sqrt(2) ^ 2

### 3. Prüfen Sie folgende Vergleiche:
# 3.1.
5 == 7

# 3.2.
5 * 5 >= 6 * 4

# 3.3.
sqrt(3) != cos(17)

### 4. Für die mean() Funktion kann ein zusätzlicher Parameter trim angegeben werden. 
# Finden Sie heraus, was mit diesem Parameter getan werden kann indem Sie die Hilfe von mean() lesen 
#und halten Sie diese Info in ihrem Scriptfile fest.

## mean 
# Description
# Generic function for the (trimmed) arithmetic mean.
# Usage  mean(x, ...)
# Default S3 method: mean(x, trim = 0, na.rm = FALSE, ...)

# Arguments
## x
# An R object. Currently there are methods for numeric/logical vectors and date, 
# date-time and time interval objects. Complex vectors are allowed for trim = 0, only.

## trim	
# the fraction (0 to 0.5) of observations to be trimmed from each end of x before the mean is computed. 
# Values of trim outside that range are taken as the nearest endpoint.

## na.rm	
# a logical value indicating whether NA values should be stripped before the computation proceeds.

##...	further arguments passed to or from other methods.

## Value
# If trim is zero (the default), the arithmetic mean of the values in x is computed, as a numeric or complex vector of length one. If x is not logical (coerced to numeric), numeric (including integer) or complex, NA_real_ is returned, with a warning.
# If trim is non-zero, a symmetrically trimmed mean is computed with a fraction of trim observations deleted from each end before the mean is computed.

# References
# Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) The New S Language. Wadsworth & Brooks/Cole.

# Examples
# x <- c(0:10, 50)
# xm <- mean(x)
# c(xm, mean(x, trim = 0.10))
# [Package base version 4.0.3 Index]
