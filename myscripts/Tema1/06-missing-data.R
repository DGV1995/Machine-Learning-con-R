data = read.csv("../data/tema1/missing-data.csv", na.strings = "") # Transformamos los huecos vacíos en NAs
head(data)

data.cleaned = na.omit(data) # Quitamos las filas con valores NA
head(data.cleaned)

is.na(data[4,2]) # Devueve TRUE porque en el dato original aparece un NA
is.na(data[4,1])

is.na(data$Income) # Comprobamos si hay algún NA en la columna 'Income' del dataset

data.income.cleaned = data[!is.na(data$Income), ] # Devuelve todas las columnas, pero solo las filas donde 'Income' no es NA
head(data.income.cleaned)

complete.cases(data) # Devuelve TRUE si la fila no tiene NA (está completa) y FALSE en caso contrario

data.cleaned.2 = data[complete.cases(data), ]
head(data.cleaned.2, 10)

# Convertir los ceros de ingresos en NA
data$Income[data$Income == 0] = NA

# Medidas de centralización y dispersión
mean(data$Income, na.rm = TRUE) # Media
sd(data$Income, na.rm = TRUE) # Desviación típica

