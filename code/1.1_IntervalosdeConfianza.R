propinas <- c(15, 18, 20, 25, 12, 30, 22, 28, 15, 20)

# Calculamos la media muestral
media_muestral <- mean(propinas)

# Calculamos el error estándar
error_estandar <- sd(propinas) / sqrt(length(propinas))

# Encontramos el valor crítico de la t-distribución para un nivel de confianza del 95%
valor_critico <- qt(0.975, df = length(propinas) - 1)

# Calculamos el intervalo de confianza
intervalo_confianza <- c(media_muestral - valor_critico * error_estandar, 
                         media_muestral + valor_critico * error_estandar)

intervalo_confianza
