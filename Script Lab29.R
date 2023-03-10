#------------------LABORATORIO 29----------------------
#Uso de herramienta dplyr
#Sumar una cierta variable pero agrupado por otra variable (ejemplo PCI con location_name)

#Cargar paquetes
library(data.table)
library(dplyr)

#Cargar base de datos
choose.files()

#Creamos objeto llamado data2013
#Colocamos asignación (alt -) <- 
#El archivo se leerá con read.csv y se copia y pega la ruta del archivo
data2013 <- read.csv("C:\\Users\\Lenovo\\Documents\\GitHub\\LAB-29\\L29 input\\greenR_2013.csv")

#Para visualizar
data2013

#Se transforma a tabla de datos
#Signo de asiganción y debe leerlo as.date.table de data 2013
data2013 <- as.data.table(data2013)

#Para visualizar
data2013

#Para sabér qué clase de datos son se coloca class
class(data2013)
#En la consola se puede visualizar que es un datatable, también llamad dataframe

#Suma de variable agurpada por la categoría de la entidad
#Crear dataframe resultados. Sigo de asignación <- Proviene de data2013 y activamos operador pipe
#Se agrupan group_by por el bombre de la localidad
#Otro pipe %>%  para el summarise (la suma) de GCI_2013 que será igual a la suma de dicha variable
#na.rm significa que los valores faltantes se omitan, por lo que colocamos TRUE.
#También se requiere otra suma de GP_SINVCR. 
#El último sumarise es la variable GCP_2013 omitiendo valores faltantes.
#Por último, hacer conteo de las celdas
resultados2013 <- data2013 %>% 
  group_by(location_name) %>% 
  summarise(suma_GCI_2013 = sum(GCI_2013, na.rm = T),
            suma_GP_SINVCR = sum(GP_SINVCR, na.rm = T),
            suma_GCP_2013 = sum(GCP_2013, na.rm = T),
            count = n())

#Para visualizar
resultados2013

#------------------FIN LABORATORIO 29-----------------------
