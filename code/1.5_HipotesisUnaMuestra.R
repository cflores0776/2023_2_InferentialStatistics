# Cargar la librería 'tidyverse' para manipulación y visualización de datos
install.packages("tidyverse")
library(tidyverse)

# Generar datos ficticios
set.seed(123)  # Establecer una semilla para reproducibilidad
clientes <- data.frame(
  PrecioMenu = rnorm(30, mean = 100, sd = 10), # Precios generados aleatoriamente con media 100 y desviación estándar 10
  Satisfaccion = rnorm(30, mean = 8, sd = 1)   # Satisfacción generada aleatoriamente con media 8 y desviación estándar 1
)

# Realizar la prueba t de Student
precio_alto <- clientes$Satisfaccion[clientes$PrecioMenu > mean(clientes$PrecioMenu)]
precio_bajo <- clientes$Satisfaccion[clientes$PrecioMenu <= mean(clientes$PrecioMenu)]

t_result <- t.test(precio_alto, precio_bajo)
t_result

