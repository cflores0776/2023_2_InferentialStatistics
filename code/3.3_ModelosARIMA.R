install.packages("forecast")

# Cargar las bibliotecas
library(forecast)

# Generar datos ficticios
set.seed(123)
fecha <- seq(as.Date("2010-01-01"), by="months", length.out=60)
ventas <- cumsum(rnorm(60, mean=1000, sd=150))

# Crear una serie temporal
serie_temporal <- ts(ventas, frequency=12, start=c(2010, 1))

# Ajustar el modelo ARIMA
modelo_arima <- auto.arima(serie_temporal)

# Imprimir el resumen del modelo
summary(modelo_arima)

# Pronóstico para los próximos 12 meses
pronostico <- forecast(modelo_arima, h=12)

# Imprimir el pronóstico
print(pronostico)

