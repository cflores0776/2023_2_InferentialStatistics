# Instala y carga la biblioteca ggplot2 si no está instalada
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
library(ggplot2)

# Instala y carga las bibliotecas necesarias
install.packages("vars")

library(vars)

# Carga los datos ficticios
data <- data.frame(
  fecha = seq(as.Date("2022-01-01"), by = "months", length.out = 24),
  ingresos = c(12000, 13000, 13500, 14000, 15000, 16000, 17000, 18000, 19000, 20000, 21000, 22000, 23000, 24000, 25000, 26000, 27000, 28000, 29000, 30000, 31000, 32000, 33000, 34000, 12000, 13000, 13500, 14000, 15000, 16000, 17000, 18000, 19000, 20000, 21000, 22000, 23000, 24000, 25000, 26000, 27000, 28000, 29000, 30000, 31000, 32000, 33000, 34000),
  clientes = c(350, 360, 370, 380, 390, 400, 410, 420, 430, 440, 450, 460, 470, 480, 490, 500, 510, 520, 530, 540, 550, 560, 570, 580, 350, 360, 370, 380, 390, 400, 410, 420, 430, 440, 450, 460, 470, 480, 490, 500, 510, 520, 530, 540, 550, 560, 570, 580)
)

# Crea un gráfico de línea para los ingresos y clientes en función de la fecha
ggplot(data, aes(x = fecha)) +
  geom_line(aes(y = ingresos, color = "Ingresos"), size = 1) +
  geom_line(aes(y = clientes, color = "Clientes"), size = 1) +
  labs(title = "Ingresos y Clientes en el Restaurante",
       x = "Fecha",
       y = "Valor") +
  scale_color_manual(values = c("Ingresos" = "blue", "Clientes" = "red")) +
  theme_minimal()

# Convierte los datos a series temporales
ingresos_ts <- ts(data$ingresos, start = c(2022, 1), frequency = 12)
clientes_ts <- ts(data$clientes, start = c(2022, 1), frequency = 12)

# Realiza la prueba de cointegración
coint_test <- ca.jo(data.frame(ingresos = ingresos_ts, clientes = clientes_ts), type = "trace", K = 2)

# Ajusta un modelo VEC
vec_model <- cajorls(coint_test)
summary(vec_model)

vec_model
