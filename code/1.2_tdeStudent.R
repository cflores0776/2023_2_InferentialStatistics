# Instala y carga el paquete "tidyverse" si aún no lo tienes
# install.packages("tidyverse")
library(tidyverse)


# Generar datos ficticios de ventas
set.seed(123) # Para reproducibilidad
dias_semana <- c(rep("Laborable", 30), rep("Fin de semana", 20))
ventas <- c(rnorm(30, mean = 100, sd = 20), rnorm(20, mean = 120, sd = 25))

# Crear un data frame con los datos
data <- data.frame(DiasSemana = dias_semana, Ventas = ventas)

# Visualizar la distribución de las ventas según los días de la semana
ggplot(data, aes(x = DiasSemana, y = Ventas)) +
  geom_boxplot() +
  labs(title = "Distribución de ventas por días de la semana",
       x = "Días de la semana",
       y = "Ventas")

# Realizar la prueba de t de Student
t_test_result <- t.test(Ventas ~ DiasSemana, data = data, var.equal = FALSE)

# Mostrar los resultados
t_test_result
