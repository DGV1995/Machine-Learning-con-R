auto = read.csv("../data/tema1/auto-mpg.csv", header = TRUE, na.strings = "", stringsAsFactors = TRUE)
head(auto, 10)
# Los espacios en blanco que aparezcan en el csv se convertirán automáticamente en valores NA de R

# read.csv2() == read.csv("filename", sep=";", dec=",")

auto_no_header = read.csv("../data/tema1/auto-mpg-noheader.csv", header = FALSE)
head(auto_no_header)

auto_custom_header = read.csv("../data/tema1/auto-mpg-noheader.csv", header=FALSE, 
                              col.names = c("numero","millas_por_galeon","cilindrada","desplazamiento",
                                            "caballos_de_potencia","peso","aceleracion","año","modelo")
                              )
head(auto_custom_header)

who_from_internet = read.csv("https://frogames.es/course-contents/r/intro/tema1/WHO.csv")
head(who_from_internet)

# NA: not available
# na.strings="" -> solucionamos el problema en variables categóricas (strings)
# as.character()
