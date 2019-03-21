library(naivebayes)
library(e1071)
library(caret)

# Naive-Bayes requiere que todas las variables sean categóricas

ep = read.csv("../data/tema3/electronics-purchase.csv")

set.seed(2018)
t.ids = createDataPartition(ep$Purchase, p = 0.67, list = F)

model = naiveBayes(Purchase ~ ., data = ep[t.ids,])
model

pred = predict(model, ep[-t.ids, ])

tab = table(ep[-t.ids, "Purchase"], pred, dnn = c("Actual", "Predicho"))
confusionMatrix(tab)
