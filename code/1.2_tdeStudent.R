# Instala y carga el paquete "tidyverse" si aún no lo tienes
# install.packages("tidyverse")
library(tidyverse)


# Generar datos ficticios de ventas
set.seed(123) # Para reproducibilidad
dias_semana <- c(rep("Laborable", 30), rep("Fin de semana", 20))
ventas <- c(rnorm(30, mean = 100, sd = 20), rnorm(20, mean = 120, sd = 25))

# Crear un data frame con los datos
data <- data.frame(DiasSemana = dias_semana, Ventas = ventas)

# Visualizar la distribución de las ventas según los días de la semana
ggplot(data, aes(x = DiasSemana, y = Ventas)) +
  geom_boxplot() +
  labs(title = "Distribución de ventas por días de la semana",
       x = "Días de la semana",
       y = "Ventas")

# Realizar la prueba de t de Student
t_test_result <- t.test(Ventas ~ DiasSemana, data = data, var.equal = FALSE)

# Mostrar los resultados
t_test_result

# COMO EXPORTAR DATAFRAME A EXCEL
# Instala y carga la librería writexl si no está instalada
install.packages("writexl")
library(writexl)

# Tu dataframe data
# ...

# Especifica el nombre del archivo de Excel
nombre_archivo <- "meta1.2_data.xlsx"

# Exporta el dataframe a Excel
write_xlsx(data, path = nombre_archivo)

# SACAR MLA MEDIA POR GRUPOS
# Supongamos que tienes un dataframe llamado data
# con columnas DiasSemana y Ventas

# Calcular las medias por grupos independientes
medias_por_grupo <- aggregate(Ventas ~ DiasSemana, data = data, FUN = mean)

# Imprimir el resultado
print(medias_por_grupo)

# INTERVALOS DE CONFIANZA A LA MEDIA 2
# Supongamos que tienes un dataframe llamado data
# con columnas DiasSemana y Ventas

# Función para calcular el intervalo de confianza de la media
intervalo_confianza_media <- function(x) {
  t_test_result <- t.test(x, conf.level = 0.95)
  return(c(mean = mean(x), conf_interval = t_test_result$conf.int))
}

# Calcular los intervalos de confianza para cada grupo independiente
intervalos_confianza <- tapply(data$Ventas, data$DiasSemana, intervalo_confianza_media)

# Imprimir los resultados
print(intervalos_confianza)
