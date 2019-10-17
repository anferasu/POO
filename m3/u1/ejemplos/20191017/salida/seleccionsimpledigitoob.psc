Algoritmo sin_titulo
	Definir digito,resultado Como Caracter
	Escribir 'digito'
	Leer digito
	Si digito='o' Entonces
		Resultado <- 'o'
	SiNo
		Si digito='b' Entonces
			Resultado <- 'b'
		SiNo
			Resultado <- 'no es el digito correcto'
		FinSi
	FinSi
	Escribir 'Resultado: ' resultado
FinAlgoritmo

