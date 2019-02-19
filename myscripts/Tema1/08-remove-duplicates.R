family.salary = c(40000, 60000, 50000, 80000, 60000, 70000, 60000)
family.size = c(4, 3, 2, 2, 3, 4, 3)
family.car = c("Lujo", "Compacto", "Utilitario", "Lujo", "Compacto", "Compacto", "Compacto")

family = data.frame(family.salary, family.size, family.car)

family.unique = unique(family) # elimina los duplicados de las filas

duplicated(family) # TRUE si es una fila duplicada y FALSE si no lo es

family[duplicated(family), ] # nos devuelve las filas duplicadas y todas las columnas