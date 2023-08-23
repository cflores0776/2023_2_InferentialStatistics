# Generación de datos ficticios
set.seed(42)

# Datos del grupo A (muestra 1)
grupo_A <- rnorm(50, mean = 35, sd = 5)

# Datos del grupo B (muestra 2)
grupo_B <- rnorm(45, mean = 40, sd = 6)

# Aplicación de la prueba de Kolmogorov-Smirnov
# Primero, combinamos ambas muestras
todos_los_datos <- c(grupo_A, grupo_B)

# Etiquetamos las muestras para distinguirlas
grupos <- c(rep("Grupo A", length(grupo_A)), rep("Grupo B", length(grupo_B)))

# Realizamos la prueba de Kolmogorov-Smirnov
ks_resultado <- ks.test(todos_los_datos, y = "pnorm", mean = mean(todos_los_datos), sd = sd(todos_los_datos))

# Mostramos los resultados
print(ks_resultado)
