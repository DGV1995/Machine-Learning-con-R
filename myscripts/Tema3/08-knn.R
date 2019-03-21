install.packages("class")
library(caret)
library(class)

# K-Nearest Neighbors requiere que las variables predictoras sean numéricas y que la variable a predecir o clasificar sea categórica

vacation = read.csv("../data/tema3/vacation-trip-classification.csv", stringsAsFactors = TRUE)

# Normalizamos y escalamos las variables predictoras, ya que tienen una gran discrepancia entre el número de cifras
vacation$Income.z = scale(vacation$Income)
vacation$Family_size.z = scale(vacation$Family_size)

set.seed(2018)

t.ids = createDataPartition(vacation$Result, p = 0.5, list = F)
train = vacation[t.ids, ]
temp = vacation[-t.ids, ]

validation.ids = createDataPartition(temp$Result, p = 0.5, list = F)
val = temp[validation.ids, ]
test = temp[-validation.ids, ]

#Las columnas 4 y 5 son las que están normalizadas
pred1 = knn(train = train[,4:5], test = val[, 4:5], cl = train[, 3], k = 5) # Conjunto de entrenamiento, conjunto al cual catalogar, columna de clasificación
errMat1 = table(val$Result, pred1, dnn = c("Actual", "Predicho"))
errMat1

pred2 = knn(train[, c("Income.z", "Family_size.z")], test[, c("Income.z", "Family_size.z")], train[, "Result"], k = 1)
errMat2 = table(test$Result, pred2, dnn = c("Actual", "Predicho"))
errMat2


knn.automate = function(tr_predictors, val_predictors, tr_target, val_target, start_k, end_k) {
  for (k in start_k:end_k) {
    pred = knn(tr_predictors, val_predictors, tr_target, k)
    tab = table(val_target, pred, dnn = c("Actual", "Predicho"))
    cat(paste("Matriz de confusión para k = ", k, "\n"))
    cat("=======================================\n")
    print(tab)
    cat("---------------------------------------\n\n")
  }
}

knn.automate(train[, 4:5], val[, 4:5], train[, 3], val[, 3], 1, 8)

training.control = trainControl(method = "repeatedcv", number = 10, repeats = 3)
caret_knn_fit = train(Result ~ Family_size + Income, 
                      data = train,
                      method = "knn", # Tipo de algoritmo que quiero llevar a cabo
                      trControl = training.control,
                      preProcess = c("center", "scale"),
                      tuneLength = 10 # Longitud del ajuste
                      )

caret_knn_fit

pred5 = knn(train[, 4:5], val[, 4:5], train[, 3], k = 5, prob = T)
pred5





