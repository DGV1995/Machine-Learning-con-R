s = seq(0.01, 0.99, 0.01) # Secuencia que empieza en 0.01, termina en 0.99, y da saltos de 0.01
s

qn = qnorm(s)
qn

df = data.frame(p = s, q = qn)

sample = rnorm(200) # Distribución normal aleatoria (random norm) de 200 muestras
sample

quantile(sample, probs = s)

# qqnorm
trees # Dataframe de árboles
qqnorm(trees$Height)

qqnorm(randu$x)

# qqplot
randu # Dataframe de coordenadas que siguen una distribución normal (todos los puntos tienen la misma probabilidad de salir)
n = length(randu$x)
n
y = qunif(ppoints(n)) # Cuantiles de una distribución uniforme de n muestras
y

qqplot(y, randu$x)


chi3 = qchisq(ppoints(30), df = 3) # 30 puntos aleatorios sobre los que aplico una disribución de chi cuadrado con 3 grados de libertad
n30 = qnorm(ppoints(30))

qqplot(n30, chi3)


cauchy = qcauchy(ppoints(30))
qqplot(n30, cauchy)

par(mfrow = c(2,3))
x = seq(-3, 3, 0.01)
plot(x, dnorm(x))
plot(x, pnorm(x)) # Función de distribución acumulativa

plot (x,dchisq(x, df = 3))
plot(x, pchisq(x, df = 3))

plot(x, dcauchy(x))
plot(x, pcauchy(x))
