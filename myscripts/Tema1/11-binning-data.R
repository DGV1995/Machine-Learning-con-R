students = read.csv(("../data/tema1/data-conversion.csv"))

# 3 intervalos --> (-inf, 10000], (1000,31000] y (31000, inf)
bp = c(-Inf, 10000, 31000, Inf) # Breakpoints (puntos de corte) --> Inf == infinito
names = c("Low", "Average", "High") # categorías --> n_categorías = n_breakpoints - 1

students$Income.cat = cut(students$Income, breaks = bp, labels = names) # Parámetros --> lo que se va a dividir, los puntos de corte y los nombres categóricos
# Esta función utiliza los rangos definidos por la variable 'breaks' para inferir el trozo al que pertenece cada una de las variables que intentamos catalogar

students$Income.cat2 = cut(students$Income, breaks = bp) # Así pone como 'labels' los intervalos indicados en los breakpoints

students$Income.cat3 = cut(students$Income, # Así R hace el corte equitativamente --> Tenemos que indicar el número de breakpoints que queremos
                           breaks = 4,
                           labels = c("Level 1", "Level 2", "Level 3", "Level 4"))

# Dummy variables
install.packages("dummies")
library(dummies)
students = read.csv(("../data/tema1/data-conversion.csv"))

students.dummy = dummy.data.frame(students, sep = ".") # Se hace sobre todo el dataframe (columnas categóricas)
names(students.dummy)

dummy(students$State, sep = ".") # Así se hace sobre una única columna categórica

dummy.data.frame(students, names = c("State", "Gender"), sep = ".") # Así se hace sobre varias columnas categóricas.
