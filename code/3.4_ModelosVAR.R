install.packages("vars")
library(vars)

# Generar datos ficticios con Publicidad y Clima poco correlacionados
set.seed(123)  # Para reproducibilidad de los resultados

publicidad <- seq(1000, 5000, length.out = 50)
clima <- seq(1, 35, length.out = 50)

ventas <- 2000 + 0.03 * publicidad + 0.005 * clima + rnorm(50, mean = 0, sd = 500)

# Agregar ruido a las variables Publicidad y Clima
publicidad <- publicidad + rnorm(5000, mean = 0, sd = 50)
clima <- clima + rnorm(5000, mean = 0, sd = 5)

# Crear un marco de datos
datos <- data.frame(Publicidad = publicidad, Clima = clima, Ventas = ventas)

# Guardar los datos en un archivo CSV
write.csv(datos, "datos_restaurante_VAR.csv", row.names = FALSE)

datos <- read.csv("datos_restaurante_VAR.csv")
cor(datos$Publicidad, datos$Clima)
ventas <- ts(datos$Ventas, start = 1)
publicidad <- ts(datos$Publicidad, start = 1)
clima <- ts(datos$Clima, start = 1)

restaurante_var <- VAR(cbind(ventas, publicidad, clima), p = 2)

summary(restaurante_var)

irf(restaurante_var, impulse = "publicidad", response = "ventas", response_type = "cumulative")

###Pronóstico
# Cargar el paquete vars
library(vars)

# Supongamos que ya has leído tus datos y estimado el modelo restaurante_var

# Hacer pronósticos para 10 períodos hacia adelante
forecast_horizon <- 10
forecast <- predict(restaurante_var, n.ahead = forecast_horizon)

# Imprimir los pronósticos
print(forecast)

# Cargar el paquete ggplot2 para visualización
library(ggplot2)

# Convertir los pronósticos a un marco de datos
forecast_df <- as.data.frame(forecast$fcst)
forecast_df$time <- 1:10


# Crear un gráfico para visualizar los pronósticos
ggplot(forecast_df, aes(x = time, y = ventas.fcst)) +
  geom_line(color = "blue", aes(y = .data$ventas.fcst, group = 1)) +
  geom_line(color = "red", aes(y = .data$publicidad.fcst, group = 2)) +
  geom_line(color = "green", aes(y = .data$clima.fcst, group = 3)) +
  labs(title = "Pronósticos de Ventas, Publicidad y Clima",
       x = "Período",
       y = "Valor") +
  theme_minimal()


