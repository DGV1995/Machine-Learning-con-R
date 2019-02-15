install.packages("XML") # descargar la librería
library(XML)            # cargar la librería

url = "../data/tema1/cd_catalog.xml"
xmldoc = xmlParse(url) # Crea una posición de memoria que localiza el fichero XML
                       # XMLInternalDocument

rootNode = xmlRoot(xmldoc) # <CATALOG>
rootNode[1] # Accedemos al primer elemento del nodo raíz
rootNode[2]

cds_data = xmlSApply(rootNode, function(x) xmlSApply(x, xmlValue)) # Creamos el dataset con los valores del XML
cds_catalog = data.frame(t(cds_data), row.names=NULL) # La función t traspone el dataset

head(cds_catalog, 10)
cds_catalog[1:5,]

# xpathSApply()
# getNodeSet()

population_url = "../data/tema1/WorldPopulation-wiki.htm"
tables = readHTMLTable(population_url)

most_populated = tables[[6]] # Es una lista de listas, por eso el doble corchete
head(most_populated)

custom_table = readHTMLTable(population_url, which = 6) #Con wich indicamos la tabla que queremos
head(custom_table)
