auto = read.csv("../data/tema2/auto-mpg.csv")

auto$cylinders = factor(auto$cylinders, 
                        levels = c(3,4,5,6,8), 
                        labels = c("3cil","4cil","5cil","6cil","8cil")
                        )

attach(auto) # Para ahorrarnos el poner todo el rato el símbolo '$'

head(cylinders)

# Histograma de frecuencias
hist(acceleration, main = "Histograma de las aceleraciones", col = "blue",
     xlab = "Aceleración", ylab = "Frecuencias", breaks = 16)

# Boxplots
boxplot(mpg, xlab = "Millas por Galeón")
boxplot(mpg ~ model_year, xlab = "Millas por Galeón (por año)")
boxplot(mpg ~ cylinders, xlab = "Consumo por número de cilindros")

# Scatterplot
plot(mpg ~ horsepower, xlab = "Caballos de potencia", ylab = "Millas por galeón")

# Matriz de scartterplots
pairs(~ mpg + displacement + horsepower + weight)
