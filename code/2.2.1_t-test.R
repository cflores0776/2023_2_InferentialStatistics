# Datos ficticios de satisfacción del cliente
sucursal_A <- c(8, 7, 9, 6, 7, 8, 9, 6, 7, 8)
sucursal_B <- c(7, 6, 8, 5, 6, 7, 8, 5, 6, 7)

# Realizar t-test para muestras independientes
result <- t.test(sucursal_A, sucursal_B)

# Ver el resultado del t-test
print(result)
