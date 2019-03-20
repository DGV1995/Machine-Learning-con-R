install.packages("randomForest")
library(randomForest)
library(caret)

banknote = read.csv("../data/tema3/banknote-authentication.csv")
head(banknote)

banknote$class = factor(banknote$class)

set.seed(2018)

training.ids = createDataPartition(banknote$class, p = 0.7, list = F)

# Construimos el modelo
model = randomForest(x = banknote[training.ids, 1:4], y = banknote[training.ids, "class"], # x = variables predictoras, y = variable a predecir o clasificar
                     ntree = 500,  # Número de árboles (por defecto son 500)
                     keep.forest = TRUE)

pred = predict(model, banknote[-training.ids, ])

table(banknote[-training.ids, "class"], pred, dnn = c("Actual", "Predicho"))

library(ROCR)
probs = predict(model, banknote[-training.ids, ], type = "prob")
head(probs)
pred = prediction(probs[, 2], banknote[-training.ids, "class"])
perf = performance(pred, "tpr", "fpr")
plot(perf)
