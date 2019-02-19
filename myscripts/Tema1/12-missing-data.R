housing.data = read.csv("../data/tema1/housing-with-missing-value.csv", header = TRUE, stringsAsFactors = FALSE) # Pilla los strings como números --> Factores == strings
summary(housing.data) # Resumen

# Eliminar todas las observaciones que contengan algún NA (una de las soluciones más bestias)
housing.data.1 = na.omit(housing.data)
summary(housing.data.1)

# Eliminar las NAs de ciertas columnas
drop_na = c("rad") # LAS QUE QUIERO CONVERVAR
housing.data.2 = housing.data[
  complete.cases(housing.data[,!(names(housing.data))%in% drop_na]), ] #Desaparecen los NA de todas las columnas salvo 'rad'

summary(housing.data.2)

# Eliminar toda una columna
housing.data$rad = NULL # Eliminamos la columna 'rad'
summary(housing.data)

drops = c("rad","ptratio") # Columnas que queremos eliminar
housing.data.3 = housing.data[, !names(housing.data) %in% drops] # Nos quedamos todas las filas, y aquellas columnas cuyos nombres no están en 'drops'

summary(housing.data.3)
