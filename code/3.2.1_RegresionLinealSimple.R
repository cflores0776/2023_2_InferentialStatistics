# Cargar bibliotecas
library(tidyverse)

# Generar datos ficticios
set.seed(123)  # Para reproducibilidad de los resultados

temperatura <- seq(10, 30, length.out = 50)
clientes <- 30 + 2 * temperatura + rnorm(50, mean = 0, sd = 10)

# Crear un marco de datos
datos <- data.frame(Temperatura = temperatura, Clientes = clientes)

# Guardar los datos en un archivo CSV
write.csv(datos, "datos_restaurante.csv", row.names = FALSE)

# Cargar los datos
datos <- read.csv("datos_restaurante.csv")
head(datos)

# Realizar regresión lineal
modelo <- lm(Clientes ~ Temperatura, data = datos)

# Resumen del modelo
summary(modelo)

# Gráfico de dispersión con línea de regresión
ggplot(datos, aes(x = Temperatura, y = Clientes)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Regresión Lineal en el Restaurante",
       x = "Temperatura Exterior",
       y = "Número de Clientes")

nueva_temperatura <- 25
nuevos_datos <- data.frame(Temperatura = nueva_temperatura)
prediccion <- predict(modelo, nuevos_datos)
prediccion

