# Paso 1: Cargar el paquete necesario para la Prueba de Fisher
install.packages("exact2x2")
library(exact2x2)

# Paso 2: Crear una tabla de contingencia con los datos ficticios
plato_principal <- c("carne", "pescado", "vegetariano")
satisfaccion <- c("insatisfecho", "satisfecho", "muy satisfecho")

tabla_contingencia <- matrix(c(8, 10, 7,
                               5, 15, 12,
                               2, 6, 10), nrow = 3, byrow = TRUE,
                             dimnames = list(plato_principal, satisfaccion))

# Paso 3: Realizar la Prueba de Fisher
fisher_result <- fisher.test(tabla_contingencia)

# Paso 4: Obtener el p-valor
p_valor <- fisher_result$p.value

# Paso 5: Mostrar los resultados
print(fisher_result)
cat("El p-valor es:", p_valor, "\n")

# Paso 6: Interpretar los resultados
if (p_valor < 0.05) {
  cat("Existe una asociación significativa entre el tipo de plato principal y la satisfacción de los clientes.\n")
} else {
  cat("No se encontró una asociación significativa entre el tipo de plato principal y la satisfacción de los clientes.\n")
}

fisher_result
