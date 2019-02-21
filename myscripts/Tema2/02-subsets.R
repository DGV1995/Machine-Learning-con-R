data = read.csv("../data/tema2/auto-mpg.csv", header = TRUE, stringsAsFactors = FALSE)

# Index by position
data[1:5, 8:9]
data[1:5, c(8,9)]

# Index by Name
data[1:5, c("model_year", "car_name")]
data[c(1,2,3), c("model_year", "car_name")]

# Min y max de mpg
data[data$mpg == max(data$mpg) | data$mpg == min(data$mpg), ]

# Filtros con condiciones
data[data$mpg > 30 & data$cylinders == 6, c("car_name", "mpg")]

data[data$mpg > 30 & data$cyl == 6, c("car_name","mpg")] # R reconoce 'cyl' como 'cylinders' automáticamente

# Subset
subset(data, mpg > 30 & cylinders == 6, select = c("car_name", "mpg")) # Dataframe, condiciones para las filas, y columnas que queremos

# Excluir columnas
data[1:5, c(-1,-9)] 
data[1:5, -c(1,9)]
#data[1:5, -c("No", "car_name")] ---> No funciona con los nombres de las columnas
data[1:5, !names(data) %in% c("No", "car_name")]

# Elegir filas específicas
data[data$mpg %in% c(15,20), c("car_name", "mpg")]

data[1:2, c(F,F,T)] # Devolverá las columnas 3, 6 y 9 --> Repite el patrón indicado (F, F, T)
data[c(F,F,F,F,T), c(F,F,T)] # Columnas cuyo índice es múltiplo de 5
