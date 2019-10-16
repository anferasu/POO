Algoritmo sin_titulo
	num1 <- 0
	num2 <- 0
	num3 <- 0
	salida1 <- 0
	salida2 <- 0
	salida <- 0
	Escribir 'Ingrese Numero1'
	Leer num1
	Escribir 'Ingrese Numero2'
	Leer num2
	Escribir 'Ingrese Numero3'
	Leer num3
	Si num1<=num2 Y num2<=num3 Entonces
		salida1 <- num3
		salida2 <- num2
		salida3 <- num1
	SiNo
		Si num2<=num1 Y num1<=num3 Entonces
			salida1 <- num3
			salida2 <- num1
			salida3 <- num2
		SiNo
			Si num3<=num1 Y num1<=num2 Entonces
				salida1 <- num2
				salida2 <- num1
				salida3 <- num3	
			SiNo
				Si num1<=num3 Y num3<=num2 Entonces
					salida1 <- num2
					salida2 <- num3
					salida3 <- num1	
				SiNo
					Si num3<=num1 Y num3>=num2 Entonces
						salida1 <- num1
						salida2 <- num3
						salida3 <- num2	
					SiNo
						salida1 <- num1
						salida2 <- num2
						salida3 <- num3	
					FinSi
				FinSi
			FinSi
		FinSi
	FinSi
	Escribir 'ordenar numeros de forma descendente',salida1,' ',salida2,' ',salida3
FinAlgoritmo

