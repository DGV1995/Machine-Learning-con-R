clientes = c("Diego", "Pepe", "Pedro")
fechas = as.Date(c("2017-12-24", "2018-1-1", "2016-3-18")) # array de 3 fechas
pago = c(315, 192.55, 40.15)

pedidos = data.frame(clientes, fechas, pago) # cada una de las columnas
head(pedidos)

clientes_vip = c("Diego", "Pedro")

save(pedidos, clientes_vip, file = "../data/tema1/pedidos.Rdata") # guardamos un objeto de R en un fichero determinado
saveRDS(pedidos, file = "../data/tema1/pedidos.rds")

remove(pedidos)

load("../data/tema1/pedidos.Rdata")

orders = readRDS("../data/tema1/pedidos.rds") # con los objetos rds es necesario inicializarlos en una variable

data(iris)
data(cars)

View(iris) # necesario para ver los datos, si no no se cargan bien
View(cars)

# Guardar todos los objetos de la sesión
save.image(file = "../data/tema1/alldata.Rdata")

primes = c(2,3,5,7,11,13)
pow2 = c(2,4,8,16,32,64,128)
save(list = c("primes", "pow2"), file = "../data/tema1/primes_and_pow2.Rdata")

attach("../data/tema1/primes_and_pow2.Rdata") # Si el objeto cargado contiene una variable que ya ha sido cargada en el entorno, nos dará un error

