install.packages("XML") # descargar la librería
library(XML)            # cargar la librería

url = "../data/tema1/cd_catalog.xml"
xmldoc = xmlParse(url) # Crea una posición de memoria que localiza el fichero XML

rootNode = xmlRoot(xmldoc)
rootNode[1] # Accedemos al primer elemento del nodo raíz
