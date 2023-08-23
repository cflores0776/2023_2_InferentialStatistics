# Generar datos ficticios
set.seed(123)  # Para reproducibilidad de los resultados

empleados <- sample(5:15, 50, replace = TRUE)
costo_ingredientes <- 100 + 10 * empleados + rnorm(50, mean = 0, sd = 20)
ingresos_diarios <- 800 + 50 * empleados + 20 * costo_ingredientes + rnorm(50, mean = 0, sd = 100)

# Crear un marco de datos
datos <- data.frame(Empleados = empleados, Costo_Ingredientes = costo_ingredientes, Ingresos_Diarios = ingresos_diarios)

# Guardar los datos en un archivo CSV
write.csv(datos, "datos_restaurante_RLM.csv", row.names = FALSE)



# Cargar paquetes necesarios
library(ggplot2)

# Cargar los datos desde el archivo CSV
data <- read.csv("datos_restaurante_RLM.csv")

# Visualizar los primeros registros de los datos
head(data)

# Ajustar el modelo de regresión lineal múltiple
model <- lm(ingresos_diarios ~ empleados + costo_ingredientes, data=data)

# Mostrar un resumen del modelo
summary(model)

# Realizar predicciones usando el modelo
new_data <- data.frame(empleados = c(8, 10, 12), costo_ingredientes = c(150, 180, 200))
predictions <- predict(model, newdata = new_data)

# Mostrar las predicciones
predictions
