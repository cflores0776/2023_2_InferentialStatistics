# Paso 1: Preparar los datos, en este caso ficticios
# Crear datos ficticios
set.seed(123) # Para reproducibilidad
comida <- round(runif(100, min=1, max=10))
atencion <- round(runif(100, min=1, max=10))
ambiente <- round(runif(100, min=1, max=10))
tiempo_espera <- round(runif(100, min=1, max=10))
precio <- round(runif(100, min=1, max=10))

# Crear el data frame
datos <- data.frame(Comida=comida, Atencion=atencion, Ambiente=ambiente, 
                    Tiempo_Espera=tiempo_espera, Precio=precio)

# Paso 2: Realizar el análisis factorial
# Cargar paquete stats (si aún no está cargado)
# install.packages("stats") # Descomenta esta línea si necesitas instalar el paquete
library(stats)

# Realizar el análisis factorial
modelo <- factanal(datos, factors = 2, scores = "regression", rotation = "varimax")

# Paso 3: Interpretar los resultados
# Obtener la matriz de cargas factoriales
matriz_cargas <- modelo$loadings
print(matriz_cargas)

