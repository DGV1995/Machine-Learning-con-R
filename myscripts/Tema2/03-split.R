# Split/unsplit

data = read.csv("../data/tema2/auto-mpg.csv", stringsAsFactors = FALSE)

cars_list = split(data, data$cylinders) # Colección de dataframes
cars_list[1] 
cars_list[[1]]  # Dataframe donde los cilindros son 3

str(cars_list[[1]])
