Algoritmo mayor_de_3_numeros
	// introduzco tres numeros y me devuelve el mayor
	num1 <- 0
	num2 <- 0
	num3 <- 0
	salida <- 0
	Escribir 'escribe el primer numero'
	Leer num1
	Escribir 'escribe el segundo numero'
	Leer num2
	Escribir 'escribe el tercer numero'
	Leer num3
	Si num1>num2 Y num1>num3 Entonces
		salida <- num1
	SiNo
		Si num2>num3 Entonces
			salida <- num3
		SiNo
			salida <- num2
		FinSi
	FinSi
	Escribir 'Elnumero mayor es:',salida
FinAlgoritmo

