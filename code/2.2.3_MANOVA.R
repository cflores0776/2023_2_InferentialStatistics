install.packages("car")
# Cargar la librería necesaria para el MANOVA
library(stats)
library(car)  # Cargar el paquete "car"


# Crear un marco de datos con datos ficticios
data <- data.frame(
  Grupo = rep(c("Grupo A", "Grupo B", "Grupo C"), each = 30),
  Entradas = c(4, 5, 6, 5, 6, 7, 3, 4, 5, 4,
               6, 7, 8, 7, 8, 9, 5, 6, 7, 6,
               3, 4, 5, 4, 5, 6, 2, 3, 4, 3, 4, 5, 6, 5, 6, 7, 3, 4, 5, 4,
               6, 7, 8, 7, 8, 9, 5, 6, 7, 6,
               3, 4, 5, 4, 5, 6, 2, 3, 4, 3, 4, 5, 6, 5, 6, 7, 3, 4, 5, 4,
               6, 7, 8, 7, 8, 9, 5, 6, 7, 6,
               3, 4, 5, 4, 5, 6, 2, 3, 4, 3),
  PlatoPrincipal = c(8, 7, 6, 7, 6, 5, 9, 8, 7, 8,
                     5, 4, 3, 4, 5, 6, 2, 3, 4, 3,
                     7, 8, 9, 8, 7, 6, 5, 4, 3, 4, 8, 7, 6, 7, 6, 5, 9, 8, 7, 8,
                     5, 4, 3, 4, 5, 6, 2, 3, 4, 3,
                     7, 8, 9, 8, 7, 6, 5, 4, 3, 4, 8, 7, 6, 7, 6, 5, 9, 8, 7, 8,
                     5, 4, 3, 4, 5, 6, 2, 3, 4, 3,
                     7, 8, 9, 8, 7, 6, 5, 4, 3, 4),
  Postres = c(6, 7, 8, 7, 8, 9, 5, 6, 7, 6,
              3, 4, 5, 4, 5, 6, 2, 3, 4, 3,
              4, 5, 6, 5, 6, 7, 3, 4, 5, 4, 6, 7, 8, 7, 8, 9, 5, 6, 7, 6,
              3, 4, 5, 4, 5, 6, 2, 3, 4, 3,
              4, 5, 6, 5, 6, 7, 3, 4, 5, 4, 6, 7, 8, 7, 8, 9, 5, 6, 7, 6,
              3, 4, 5, 4, 5, 6, 2, 3, 4, 3,
              4, 5, 6, 5, 6, 7, 3, 4, 5, 4)
)

# Realizar el análisis MANOVA
result_manova <- manova(cbind(Entradas, PlatoPrincipal, Postres) ~ Grupo, data = data)

# Resumen del análisis MANOVA
summary(result_manova, test = "Pillai")
