Algoritmo sin_titulo
	num1 <- 0
	num2 <- 0
	resultado <- 0
	Escribir 'Digite numero 1'
	Leer num1
	Escribir 'Digite numero 2'
	Leer num2
	Si num1==num2 Entonces
		resultado <- 0
	SiNo
		Si num1>num2 Entonces
			resultado <- num1
		SiNo
			resultado <- num2
		FinSi
	FinSi
	Si resultado == 0 Entonces
		Escribir 'los datos son iguales'	
	SiNo
		Escribir 'El numero mayor es: ',resultado
	FinSi
FinAlgoritmo

