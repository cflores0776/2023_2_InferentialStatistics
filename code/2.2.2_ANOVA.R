# Paso 1: Cargar los datos ficticios
ventas <- data.frame(
  dia_semana = factor(c("lunes", "miercoles", "viernes", "sabado")),
  ventas_diarias = c(5000, 5200, 4800, 5500)
)

# Paso 2: Realizar la prueba ANOVA
resultado_anova <- aov(ventas$ventas_diarias ~ ventas$dia_semana)

# Paso 3: Resumen del análisis
summary(resultado_anova)
resultado_anova

# Obtener los valores p y el estadístico F
p_value <- summary(resultado_anova)[["Pr(>F)"]][1]
f_statistic <- summary(resultado_anova)[["F value"]][1]

# Imprimir los resultados
cat("Valor p:", p_value, "\n")
cat("Estadístico F:", f_statistic, "\n")


#Segundo caso
# Paso 1: Cargar los datos ficticios
datos <- data.frame(
  dia_semana = factor(c("Lunes", "Lunes", "Lunes", "Martes", "Martes", "Miércoles", "Miércoles", "Miércoles", "Jueves", "Jueves", "Viernes", "Viernes", "Sábado", "Sábado", "Sábado")),
  tiempo_espera = c(15, 18, 17, 20, 22, 16, 18, 19, 21, 24, 23, 25, 14, 16, 18)
)

# Paso 2: Realizar la prueba ANOVA
resultado_anova <- aov(datos$tiempo_espera ~ datos$dia_semana)

# Paso 3: Resumen del análisis
summary(resultado_anova)

resultado_anova



