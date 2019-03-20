install.packages("ROCR")
library(ROCR)

data1 = read.csv("../data/tema3/roc-example-1.csv")
data2 = read.csv("../data/tema3/roc-example-2.csv")

# 0 = fallo
# 1 = éxito
pred1 = prediction(data1$prob, data1$class) # Nos predice la columna 'prob' en función de la columna 'class'
perf1 = performance(pred1, "tpr", "fpr") # True positive rate, False positive rate --> Será nuestro medidor de la eficiencia

plot(perf1)
lines(par()$usr[1:2], par()$usr[3:4]) # Diagonal del cuadrado unidad

prob.cuts.1 = data.frame(cut = perf1@alpha.values[[1]],
                         fpr = perf1@x.values[[1]],
                         tpr = perf1@y.values[[1]])
head(prob.cuts.1)
tail(prob.cuts.1)

prob.cuts.1[prob.cuts.1$tpr >= 0.8,]



pred2 = prediction(data2$prob, data2$class, label.ordering = c("non-buyer", "buyer"))
perf2 = performance(pred2, "tpr", "fpr")

plot(perf2)
lines(par()$usr[1:2], par()$usr[3:4])