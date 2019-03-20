install.packages(c("rpart", "rpart.plot", "caret"))
library(caret)
library(rpart) # Para crear los árboles de clasificación
library(rpart.plot) # Para generar un gráfico de dichos árboles

banknote = read.csv("../data/tema3/banknote-authentication.csv")

set.seed(2018)

training.ids = createDataPartition(banknote$class, p = 0.7, list = F)

# Construimos el modelo del árbol de decisión
model = rpart(class ~ .,                                            # Especificar las variables dependientes e independientes --> 'class' depende de todas las demás --> class ~ variance + skew + curtosis + entropy
              data = banknote[training.ids, ],                      # Dataframe que vamos a utilizar (conjunto de entrenamiento en este caso)
              method = "class",                                     # Árbol de clasificación
              control = rpart.control(minsplit = 20, cp = 0.01)     # Indicamos los parámetros adicionales que queremos que el método de clasificación tenga en cuenta
              )

model

# Pintamos el modelo
prp(model, 
    type = 2,            # Cada uno de los nodos quede etiquetado y la división queda debajo del nodo
    extra = 104, 
    nn = T,              # Mostrar número de los nodos
    fallen.leaves = T,   # Mostrar los nodos finales (hojas) abajo del gráfico
    faclen = 4,          # Abreviar el nombre de las clases 
    varlen = 8,          # Abreviar el nombre de las variables
    shadow.col = "gray"  # Añadir sombra a cada uno de los nodos (pijada)
    )

# Podar el árbol
model$cptable # Componentes principales junto a cierto parámetros

model.pruned = prune(model, model$cptable[6, "CP"])

prp(model.pruned, type = 2, extra = 104, nn = T, fallen.leaves = T, faclen = 4, varlen = 8, shadow.col = "red")

# Matriz de confusión
pred.pruned = predict(model.pruned, banknote[-training.ids, ], type = "class")

table(banknote[-training.ids, ]$class, pred.pruned, dnn = c("Actual", "Predicho"))

pred.pruned2 = predict(model.pruned, banknote[-training.ids, ], type = "prob")
head(pred.pruned2)

library(ROCR)
pred = prediction(pred.pruned2[, 2], banknote[-training.ids, "class"])
perf = performance(pred, "tpr", "fpr")
plot(perf)
