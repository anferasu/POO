Algoritmo sin_titulo
	num1 <- 0
	num2 <- 0
	num3 <- 0
	Escribir 'Digite numero 1'
	Leer num1
	Escribir 'Digite numero 2'
	Leer num2
	Escribir 'Digite numero 3'
	Leer num3
	Si num1<num2 Y num2<num3 Entonces
		resultado <- num1
	SiNo
		Si num2<num3 Entonces
			resultado <- num2
		SiNo
			resultado <- num3
		FinSi
	FinSi
	Escribir 'El menor valor digitado es: ' resultado
FinAlgoritmo

