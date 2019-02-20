ozone.data = read.csv("../data/tema1/ozone.csv", stringsAsFactors = FALSE)

boxplot(ozone.data$pressure_height,
        main = "Pressure Height",   # Título del gráfico
        boxwex = 0.5                # Anchura de la caja 
        ) $out                      # Con '$out' nos saca los outliers por consola

# La línea gorda del medio es la mediana de los datos
# La línea fina de debajo es el primer cuartil (25%), mientras que la de arriba representa el tercer cuartil (75%)
# La distancia entre las lineas del tercer y primer cuantil es el rango intercuartílico (RI). Sirve para definir los bigotes
# La línea superior es el min(maximo, Q3 + 1.5 RI)
# La línea inferior es el max(mínimo, Q1 - 1.5 RI)
# Las bolitas de abajo son los outliers (valores que se salen de los estándar)

boxplot(pressure_height ~ Month,      # Presión en función del mes
        data = ozone.data,
        main = "Pressure Height per Month"
        ) 

boxplot(ozone_reading ~ Month,
        data = ozone.data,
        main = "Ozone reading per Month"
        ) $out                             

mtext("Hola")


# Intercambio de los outliers por valores conocidos (media, mediana, etc)
impute_outliers = function(column, removeNA = TRUE) {
  quantiles = quantile(column, c(0.05, 0.95), na.rm = removeNA) # Percentiles 5% y 95%
  column[column < quantiles[1]] = mean(column, na.rm = removeNA) # Si está debajo del percentil 5, lo sustituimos por la media
  column[column > quantiles[2]] = median(column, na.rm = removeNA) # Si está por encima del percentil 95, lo sustituimos por la mediana
  return (column)
}

imputed_data = impute_outliers(ozone.data$pressure_height)

par(mfrow = c(1, 2)) # Ordenar los gráficos --> Una fila, dos columnas (para colocar un gráfico al lado del otro)

boxplot(ozone.data$pressure_height, main = "Presión con ourliers")
boxplot(imputed_data, main = "Presión sin outliers")

# Remplazar outliers fuera del máximo y del mínimo de los valores
replace_outliers = function(column, removeNA = TRUE) {
  qrts = quantile(column, probs = c(0.25, 0.75), na.rm = removeNA)
  caps = quantile(column, probs = c(0.05, 0.95), na.rm = removeNA)
  iqr = qrts[2] - qrts[1]  # Rango interquartílico
  h = 1.5*iqr               # altura
  column[column < qrts[1] - h] = caps[1]
  column[column > qrts[2] + h] = caps[2]
  return (column)
}

par(mfrow = c(1,2))
boxplot(ozone.data$pressure_height, main = "Presión con ourliers")
capped_pressure_height = replace_outliers(ozone.data$pressure_height)
boxplot(capped_pressure_height, main = "Presión sin outliers")  
  
  
