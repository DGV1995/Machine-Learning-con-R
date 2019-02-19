data = read.csv("../data/tema1/missing-data.csv", na.strings = "")
head(data)

data$Income.mean = ifelse(is.na(data$Income), 
                          mean(data$Income, na.rm = TRUE), 
                          data$Income
                          ) # Crea una nueva columna
head(data)

# Reemplazo aleatorio
rand.input = function(x) {                                        # x es un vector de datos que puede contener NA
  missing = is.na(x)                                              # vector del mismo tamaño que x, que continue TRUE o FALSE dependiendo de si x tiene NA o no
  n.missing = sum(missing)                                        # número total de elementos que son NA dentro de x --> sum(c(T,T,T,F,F)) = 3
  x.obs = x[!missing]                                             # valores que tienen dato diferente de NA en x
  imputed = x                                                     # por defecto, devolveré lo mismo que había entrado por parámetro
  imputed[missing] = sample(x.obs, n.missing, replace = TRUE)     # donde hay valor NA, lo reemplazo por uno cualquiera aleatorio de los que no son NA
  return(imputed)
} 

random.impute.data.frame = function(dataframe, cols) {
  names = names(dataframe)                            # nombre de las columnas del dataframe
  for (col in cols) {                                 # recorremos las columnas del dataframe
    name = paste(names[col], "imputed", sep = ".")    # concatenar el nombre de la variable original con 'imputed', utilizando como separador un '.'
    dataframe[name] = rand.input(dataframe[,col])
  } 
  return(dataframe)
}

data = read.csv("../data/tema1/missing-data.csv", na.strings = "")
data$Income[data$Income == 0] = NA
data = random.impute.data.frame(data, c(1,2))

