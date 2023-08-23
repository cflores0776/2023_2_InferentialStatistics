# Paso 1: Crear el conjunto de datos ficticios
noches <- 1:10
camareros_noche <- c(3, 4, 3, 5, 4, 6, 5, 7, 6, 8)
ganancias_noche <- c(1500, 1800, 1600, 2000, 1900, 2200, 2100, 2500, 2300, 2700)

# Paso 2: Calcular la media de las variables
media_camareros <- mean(camareros_noche)
media_ganancias <- mean(ganancias_noche)

# Paso 3: Calcular la covarianza
covarianza <- cov(camareros_noche, ganancias_noche)

# Paso 4: Mostrar los resultados
print(paste("Media de camareros:", media_camareros))
print(paste("Media de ganancias:", media_ganancias))
print(paste("Covarianza entre camareros y ganancias:", covarianza))

correlacion <- cor(camareros_noche, ganancias_noche)
print(paste("Coeficiente de correlación entre camareros y ganancias:", correlacion))
