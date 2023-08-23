install.packages("lavaan")
install.packages("semPlot")

set.seed(123)  # Establecemos una semilla para reproducibilidad

# Generamos datos ficticios para las variables latentes (calidad_comida, servicio_cliente, ambiente_restaurante)
n <- 100  # Número de clientes
calidad_comida <- rnorm(n, 8, 1)
servicio_cliente <- rnorm(n, 7, 1)
ambiente_restaurante <- rnorm(n, 8, 1)


sabor <- rnorm(n, 8, 1)
presentacion <- rnorm(n, 7, 1)
temperatura <- rnorm(n, 8, 1)

amabilidad <- rnorm(n, 8, 1)
rapidez <- rnorm(n, 7, 1)
conocimiento <- rnorm(n, 8, 1)

iluminacion <- rnorm(n, 8, 1)
musica <- rnorm(n, 7, 1)
decoracion <- rnorm(n, 8, 1)

# Generamos datos ficticios para las variables dependientes (satisfacción_general)
satisfaccion_general <- 0.3 * calidad_comida + 0.2 * servicio_cliente + 0.5 * ambiente_restaurante + rnorm(n, 0, 1)

# Creamos el dataframe con los datos ficticios
datos <- data.frame(calidad_comida, servicio_cliente, ambiente_restaurante, satisfaccion_general, sabor, presentacion, temperatura, amabilidad, rapidez, conocimiento, iluminacion, musica, decoracion)

library(lavaan)

# Especificamos el modelo
modelo <- '
  # Definimos las variables latentes y sus indicadores
  calidad_comida_lat =~ sabor + presentacion + temperatura
  servicio_cliente_lat =~ amabilidad + rapidez + conocimiento
  ambiente_restaurante_lat =~ iluminacion + musica + decoracion

  # Definimos las relaciones entre las variables latentes y la variable dependiente
  satisfaccion_general ~ 0.3 * calidad_comida + 0.2 * servicio_cliente + 0.5 * ambiente_restaurante
'

# Estimamos el modelo
modelo_estimado <- sem(modelo, data = datos)

# Instala o carga el paquete semPlot
if (!requireNamespace("semPlot", quietly = TRUE)) {
  install.packages("semPlot")
}
library(semPlot)

# Visualización del modelo
semPaths(modelo_estimado, edge.label.cex = 1.5)

modelo_estimado

# Visualización del modelo, marco error con whatlabels
semPaths(modelo_estimado, whatLabels = TRUE, edge.label.cex = 1.5)


