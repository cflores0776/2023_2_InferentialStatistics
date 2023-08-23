# Crear una tabla de contingencia con los datos ficticios
#datos <- matrix(c(50, 30, 40, 25), nrow = 2, byrow = TRUE)
datos <- matrix(c(10, 1, 1, 10), nrow = 2, byrow = TRUE)
rownames(datos) <- c("Comida Rápida", "Comida Saludable")
colnames(datos) <- c("Lunes/Martes", "Miércoles/Jueves")

# Mostrar la tabla de contingencia
datos

# Realizar la prueba de Chi cuadrada
resultado_chi2 <- chisq.test(datos)

# Mostrar los resultados
print(resultado_chi2)
