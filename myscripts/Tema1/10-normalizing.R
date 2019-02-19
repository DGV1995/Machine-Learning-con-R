housing = read.csv("../data/tema1/BostonHousing.csv")

housing.z = scale(housing)    # Normal(0,1) para estandarizar --> solo se puede aplicar cuando ninguna variable es categórica!
                              # Centramos los valores más probables entorno al 0 y los más raros más cerca del 1.
                              # Z = (X - S) / U, donde Z = valor normalizado, X = valor que se normaliza, S = media y U = desviación típica

housing.none = scale(housing, center = FALSE, scale = FALSE ) # center = FALSE quiere decir que no se resta la media
                                                              # scale = FALSE quiere decir que no se divide por la desviación típica

housing.mean = scale(housing, center = TRUE, scale = FALSE ) # resta la media pero no divide por la desviación típica --> ajuste al promedio
housing.sd = scale(housing, center = FALSE, scale = TRUE ) # divide por la desviación típica pero no resta la media 

# housing.none == housing
# sd = sqrt(sum(x^2)/(n-1))

scale.many = function(dataframe, cols) {
  names = names(dataframe)
  for (col in cols) {
    name = paste(names[col], "z", sep = ".")
    dataframe[name] = scale(dataframe[,col])
  }
  cat(paste("Hemos normalizado ", length(cols), " variable(s)"))
  dataframe
}

housing = scale.many(housing, c(1, 3, 5:8))
