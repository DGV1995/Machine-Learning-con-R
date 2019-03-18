data = read.csv("../data/tema2/daily-bike-rentals.csv")

data$season = factor(data$season,
                     levels = c(1,2,3,4),
                     labels = c("Invierno", "Primavera", "Verano", "Otoño")
                     )

data$workingday = factor(data$workingday,
                         levels = c(0, 1),
                         labels = c("Festivo", "De trabajo")
                         )

data$weathersit = factor(data$weathersit,
                         level = c(1,2,3),
                         labels = c("Despejado", "Nublado", "Lluvia/Nieve ligera")
                         )

attach(data)

par(mfrow = c(2,2))

winter = subset(data, season == "Invierno")$cnt
spring = subset(data, season == "Primavera")$cnt
summer = subset(data, season == "Verano")$cnt
fall = subset(data, season == "Otoño")$cnt


hist(winter, prob = TRUE, xlab = "Alquier diario en invierno", main = "")
lines(density(winter))
abline(v = mean(winter), col = "red") # 'v' quiero decir 'vertical'
abline(v = median(winter), col = "blue")

hist(spring, prob = TRUE, xlab = "Alquier diario en primavera", main = "")
lines(density(spring))
abline(v = mean(spring), col = "red") # 'v' quiero decir 'vertical'
abline(v = median(spring), col = "blue")

hist(summer, prob = TRUE, xlab = "Alquier diario en verano", main = "")
lines(density(summer))
abline(v = mean(summer), col = "red") # 'v' quiero decir 'vertical'
abline(v = median(summer), col = "blue")

hist(fall, prob = TRUE, xlab = "Alquier diario en otoño", main = "")
lines(density(fall))
abline(v = mean(fall), col = "red") # 'v' quiero decir 'vertical'
abline(v = median(fall), col = "blue")