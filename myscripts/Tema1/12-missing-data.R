housing.data = read.csv("../data/tema1/housing-with-missing-value.csv", header = TRUE, stringsAsFactors = FALSE) # Pilla los strings como números --> Factores == strings
summary(housing.data) # Resumen

# Eliminar todas las observaciones que contengan algún NA (una de las soluciones más bestias)
housing.data.1 = na.omit(housing.data)
summary(housing.data.1)

# Eliminar las NAs de ciertas columnas
drop_na = c("rad") # LAS QUE QUIERO CONVERVAR
housing.data.2 = housing.data[complete.cases(housing.data[,!(names(housing.data))%in% drop_na]), ] #Desaparecen los NA de todas las columnas salvo 'rad'

summary(housing.data.2)

# Eliminar toda una columna
housing.data$rad = NULL # Eliminamos la columna 'rad'
summary(housing.data)

drops = c("rad","ptratio") # Columnas que queremos eliminar
housing.data.3 = housing.data[, !names(housing.data) %in% drops] # Nos quedamos todas las filas, y aquellas columnas cuyos nombres no están en 'drops'

summary(housing.data.3)

install.packages("Hmisc")
library(Hmisc)

# Reemplazar los NAs por otros valores conocidos
housing.data.copy1 = housing.data
housing.data.copy1$ptratio = impute(housing.data.copy1$ptratio, mean) # Sustituye todos los NAs de la columna por el promedio de dicha columna
housing.data.copy1$rad = impute(housing.data.copy1$rad, mean)
summary(housing.data.copy1)

housing.data.copy2 = housing.data
housing.data.copy2$ptratio = impute(housing.data.copy2$ptratio, median) # Mediana
housing.data.copy2$rad = impute(housing.data.copy2$rad, median)
summary(housing.data.copy2)

housing.data.copy3 = housing.data
housing.data.copy3$ptratio = impute(housing.data.copy3$ptratio, 18)
housing.data.copy3$rad = impute(housing.data.copy3$rad, 7)
summary(housing.data.copy3)

# IMPORTANTE, ESTO ES LO PRIMERO QUE SE DEBE HACER CUANDO FALTE INFORMACIÓN EN EL DATASET!
install.packages("mice")
library(mice)
md.pattern(housing.data)

install.packages("VIM")
library(VIM)
aggr(housing.data,                             # Agregar datos
     col = c("green","red"),                   # Colores (primera para variables todo ok)
     numbers = TRUE,                           # Pone el porcentaje de la falta de las variables
     sortVars = TRUE,                          # Ordena de más NAs a menos NAs
     labels = names(housing.data),             # Pone las etiquetas de abajo (por defecto vienen puestas)
     cex.axis = 1.0,                           # Tamaño de la letra de las etiquetas del eje X (por defecto, 1.0)
     gap = 2,                                  # Hueco entre las dos gráficas (por defecto, 5)
     ylab = c("Histograma de NAs", "Patrón")   # Etiquetas del eje de las y
     )                          
