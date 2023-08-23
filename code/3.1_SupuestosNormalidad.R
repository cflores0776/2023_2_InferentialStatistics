# Instalar y cargar los paquetes necesarios
install.packages("ggplot2")
install.packages("moments")
library(ggplot2)
library(moments)

# Generar datos ficticios de ingresos diarios de un restaurante
set.seed(123)
ingresos <- rnorm(100, mean = 1000, sd = 150)

# Visualización de histograma y gráfico QQ
ggplot(data.frame(Ingresos = ingresos), aes(x = Ingresos)) +
  geom_histogram(binwidth = 50, fill = "blue", color = "black") +
  ggtitle("Histograma de Ingresos") +
  theme_minimal()

qqnorm(ingresos)
qqline(ingresos)

# Prueba de normalidad de Shapiro-Wilk
shapiro.test(ingresos)
