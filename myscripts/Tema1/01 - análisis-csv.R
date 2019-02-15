auto = read.csv("../data/tema1/auto-mpg.csv", header = TRUE)
head(auto, 10)

#read.csv2() == read.csv("filename", sep=";", dec=",")

auto_no_header = read.csv("../data/tema1/auto-mpg-noheader.csv", header = FALSE)
head(auto_no_header)

