install.packages(c("twitteR", "RColorBrewer", "plyr", "ggplot2", "devtools", "httr"))
require(devtools)
install_url("https://cran.r-project.org/src/contrib/Archive/Rstem/Rstem_0.4-1.tar.gz")
install_url("https://cran.r-project.org/src/contrib/Archive/slam/slam_0.1-37.tar.gz")
install_url("https://cran.r-project.org/src/contrib/Archive/sentiment/sentiment_0.2.tar.gz")

library(slam)
library(sentiment)
library(twitteR)

api_key = "dkWmvyHjJddSUvLbcDu6S4Jn2"
api_secret = "FrthdIREiZ4JUNQv64TJcAfIv2L2LM44UINAtUgq4izt7k2dR9"
access_token = "405520228-EljyK1X4rjZA5D4z5kA2f6EmYtMCbF22L8Fkl34d"
access_token_secret = "IwLDAnFvEvVje3YgpS3XK3bK0bjXbfpJuJWy83Vy8fXcY"

setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)

# Descargamos 1500 tweets
tweets = searchTwitter("machinelearning", n = 1500, lang = "en")

# Extraemos el texto de cada tweet
texts = sapply(tweets, function(x) x$getText())
head(texts)

# Función para limpiar un tweet
clean.data = function(text) {
  # eliminar retweets y @ del texto original
  text = gsub("(RT|VIA)((?:\\b||W*@\\w+)+)", "", text)     #gsub = substring
  # En el caso de ser contener 'RT' o 'VIA' seguido de tal vez un espacio en blanco (\\b) o @ o nada (\\w), lo elimino
  text = gsub("@\\w+", "", text)
  
  # eliminar signos de puntuación y dígitos del 0 al 9
  text = gsub("[[:punct:]]", "", text)
  text = gsub("[[:digit:]]", "", text)
  
  # eliminar links html, tabulaciones y espacios adicionales
  text = gsub("http\\w+", "", text)
  text = gsub("[\t]{2,}", "", text)
  text = gsub("^\\s+|\\s+$", "", text)
}

texts = clean.data(texts)
head(texts)

handle.error = function(x) {
  # crear el valor omitido
  y = NA
  # try_catch
  try_error = tryCatch(tolower(x), error = function(e) e)
  # si no hay error
  if(!inherits(try_error, "error"))
    y = tolower(x)
  # devolvemos el resultado
  return(y)
}

texts = sapply(texts, handle.error)
head(texts)

texts = texts[!is.na(texts)]
names(texts) = NULL

head(texts)


# Análisis de sentimiento
class_emotion = classify_emotion(texts, algorithm = "bayes", prior = 1)

head(class_emotion)

emotion = class_emotion[, 7] # BEST_FIT
emotion[is.na(emotion)] = "unknown"

head(emotion)

# Análisis de la polaridad
class_polarity = classify_polarity(texts, algorithm = "bayes", prior = 1)

head(class_polarity)

polarity = class_polarity[, 4]

head(polarity)

sent_df <- data.frame(text = texts, 
                      emotion = emotion, polarity = polarity, stringsAsFactors = F) # Las columnas serán 'text', 'emotion' y 'polarity'

sent_df <- within(sent_df, emotion <- factor(emotion, levels = names(sort(table(emotion), decreasing= T))))

library(RColorBrewer)
library(ggplot2)

ggplot(sent_df, aes(x=emotion))+
  geom_bar(aes(y=..count.., fill=emotion))+
  scale_fill_brewer(palette="Set2")+
  labs(x="Categorías de emoción", y="Número de Tweets")+
  labs(title="Análisis de Sentimiento acerca de Machine Learning")

ggplot(sent_df, aes(x=polarity))+
  geom_bar(aes(y = ..count.., fill = polarity))+
  scale_fill_brewer(palette = "Set3")+
  labs(x="Categorías de polaridad", y = "Número de Tweets")+
  labs(title="Análisis de Sentimiento acerca de Machine Learning")
  





