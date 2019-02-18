install.packages("jsonlite")
library(jsonlite)

dat.1 = fromJSON("../data/tema1/students.json") #Cargamos fichero json
dat.2 = fromJSON("../data/tema1/student-courses.json")

install.packages("curl")
library(curl)

url = "http://www.floatrates.com/daily/usd.json"
currencies = fromJSON(url)

currency.data = currencies$eur$name #Accedemos al atributo 'name' dentro de la variable 'eur'

head(dat.1)
dat.1$Email

dat.1[c(2,5,8),] #Accedemos a las filas 2, 5 y 8, y a todas las columnas
dat.1[, c(2,5)] #Accedemos a todas las filas, y las columnas 2 y 5

head(dat.2)
