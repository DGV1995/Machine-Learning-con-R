auto = read.csv("../data/tema2/auto-mpg.csv")

auto$cylinders = factor(auto$cylinders, 
                        levels = c(3,4,5,6,8), 
                        labels = c("3cil","4cil","5cil","6cil","8cil")
                        )

attach(auto) # Para ahorrarnos el poner todo el rato el símbolo '$'

head(cylinders)

# Histograma de frecuencias
hist(acceleration, main = "Histograma de las aceleraciones", col = rainbow(12),
     xlab = "Aceleración", ylab = "Frecuencias", breaks = 16)

hist(mpg, breaks = 16, prob = T)
lines(density(mpg))

# Boxplots
boxplot(mpg, xlab = "Millas por Galeón")
boxplot(mpg ~ model_year, xlab = "Millas por Galeón (por año)")
boxplot(mpg ~ cylinders, xlab = "Consumo por número de cilindros")
boxplot(auto)

# Scatterplot
plot(mpg ~ horsepower, xlab = "Caballos de potencia", ylab = "Millas por galeón", type = "n") # n = none
linearmodel = lm(mpg ~ horsepower)
abline(linearmodel) # Recta de regresión

# Agregar colores para cada cilindrada
with(subset(auto, cylinders=="8cil"), points(horsepower, mpg, col = "red")) # De auto, coge los valores '8cil' de la columna 'cylinders'. Eje x = 'horsepower', Eje y = 'mpg'
with(subset(auto, cylinders=="6cil"), points(horsepower, mpg, col = "yellow"))
with(subset(auto, cylinders=="5cil"), points(horsepower, mpg, col = "green"))
with(subset(auto, cylinders=="4cil"), points(horsepower, mpg, col = "blue"))
with(subset(auto, cylinders=="3cil"), points(horsepower, mpg, col = "black"))

# Matriz de scartterplots
pairs(~ mpg + displacement + horsepower + weight)

# Combinación de plots con par
old.par = par()
old.par

par(mfrow = c(1,2)) # Defino la representación con una fila y dos columnas

with(auto, {
  plot(mpg ~ weight, main = "Peso vs Consumo")
  plot(mpg ~ acceleration, main = "Aceleración vs Consumo")
})

par(old.par) # Volvemos a la representación original





