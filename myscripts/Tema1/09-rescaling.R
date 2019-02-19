install.packages("scales")
library(scales)

students = read.csv("../data/tema1/data-conversion.csv")
head(students)

students$Income.rescaled = rescale(students$Income) # El valor más pequeño tendrá valor 0 y el más grande tendrá valor 1. El resto serán reescalados de forma lineal

(students$Income - min(students$Income))/(max(students$Income - min(students$Income))) # es la operación que hace la función rescale()

students$Income.rescaled.100 = rescale(students$Income, to = c(0, 100)) # Reescalamos en el intervalo (0, 100)

rescale.many = function(dataframe, cols) { # cols son las columnas que queremos reescalar
  names = names(dataframe) # nombres de las columnas del dataframe
  for (col in cols) { # Recorremos todas las columnas indicadas en la llamada a la función
    name = paste(names[col], "rescaled", sep = ".") # nombre de la nueva columna
    dataframe[name] = rescale(dataframe[,col]) # reescala toda las filas y la columna indicada
  }
  cat(paste("Hemos reescalado", length(cols), " variable(s)"))
  dataframe # return
}

students = read.csv("../data/tema1/data-conversion.csv")
students = rescale.many(students, c(1,4))

