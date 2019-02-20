library(mice)

housing.data = read.csv("../data/tema1/housing-with-missing-value.csv", header = TRUE, stringsAsFactors = FALSE)

columns = c("ptratio","rad")

# Construir un modelo de datos para intentar obtener valores de las dos variables que tienen NAs
imputed_data = mice(housing.data[, names(housing.data) %in% columns],   # columnas del dataset a imputar
                    m = 5,                                              # Número de imputaciones por cada iteración
                    maxit = 50,                                         # Máximas iteraciones
                    method = "pmm",                                     # Predictive mean machine
                    seed = 2018                                         # Semilla
                    )
# pmm - comparación predictiva de medias
# logreg - regresión logística
# polyreg - regresión logística politómica
# polr - modelo de probabilidades proporcionales


summary(imputed_data)

# Sacamos todos los datos
complete.data = mice::complete(imputed_data) # Hay otra función complete en un paquete distinto del paquete 'mice'

housing.data$ptratio = complete.data$ptratio
housing.data$rad = complete.data$rad

anyNA(housing.data) # Devuelve TRUE si hay algún NA y FALSE en caso contrario


# Otro modo...
housing.data = read.csv("../data/tema1/housing-with-missing-value.csv", header = TRUE, stringsAsFactors = FALSE)
impute_arg = aregImpute(~ptratio + rad, data = housing.data, n.impute = 5)
impute_arg

impute_arg$imputed$rad
