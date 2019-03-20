# ACP = Análisis de Componentes Principales
# Sirve para ver qué domina dentro de un dataframe, cómo poder reducir dimensiones
# Es uno de los procesos que primero se deberían hacer

usarrests = read.csv("../data/tema3/USArrests.csv", stringsAsFactors = F)

rownames(usarrests) = usarrests$X
usarrests$X = NULL

head(usarrests)

apply(usarrests, 2, var) # Aplica, por columnas (2 = columnas, 1 = filas), la función varianza 

acp = prcomp(usarrests, center = T, scale = T)
acp

plot(acp, type = "l")

summary(acp) # PC1 y PC2 explican el 86% de los casos

biplot(acp, scale = 0)

pc1 = apply(acp$rotation[,1]*usarrests, 1, sum)
pc2 = apply(acp$rotation[,2]*usarrests, 1, sum)

usarrests$pc1 = pc1
usarrests$pc2 = pc2

usarrests[, 1:4] = NULL
