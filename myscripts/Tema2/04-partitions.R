install.packages("caret")
library(caret)

data = read.csv("../data/tema2/BostonHousing.csv")

training.ids = createDataPartition(data$MEDV, p = 0.8, list = FALSE) # devuelve aleatoriamente un array con el 80% de los datos del dataset

data.training = data[training.ids, ]
data.validation = data[-training.ids, ]

training.id.2 = createDataPartition(data$MEDV, p = 0.7, list = FALSE)
data.training.2 = data[training.id.2, ]
temp = data[-training.id.2, ]
validation.ids.2 = createDataPartition(temp$MEDV, p = 0.5, list = FALSE)
data.validation = temp[validation.ids.2, ]
data.testing = temp[-validation.ids.2, ]

# VARIABLES CATEGÓRICAS
data2 = read.csv("../data/tema2/boston-housing-classification.csv")
training.ids.3 = createDataPartition(data2$MEDV_CAT, p = 0.7, list = FALSE)
data.training.3 = data2[training.ids.3, ]
data.validation.3 = data2[-training.ids.3, ]


# Función para partir en dos trozos el dataframe
rda.cb.partition2 = function(dataframe, target.index, prob) {
  library(caret)
  training.ids = createDataPartition(dataframe[, target.index], p = prob, list = FALSE)
  data.training = dataframe[training.ids, ]
  data.validation = dataframe[-training.ids, ]
  list(train = data.training, validation = data.validation)
}

rda.cb.partition3 = function(dataframe, target.index, prob.train, prob.val) {
  library(caret)
  training.ids = createDataPartition(dataframe[, target.index], p = prob.train, list = FALSE)
  training = dataframe[training.ids, ]
  temp = dataframe[-training.ids, ]
  validation.ids = createDataPartition(temp[, target.index], p = prob.val, list = FALSE)
  validation = temp[validation.ids, ]
  testing = temp[-validation.ids, ]
  list(train = training, val = validation, test = testing)
}

data1 = rda.cb.partition2(data, 14, 0.8)
data3 = rda.cb.partition3(data2, 14, 0.7, 0.5)

head(data1$train)
head(data3$test)

sample1 = sample(data$CRIM, size = 40, replace = F)




