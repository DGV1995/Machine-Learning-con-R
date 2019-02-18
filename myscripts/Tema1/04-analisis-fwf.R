students_data = read.fwf("../data/tema1/student-fwf.txt",
                         widths=c(4,15,20,15,4),
                         col.names=c("id","nombre","email","carrera","año")
                         ) # fixed width format
head(students_data)

students_data_header = read.fwf("../data/tema1/student-fwf-header.txt",
                                widths = c(4,15,20,15,4),
                                header = TRUE, 
                                sep = "\t",
                                skip = 2 # Se saltará las dos primeras líneas del fichero
                                )
head(students_data_header)

students_data_no_email = read.fwf("../data/tema1/student-fwf.txt",
                                  widths=c(4,15,-20,15,4),
                                  col.names=c("id","nombre", "carrera","año")
                                )
head(students_data_no_email)
