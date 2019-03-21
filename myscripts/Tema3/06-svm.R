install.packages("e1071") # Librería para SVM
library(caret)
library(e1071)

banknote = read.csv("../data/tema3/banknote-authentication.csv")
banknote$class = factor(banknote$class)

set.seed(2018)
t.ids = createDataPartition(banknote$class, p=0.7, list=F)

# Creamos el modelo para clasificar 'class' en función del resto de variables (.) utilizando el conjunto de entrenamiento
model = svm(class ~ ., data = banknote[t.ids, ])

table(banknote[t.ids, "class"], fitted(model), dnn = c("Actual", "Predicho"))

pred = predict(model, banknote[-t.ids, ])

table(banknote[-t.ids,"class"], pred, dnn = c("Actual", "Predicho"))

plot(model, data = banknote[t.ids, ], skew ~ variance)
plot(model, data = banknote[-t.ids, ], skew ~ variance)

# Obtenemos los mejores valores 'gamma' y 'cost' para conseguir un modelo lo más ajustado posible
tuned = tune.svm(class ~ ., data = banknote[t.ids, ], gamma = 10^(-6:-1), cost = 10^(1:2)) # Comprueba el mejor valor de 'gamma' entre 10^-6 y 10^-1, y el valor valor del 'coste' entre 10^1 y 10^2
tuned
