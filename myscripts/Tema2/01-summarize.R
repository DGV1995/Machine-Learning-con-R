data = read.csv("../data/tema2/auto-mpg.csv", header = TRUE, stringsAsFactors = FALSE)

# Pasamos la columna del número de cilindros de numérica a categórcia
data$cylinders = factor(data$cylinders,
                        levels = c(3,4,5,6,8),  #Tengo 5 cantidades distintas de cilindros (3,4,5,6,8)
                        labels = c("3 cil","4 cil","5 cil","6 cil","8 cil") # Nombre de cada nivel
                        ) 

summary(data) # Resumen

str(data) # Estructura

summary(data$cylinders)
summary(data$mpg)

str(data$cylinders)
str(data$mpg)

#--------------------------------------

X = data$mpg

# MEDIDAS DE CENTRALIZACIÓN
#--------------------------
# Media
mean(X)

# Mediana
median(X)

# Moda
install.packages("modeest")
library(modeest)
mfv(X) # mfv = most frequent value

# Percentiles
quantile(X)

# MEDIDAS DE DISPERSIÓN
#----------------------
# Varianza 
var(X)

# Desviación típica (sd) --> sd = sqtr(var)
sd(X)

# Coeficiente de variación --> cv = (sd/mean)*100
install.packages("raster")
library(raster)
cv(X)

# MEDIDAS DE ASIMETRÍA
#---------------------

install.packages("moments")
library(moments)

# Asimetría de Fisher 
skewness(X)

# Curtosis
moments::kurtosis(X)

hist(X, main = "Millas por galeón")
# Se ve que los valores se acumulan entorno a la media, que es 23.51



