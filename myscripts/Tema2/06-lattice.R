auto = read.csv("../data/tema2/auto-mpg.csv", stringsAsFactors = F)
auto$cylinders = factor(auto$cylinders,
                        levels = c(3,4,5,6,8),
                        labels = c("3C", "4C", "5C", "6C", "8C")
                        )

library(lattice)

bwplot(~auto$mpg | auto$cylinders)
