# Instala y carga los paquetes necesarios
install.packages("tidyverse")
library(tidyverse)
# Instala y carga el paquete necesario
install.packages("lubridate")
library(lubridate)

# Creación de datos ficticios para el ejercicio
set.seed(123)  # Para reproducibilidad de los resultados

fechas <- seq(as.Date("2023-01-01"), as.Date("2023-07-31"), by = "days")
ventas <- rnorm(length(fechas), mean = 1000, sd = 700)

# Creación del dataframe y guardado como archivo CSV
datos <- data.frame(fecha = fechas, ventas = ventas)
write.csv(datos, "datos_restaurante.csv", row.names = FALSE)

# Visualización de los primeros registros del dataframe
head(datos)




# Carga los datos (supongamos que los datos están en un archivo CSV llamado "datos_restaurante.csv")
datos <- read.csv("datos_restaurante.csv")

# Visualiza los primeros registros de los datos
head(datos)

# Grafica de la serie temporal de ventas
ggplot(datos, aes(x = fecha, y = ventas)) +
  geom_line() +
  labs(title = "Serie Temporal de Ventas en el Restaurante",
       x = "Fecha",
       y = "Ventas")

# Cargar la paleta de colores
library(viridis)

# Mejora de la gráfica de la serie temporal de ventas
ggplot(datos, aes(x = fecha, y = ventas)) +
  geom_line(color = "dodgerblue") +
  geom_smooth(method = "lm", color = "darkorange", se = FALSE) +
  geom_text(data = subset(datos, ventas > 1200),
            aes(label = ventas, color = "Ventas destacadas"), 
            hjust = 0, vjust = -0.5, show.legend = FALSE) +
  labs(title = "Serie Temporal de Ventas en el Restaurante",
       x = "Fecha",
       y = "Ventas") +
  scale_color_manual(values = c("darkorange", "dodgerblue")) +
  theme_minimal() +
  theme(legend.position = "top")

# Mejora de la gráfica de la serie temporal de ventas con línea de tendencia
ggplot(datos, aes(x = fecha, y = ventas)) +
  geom_line(color = "dodgerblue") +
  geom_smooth(method = "lm", color = "darkorange", se = FALSE) +
  labs(title = "Serie Temporal de Ventas en el Restaurante",
       x = "Fecha",
       y = "Ventas") +
  theme_minimal()


# Mejora de la gráfica con escala reducida en el eje y
ggplot(datos, aes(x = fecha, y = ventas)) +
  geom_line(color = "dodgerblue") +
  geom_smooth(method = "lm", color = "darkorange", se = FALSE) +
  labs(title = "Serie Temporal de Ventas en el Restaurante",
       x = "Fecha",
       y = "Ventas") +
  scale_y_continuous(labels = scales::comma_format(scale = 1e-3),  # Cambia a miles
                     breaks = seq(0, 2000, by = 500)) +  # Define las marcas del eje
  theme_minimal()


# Prueba de Breusch-Pagan para detectar la heterocedasticidad
library(lmtest)

#Remover filas con valores NA en la variable 'ventas'
datos <- datos[complete.cases(datos$ventas), ]
modelo <- lm(ventas ~ fecha, data = datos)
bptest(modelo, studentize = FALSE)

# Aplicación de la transformación logarítmica a las ventas
datos$log_ventas <- log(datos$ventas)

# Grafica de la serie temporal de ventas transformadas
ggplot(datos, aes(x = fecha, y = log_ventas)) +
  geom_line() +
  labs(title = "Serie Temporal de Ventas Transformadas en el Restaurante",
       x = "Fecha",
       y = "Log(Ventas)")
