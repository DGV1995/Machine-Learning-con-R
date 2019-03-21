library(nnet)
library(caret)

# Las redes neuronales requieres que las variables predictoras sean numéricas y que la variable a predecir sea binaria (0,1)

banknote = read.csv("../data/tema3/banknote-authentication.csv")

banknote$class = factor(banknote$class)

t.ids = createDataPartition(banknote$class, p = 0.7, list = F)

model = nnet(class ~ .,  # Fórmula de trabajo (Variable 'class' en función del resto)
             data = banknote[t.ids, ], 
             size = 3,   # Número de capas ocultas con las que debe trabajar la red neuronal
             maxit = 10000,   # Máximo número de iteraciones
             decay = 0.001,  # Controlar el overfiting (indicar un valor bajo)
             rang = 0.05,   # Rango de pesos iniciales que hay que añadir a la red neuronal desde el principio
             na.action = na.omit,  # Qué acción realizar con los NAs que haya en el modelo (si los hay)
             skip = TRUE
             )
# rang * max(|variables|) ~ 1 (IMPORTANTE) --> 0.05 * |17.92| ~ 1

apply(banknote, 2, max)

pred = predict(model, newdata = banknote[-t.ids, ], type = "class")

table(banknote[-t.ids, "class"], pred, dnn = c("Actual", "Predicho"))

library(ROCR)
pred2 = predict(model, newdata = banknote[-t.ids,], type = "raw")

perf = performance(prediction(pred2, banknote[-t.ids, "class"]), "tpr", "fpr")
plot(perf)
