cp = read.csv("../data/tema3/college-perf.csv")

cp$Perf = ordered(cp$Perf, levels = c("Low", "Medium", "High")) # Damos un significado de orden a la columna
cp$Pred = ordered(cp$Pred, levels = c("Low", "Medium", "High"))

table = table(cp$Perf, cp$Pred, dnn = c("Actual", "Predecido")) # Hacemos una tabla de doble entrada con los valores reales y los predecidos (lo que se conoce como matriz de confusión)

table

prop.table(table) # Divide por el total para hallar la probabilidad de cada situación

round(prop.table(table, 1)*100, 2) # El '1' es para que cada fila sume exactamente 100, y el '2' para indicar que queremos 2 decimales

round(prop.table(table, 2)*100, 2) # Las columnas sumarán 100

barplot(table, legend = T, xlab = "Nota predecida por el modelo")

mosaicplot(table, main = "Eficiencia del modelo")

summary(table) # El p-valor valor indica dependencia entre el valor actual y el predicho. Es decir, que el modelo es eficiente.
