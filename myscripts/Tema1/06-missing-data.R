data = read.csv("../data/tema1/missing-data.csv", na.strings = "") # Transformamos los huecos vacíos en NAs
head(data)

data.cleaned = na.omit(data) # Quitamos las filas con valores NA
head(data.cleaned)

is.na(data[4,2]) # Devueve TRUE porque en el dato original aparece un NA
is.na(data[4,1])

is.na(data$Income) # Comprobamos si hay algún NA en la columna 'Income' del dataset
