library(caret)

# Todas las variables predictoras deben ser numéricas y todas las variables de salida deben ser categóricas 0 o 1

housing = read.csv("../data/tema3/boston-housing-logistic.csv")
housing$CLASS = factor(housing$CLASS)

set.seed(2018)
t.ids = createDataPartition(housing$CLASS, p = 0.7, list = F)

model = glm(CLASS ~ ., data = housing[t.ids, ], family = binomial) # Clasificación verdadero o falso

summary(model)

# Probabilidad de éxito en función de los parámetros de clasificación
housing[-t.ids, "PROB_SUCCESS"] = predict(model, newdata = housing[-t.ids,], type = "response")

# Si la probabilidad de éxito es mayor al 50% lo catalogo como éxito (1), y si no como fracaso (0)
housing[-t.ids, "PRED_50"] = ifelse(housing[-t.ids, "PROB_SUCCESS"] >= 0.5, 1, 0)

table(housing[-t.ids, "CLASS"], housing[-t.ids, "PRED_50"], dnn = c("Actual", "Predicho"))
