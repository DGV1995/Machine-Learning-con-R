# Análisis del discriminante lineal

install.packages("MASS")
library(MASS)
library(caret)

bn = read.csv("../data/tema3/banknote-authentication.csv")
bn$class = factor(bn$class)

set.seed(2018)
t.ids = createDataPartition(bn$class, p = 0.7, list = F)

model = lda(bn[t.ids,1:4], bn[t.ids, "class"] ) # Parámetros de entrada y de salida
# model = lda(class ~ ., data = bn[t.ids, ]) --> Vale de las dos formas!

bn[t.ids, "Pred"] = predict(model, bn[t.ids, 1:4])$class

table(bn[t.ids, "class"], bn[t.ids, "Pred"], dnn = c("Actual", "Predicho"))

bn[-t.ids, "Pred"] = predict(model, bn[-t.ids, 1:4])$class
table(bn[-t.ids, "class"], bn[-t.ids, "Pred"], dnn = c("Actual", "Predicho"))
