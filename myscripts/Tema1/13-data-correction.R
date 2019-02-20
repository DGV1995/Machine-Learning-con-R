install.packages("tidyr")
library(tidyr)

crime.data = read.csv("../data/tema1/USArrests.csv", stringsAsFactors = FALSE)
summary(crime.data)

View(crime.data)

crime.data = cbind(state = rownames(crime.data), crime.data) # Añadir una o más columnas al dataframe. Crea la columna 'state' con los nombres de las columnas de 'crime.data' (en este caso no hay, por lo que pone números)

crime.data.1 = gather(crime.data,                 # Juntar las variables desde 'Murder' hasta 'UrbanPop' (son los tipos de crímenes)
                      key = "crime_type",         # en dos columnas, una es 'crime_type' y la otra 'arrest_estim' (número de crímenes de ese tipo)
                      value = "arrest_estim",
                      Murder : UrbanPop
                      )

crime.data.2 = gather(crime.data,                  # Se traducen todas las columnas a la columna clave-valor, excepto state
                     -state,
                     key = "crime_type",
                     value = "arrest_estim")

crime.data.3 = gather(crime.data, key="crime_type", value="arrest_estim", Murder, Assault)


# PROCESO INVERSO
crime.data.4 = spread(crime.data.2, key="crime_type", value="arrest_estim")



# Unir varias columnas en una
crime.data.5 = unite(crime.data,                   # Desaparecen las columnas 'Murder' y 'Assault', y añade una llamada 'Murder_Assault' con el valor de las dos columnas
                     col = "Murder_Assault",       # separado por una '_'
                     Murder, Assault,
                     sep = "_")
# Proceso inverso
crime.data.6 = separate(crime.data.5, 
                        col="Murder_Assault", 
                        into=c("Murder","Assault"), 
                        sep="_")
